// ============================================================
// scraper.js — Playwright Google Maps & Website Email Crawler
// ScrapScrap Open Source Suite
//
// Round-robin niche rotation, spatial district targeting,
// CAPTCHA exponential backoff, and local store persistence.
// ============================================================

const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '../../.env') });
const fs = require('fs');
const crypto = require('crypto');
const cheerio = require('cheerio');
const { chromium } = require('playwright');
const store = require('../data/store');
const { matchNiche, matchClosestNiche, NICHE_MAP, isInstitutional, getNicheKeywords: getKeywordsForLocale } = require('./niches');
const EmailCrawlerPool = require('./crawler-pool');
const { cleanEmailAddress, verifyDomainMx, isDeliverableEmail } = require('./validator');
const { getSubDistricts, normalizeCountryKey, COUNTRY_ALIASES, findCountryForCity } = require('./spatial');

// ── Config from .env ──────────────────────────────────────────
const CITIES        = (process.env.SCRAPER_CITIES || '').split(',').map(s => s.trim()).filter(Boolean);
const MIN_REVIEWS   = Math.max(0, parseInt(process.env.SCRAPER_MIN_REVIEWS, 10) || 0);
const MIN_RATING    = parseFloat(process.env.SCRAPER_MIN_RATING) || 3.5;
const _rawQuota = parseInt(process.env.SCRAPER_DAILY_QUOTA, 10);
const DAILY_QUOTA   = (_rawQuota > 0) ? _rawQuota : Infinity; // 0 or unset = unlimited
const HEADLESS      = process.env.SCRAPER_HEADLESS !== 'false';
const SCROLL_DELAY  = parseInt(process.env.SCRAPER_SCROLL_DELAY_MS, 10) || 1000;
const MAX_PER_SEARCH = parseInt(process.env.SCRAPER_MAX_PER_SEARCH, 10) || 50;
const LOCALE        = process.env.SCRAPER_LOCALE || 'id';
const WEBHOOK_URL   = process.env.WEBHOOK_URL || '';
const NICHE_EMAIL_QUOTA = parseInt(process.env.SCRAPER_NICHE_EMAIL_QUOTA, 10) || 10;
const MAX_DEPTH     = parseInt(process.env.SCRAPER_MAX_DEPTH, 10) || 4; // pagination deepen cap per combo
const PASS_PAUSE_SECS = Math.max(1, parseInt(process.env.SCRAPER_PASS_PAUSE_SECONDS, 10) || 1);
process.setMaxListeners(50);

const SKIP_PAUSE_MS = Math.max(1, parseInt(process.env.SCRAPER_SKIP_PAUSE_MS, 10) || 10);
const FIND_PAUSE_MS = Math.max(10, parseInt(process.env.SCRAPER_FIND_PAUSE_MS, 10) || 30);

// ── Niche rotation order: prioritized high-density yield order (24 slugs) ──
const PREFERRED_NICHE_ORDER = [
  'gym', 'restaurant', 'dental', 'salon', 'hotel', 'cafe', 'autorental',
  'realestate', 'homeservice', 'creativestudio', 'barber', 'spa',
  'autodetailing', 'autowash', 'laundry', 'dessert', 'petcare',
  'medical', 'legal', 'cleaning', 'wedding', 'education', 'coworking', 'florist'
];
const NICHE_ORDER = [
  ...PREFERRED_NICHE_ORDER.filter(slug => Object.keys(NICHE_MAP).includes(slug)),
  ...Object.keys(NICHE_MAP).filter(slug => !PREFERRED_NICHE_ORDER.includes(slug))
];
function getNicheKeywords(slug, locale = 'en') {
  return getKeywordsForLocale(slug, locale);
}
function nicheKeyword(slug, index = 0, locale = 'en') {
  const kws = getNicheKeywords(slug, locale);
  return kws[index % kws.length];
}

// ── Module-level variables for graceful signal shutdown ────────
let activeBrowser = null;
let globalProgress = null;
let shuttingDown = false;
let isShuttingDown = false;
let crawlerPool = null;

// ── Robust Chromium Process Management & Anti-Zombie Reaper ─────
function getWorkerPidFilePath(id) {
  return path.join(STATE_DIR, `pid-${id}.json`);
}

function saveWorkerBrowserPid(id, pid) {
  if (!pid || typeof pid !== 'number') return;
  try {
    fs.writeFileSync(getWorkerPidFilePath(id), JSON.stringify({ pid, runId: id, timestamp: new Date().toISOString() }), 'utf-8');
  } catch (_) {}
}

function removeWorkerBrowserPid(id) {
  try {
    const pfile = getWorkerPidFilePath(id);
    if (fs.existsSync(pfile)) fs.unlinkSync(pfile);
  } catch (_) {}
}

function forceKillPidTree(pid) {
  if (!pid || typeof pid !== 'number') return;
  try {
    if (process.platform === 'win32') {
      const { execSync } = require('child_process');
      execSync(`taskkill /pid ${pid} /T /F >nul 2>&1`);
    } else {
      process.kill(-pid, 'SIGKILL');
    }
  } catch (_) {}
}

function cleanStaleWorkerBrowser(id) {
  try {
    const pfile = getWorkerPidFilePath(id);
    if (fs.existsSync(pfile)) {
      const data = JSON.parse(fs.readFileSync(pfile, 'utf8'));
      if (data && data.pid) {
        console.log(`[PROCESS REAPER] Reaping stale Chromium browser PID ${data.pid} from prior run (${id})...`);
        forceKillPidTree(data.pid);
        fs.unlinkSync(pfile);
      }
    }
  } catch (_) {}
}

const shutdown = async (signal, exitCode = 130) => {
  if (shuttingDown || isShuttingDown) return;
  shuttingDown = true;
  isShuttingDown = true;
  console.log(`\n[SHUTDOWN] ${signal} received. Saving progress...`);

  if (crawlerPool) {
    try {
      if (typeof crawlerPool.cancel === 'function') {
        crawlerPool.cancel();
      } else {
        crawlerPool.queue = [];
      }
    } catch (_) {}
  }

  if (globalProgress) {
    try { saveProgress(globalProgress); } catch (_) {}
  }

  if (activeBrowser) {
    const bProc = typeof activeBrowser.process === 'function' ? activeBrowser.process() : null;
    const bPid = bProc ? bProc.pid : null;
    try {
      await Promise.race([
        activeBrowser.close(),
        new Promise(r => setTimeout(r, 2000))
      ]);
    } catch (_) {}
    if (bPid) {
      forceKillPidTree(bPid);
    }
  }
  removeWorkerBrowserPid(RUN_ID);

  console.log('[SHUTDOWN] Clean exit. Goodbye.');
  process.exit(exitCode);
};

process.on('SIGINT', () => shutdown('SIGINT', 130));
process.on('SIGTERM', () => shutdown('SIGTERM', 130));

process.on('uncaughtException', (err) => {
  if (shuttingDown || isShuttingDown) return;
  const msg = err?.message || String(err);
  const name = err?.name || '';
  const code = err?.code || '';
  if (name === 'AbortError' || code === 'ECONNRESET' || code === 'ETIMEDOUT' || msg.includes('aborted') || msg.includes('socket hang up') || msg.includes('FetchError')) {
    return;
  }
  console.error('[UNCAUGHT EXCEPTION]', msg);
});

process.on('unhandledRejection', (reason) => {
  if (shuttingDown || isShuttingDown) return;
  const msg = reason?.message || String(reason);
  if (msg.includes('aborted') || msg.includes('ECONNRESET') || msg.includes('socket hang up') || msg.includes('FetchError') || msg.includes('ETIMEDOUT')) {
    return;
  }
  console.error('[UNHANDLED REJECTION]', msg);
});

// ── Paths ─────────────────────────────────────────────────────
const runIdRaw      = (process.env.SCRAPER_RUN_ID || '').trim().replace(/[\r\n]/g, '');
const runId         = (runIdRaw && runIdRaw !== 'global')
                        ? runIdRaw
                        : (CITIES.length > 0 ? `${LOCALE}-${CITIES.slice(0, 3).map(c => c.toLowerCase().replace(/[^a-z0-9]/g, '')).join('-')}` : 'global');
const RUN_ID        = runId;
const STATE_DIR     = path.join(__dirname, '../../data/state');
if (!fs.existsSync(STATE_DIR)) fs.mkdirSync(STATE_DIR, { recursive: true });
const PROGRESS_PATH = path.join(STATE_DIR, "progress-" + runId + ".json");
const PAUSE_PATH    = path.join(STATE_DIR, 'PAUSE');
const RESULTS_DIR   = path.join(__dirname, '../../data');

// ── Logging helpers ───────────────────────────────────────────
const LOG_FILE_PATH = path.join(__dirname, '../../logs', `${runId}.log`);
const tag = (t, msg) => {
  const line = `[${t}] ${msg}`;
  console.log(line);
  try {
    if (!fs.existsSync(path.dirname(LOG_FILE_PATH))) {
      fs.mkdirSync(path.dirname(LOG_FILE_PATH), { recursive: true });
    }
    fs.appendFileSync(LOG_FILE_PATH, `[${new Date().toLocaleString()}] ${line}\n`, 'utf-8');
  } catch (_) {}
};
const log = {
  queue:   (m) => tag('QUEUE',   m),
  rotation:(m) => tag('ROTATION',m),
  scraper: (m) => tag('SCRAPER', m),
  data:    (m) => tag('DATA',    m),
  skip:    (m) => tag('SKIP',    m),
  sync:    (m) => tag('SYNC',    m),
  captcha: (m) => tag('CAPTCHA', m),
  pause:   (m) => tag('PAUSE',   m),
  dedup:   (m) => tag('DEDUP',   m),
};

// ── Progress persistence ──────────────────────────────────────
function todayStr() {
  return new Date().toISOString().slice(0, 10); // YYYY-MM-DD
}

const SEEN_TXT_PATH = path.join(STATE_DIR, 'emails_seen.txt');
const PLACES_TXT_PATH = path.join(STATE_DIR, 'places_seen.txt');

// ── Lock-free atomic line appends with retry backoff for multi-worker safety ────
function safeAppendSync(filePath, line, maxAttempts = 5) {
  for (let attempt = 0; attempt < maxAttempts; attempt++) {
    try {
      fs.appendFileSync(filePath, line + '\n', 'utf-8');
      return true;
    } catch (err) {
      if (attempt === maxAttempts - 1) {
        tag('SCRAPER', `Failed appending to ${path.basename(filePath)} after ${maxAttempts} attempts: ${err.message}`);
        return false;
      }
      // Busy wait 5-25ms with random jitter to let lock release
      const jitterMs = 5 + Math.floor(Math.random() * 20);
      const start = Date.now();
      while (Date.now() - start < jitterMs) {}
    }
  }
  return false;
}

function appendPlaceSeen(pkey) {
  if (!pkey || typeof pkey !== 'string') return;
  const key = pkey.trim();
  if (!key) return;
  safeAppendSync(PLACES_TXT_PATH, key);
}

function appendEmailSeen(rawEmail) {
  const clean = cleanEmailAddress(rawEmail);
  if (!clean) return;
  safeAppendSync(SEEN_TXT_PATH, clean);
}

function loadProgress() {
  const blank = {
    date: todayStr(),
    scraped: 0,
    emailsScrapedToday: 0,
    synced: 0,
    skipped: 0,
    emailsSeen: [],
    businessesSeen: [],
    placesSeen: [],
    urlsSeen: [],
    websitesSeen: [],
    completedQueries: [], // current pass only; resets on wrap (orchestrator fallback)
    queueIndex: 0,        // legacy field, preserved but no longer drives flow
  };

  let progress = blank;

  if (fs.existsSync(PROGRESS_PATH)) {
    try {
      const raw = JSON.parse(fs.readFileSync(PROGRESS_PATH, 'utf-8'));
      if (raw.date !== todayStr()) {
        tag('QUEUE', `New day detected (was ${raw.date}, now ${todayStr()}). Resetting daily counters.`);
        raw.date = todayStr();
        raw.scraped = 0;
        raw.emailsScrapedToday = 0;
        raw.synced = 0;
        raw.skipped = 0;
        // Rotation state intentionally survives day boundaries (true resume).
      }
      raw.emailsScrapedToday = raw.emailsScrapedToday || 0;
      raw.emailsSeen = raw.emailsSeen || [];
      raw.businessesSeen = raw.businessesSeen || [];
      raw.placesSeen = raw.placesSeen || [];
      raw.urlsSeen = raw.urlsSeen || [];
      raw.websitesSeen = raw.websitesSeen || [];
      raw.completedQueries = raw.completedQueries || [];
      progress = raw;
    } catch (err) {
      tag('SCRAPER', `Corrupt progress.json, starting fresh: ${err.message}`);
    }
  }

  // Sync with emails_seen.txt for manual edits / backups.
  const emailSet = new Set(progress.emailsSeen.map(e => cleanEmailAddress(e)).filter(Boolean));
  if (fs.existsSync(SEEN_TXT_PATH)) {
    try {
      const content = fs.readFileSync(SEEN_TXT_PATH, 'utf-8');
      const lines = content.split(/\r?\n/);
      for (const line of lines) {
        const cleaned = cleanEmailAddress(line);
        if (cleaned) emailSet.add(cleaned);
      }
    } catch (err) {
      tag('SCRAPER', `Error reading emails_seen.txt: ${err.message}`);
    }
  }
  progress.emailsSeen = Array.from(emailSet);

  // Sync with places_seen.txt for global place key deduplication (streamlined memory)
  const placeSet = new Set(progress.placesSeen || []);
  (progress.urlsSeen || []).forEach(u => {
    const k = getPlaceKey(u);
    if (k) placeSet.add(k);
  });

  if (fs.existsSync(PLACES_TXT_PATH)) {
    try {
      const content = fs.readFileSync(PLACES_TXT_PATH, 'utf-8');
      const lines = content.split(/\r?\n/);
      // Load all known unique place keys into memory for comprehensive deduplication
      for (let i = 0; i < lines.length; i++) {
        const trimmed = lines[i].trim();
        if (trimmed) placeSet.add(trimmed);
      }
    } catch (err) {
      tag('SCRAPER', `Error reading places_seen.txt: ${err.message}`);
    }
  }
  progress.placesSeen = Array.from(placeSet);

  // Initialize / migrate round-robin rotation state (top-level fields)
  ensureRotationState(progress);

  // Write back to sync both files on startup
  saveProgress(progress);

  return progress;
}

let isSavingProgress = false;
let pendingSaveProgress = false;

function saveProgress(p) {
  if (isSavingProgress) {
    pendingSaveProgress = true;
    return;
  }
  isSavingProgress = true;
  pendingSaveProgress = false;

  try {
    if (p.urlsSeen && p.urlsSeen.length > 5000) {
      p.urlsSeen = p.urlsSeen.slice(-5000);
    }
    if (p.placesSeen && p.placesSeen.length > 50000) {
      p.placesSeen = p.placesSeen.slice(-50000);
    }
    if (p.websitesSeen && p.websitesSeen.length > 20000) {
      p.websitesSeen = p.websitesSeen.slice(-20000);
    }
    if (p.businessesSeen && p.businessesSeen.length > 50000) {
      p.businessesSeen = p.businessesSeen.slice(-50000);
    }
    p.updatedAt = new Date().toISOString();

    const tmpPath = PROGRESS_PATH + '.tmp';
    fs.writeFileSync(tmpPath, JSON.stringify(p, null, 2), 'utf-8');
    try {
      fs.renameSync(tmpPath, PROGRESS_PATH);
    } catch (err) {
      try { fs.writeFileSync(PROGRESS_PATH, JSON.stringify(p, null, 2), 'utf-8'); } catch (_) {}
      try { fs.unlinkSync(tmpPath); } catch (_) {}
    }

    writeTelemetry(p);
  } catch (err) {
    tag('SCRAPER', `Save progress error: ${err.message}`);
  } finally {
    isSavingProgress = false;
    if (pendingSaveProgress) {
      setImmediate(() => saveProgress(p));
    }
  }
}

function writeTelemetry(p) {
  try {
    const memUsage = process.memoryUsage();
    const heapUsedMb = Math.round(memUsage.heapUsed / (1024 * 1024));
    const rssMb = Math.round(memUsage.rss / (1024 * 1024));
    const telemetry = {
      runId: RUN_ID,
      activeNiche: p.currentNiche || 'idle',
      activeCity: p.currentCity || 'idle',
      scrapedLeads: p.scraped || 0,
      emailsScrapedToday: p.emailsScrapedToday || 0,
      synced: p.synced || 0,
      skipped: p.skipped || 0,
      memoryHeapMb: heapUsedMb,
      memoryRssMb: rssMb,
      updatedAt: new Date().toISOString()
    };
    const telemetryPath = path.join(STATE_DIR, `status-${RUN_ID}.json`);
    fs.writeFileSync(telemetryPath, JSON.stringify(telemetry, null, 2), 'utf-8');
  } catch (_) {}
}

// ── Round-robin rotation state helpers (top-level fields) ─────
function ensureRotationState(progress) {
  // ── Migration from intermediate nested rotation.* (defensive) ──
  if (progress.rotation && typeof progress.rotation === 'object') {
    const r = progress.rotation;
    if (progress.currentNicheIndex == null && Number.isInteger(r.nicheIndex)) progress.currentNicheIndex = r.nicheIndex;
    if (progress.passesCompleted == null && Number.isInteger(r.pass)) progress.passesCompleted = r.pass;
    if (!Array.isArray(progress.needsRetry) && Array.isArray(r.needsRetry)) progress.needsRetry = r.needsRetry;
    if (!progress.nicheEmailCount && r.nicheCollected) progress.nicheEmailCount = r.nicheCollected;
    if (!progress.perComboCursor && r.combos) progress.perComboCursor = r.combos;
    delete progress.rotation;
  }

  // ── Migration from legacy lastNiche pointer (pre-v3 progress files) ──
  if (!Number.isInteger(progress.currentNicheIndex)) {
    let startIdx = 0;
    if (progress.lastNiche) {
      const last = String(progress.lastNiche).toLowerCase();
      const idx = NICHE_ORDER.findIndex(slug =>
        slug.toLowerCase() === last || nicheKeyword(slug).toLowerCase() === last);
      if (idx !== -1) startIdx = (idx + 1) % NICHE_ORDER.length;
    }
    progress.currentNicheIndex = startIdx;
    if (progress.lastNiche) {
      log.rotation(`Migrated legacy progress → rotation resumes at niche ${startIdx + 1}/${NICHE_ORDER.length} (${NICHE_ORDER[startIdx]}).`);
    }
  }
  if (progress.currentNicheIndex < 0 || progress.currentNicheIndex > NICHE_ORDER.length) {
    progress.currentNicheIndex = 0;
  }

  if (!Number.isInteger(progress.passesCompleted) || progress.passesCompleted < 0) {
    progress.passesCompleted = 0;
  }
  if (!Array.isArray(progress.needsRetry)) progress.needsRetry = [];
  progress.needsRetry = [...new Set(progress.needsRetry.filter(s => NICHE_ORDER.includes(s)))];

  if (!progress.nicheEmailCount || typeof progress.nicheEmailCount !== 'object' || Array.isArray(progress.nicheEmailCount)) {
    progress.nicheEmailCount = {};
  }
  for (const slug of Object.keys(progress.nicheEmailCount)) {
    const n = progress.nicheEmailCount[slug];
    if (!NICHE_ORDER.includes(slug) || !Number.isFinite(n) || n < 0) delete progress.nicheEmailCount[slug];
  }

  if (!progress.perComboCursor || typeof progress.perComboCursor !== 'object' || Array.isArray(progress.perComboCursor)) {
    progress.perComboCursor = {};
  }
  for (const key of Object.keys(progress.perComboCursor)) {
    const c = progress.perComboCursor[key] || {};
    progress.perComboCursor[key] = {
      offset: Number.isInteger(c.offset) && c.offset >= 0 ? c.offset : 0,
      depth: Number.isInteger(c.depth) && c.depth >= 1 ? Math.min(c.depth, MAX_DEPTH) : 1,
    };
  }

  if (!Array.isArray(progress.exhausted)) progress.exhausted = [];
  progress.exhausted = [...new Set(progress.exhausted.filter(k => typeof k === 'string'))];
}

const comboKey = (city, slug) => `${city.toLowerCase()}::${slug}`;
const queryKeyOf = (slug, city) => `${slug}::${city.toLowerCase()}`;

function getCombo(progress, city, slug) {
  const key = comboKey(city, slug);
  if (!progress.perComboCursor[key]) {
    progress.perComboCursor[key] = { offset: 0, depth: 1, kwIndex: 0, distIndex: 0 };
  }
  return progress.perComboCursor[key];
}

const isExhausted = (progress, key) => progress.exhausted.includes(key);

function markExhausted(progress, key) {
  if (!progress.exhausted.includes(key)) progress.exhausted.push(key);
}

function clearExhausted(progress, key) {
  const i = progress.exhausted.indexOf(key);
  if (i !== -1) progress.exhausted.splice(i, 1);
}

function markQueryVisited(progress, slug, city) {
  const qk = queryKeyOf(slug, city);
  if (!progress.completedQueries.includes(qk)) progress.completedQueries.push(qk);
  progress.lastQueryKey = qk;
}

// Session work order: in-order niches first, then captcha needs-retry, then wrap.
function buildWorkOrder(progress) {
  const order = [];
  for (let i = progress.currentNicheIndex; i < NICHE_ORDER.length; i++) {
    order.push({ slug: NICHE_ORDER[i], index: i, isRetry: false });
  }
  for (const slug of progress.needsRetry) {
    if (!order.some(o => o.slug === slug)) {
      order.push({ slug, index: NICHE_ORDER.indexOf(slug), isRetry: true });
    }
  }
  return order;
}

// Wrap to niche 1: reset per-pass counters; deepen or recycle exhausted combos.
function wrapRotation(progress) {
  progress.passesCompleted += 1;
  progress.currentNicheIndex = 0;
  progress.nicheEmailCount = {};
  progress.needsRetry = [];
  progress.completedQueries = [];

  const activeKeys = CITIES.flatMap(city => NICHE_ORDER.map(slug => comboKey(city, slug)));
  const exhaustedActive = activeKeys.filter(k => isExhausted(progress, k));

  // If ALL or >75% active city-niche combos for the current launcher script are exhausted
  if (exhaustedActive.length >= Math.ceil(activeKeys.length * 0.75)) {
    let deepened = 0, recycled = 0;
    for (const k of activeKeys) {
      const c = progress.perComboCursor[k] || { offset: 0, depth: 1, kwIndex: 0, distIndex: 0 };
      if (c.depth < MAX_DEPTH) {
        c.depth += 1;
        c.kwIndex = ((c.kwIndex || 0) + 1) % 15;
        c.distIndex = 0;
        c.offset = 0;
        deepened++;
      } else {
        c.offset = 0;
        c.depth = 1;
        c.kwIndex = ((c.kwIndex || 0) + 1) % 15;
        c.distIndex = 0;
        recycled++;
      }
      progress.perComboCursor[k] = c;
      clearExhausted(progress, k);
    }
    log.rotation(`Wrap: ${exhaustedActive.length}/${activeKeys.length} active city×niche combos exhausted → DEEPEN & SWITCH KEYWORDS: ${deepened} combos deepened, ${recycled} recycled with new keywords.`);
  } else {
    log.rotation(`Wrap: ${activeKeys.length - exhaustedActive.length}/${activeKeys.length} active combos open for current pass.`);
  }
  log.rotation(`═══ PASS ${progress.passesCompleted} COMPLETE → PASS ${progress.passesCompleted + 1} begins at niche 1/${NICHE_ORDER.length} (${NICHE_ORDER[0]}) ═══`);
}

// ── In-memory seen-set cache (arrays remain the persisted truth) ──
function buildSeenCache(progress) {
  return {
    emails: new Set(progress.emailsSeen),
    businesses: new Set(progress.businessesSeen),
    places: new Set(progress.placesSeen),
    websites: new Set(progress.websitesSeen),
    inFlightWebsites: new Set(),
  };
}

// ── PAUSE file check ──────────────────────────────────────────
async function waitIfPaused() {
  while (fs.existsSync(PAUSE_PATH)) {
    log.pause('Paused. Delete PAUSE file to resume.');
    await sleep(30000);
  }
}

// ── CAPTCHA & Anti-Bot detection ──────────────────────────────
async function checkCaptcha(page, progress) {
  const url = page.url() || '';
  const isSorryPage = url.includes('/sorry/index') || url.includes('/sorry/');

  let captcha = null;
  if (!isSorryPage) {
    captcha = await page.$('iframe[src*="recaptcha"], iframe[src*="hcaptcha"], form[action*="SorryRedirect"]').catch(() => null);
  }

  const detected = isSorryPage || !!captcha;
  if (!detected) return false;

  if (!HEADLESS) {
    log.captcha('Anti-bot / CAPTCHA page detected! Solve it manually in the browser window...');
    while (page.url().includes('/sorry/') || await page.$('iframe[src*="recaptcha"], iframe[src*="hcaptcha"], form[action*="SorryRedirect"]').catch(() => null)) {
      await sleep(5000);
      log.captcha('Still waiting for CAPTCHA to be solved...');
    }
    log.captcha('CAPTCHA cleared. Resuming.');
    return false; // resolved, continue
  }

  // Headless mode → flag CAPTCHA detection
  log.captcha('Anti-bot / CAPTCHA detected in headless mode. Requesting graceful flush and exit.');
  return true;
}

// ── Extract unique place key from Maps URL ────────────────────
function getPlaceKey(url) {
  if (!url) return null;
  const idMatch = url.match(/!1s(0x[0-9a-fA-F]+:0x[0-9a-fA-F]+)/);
  if (idMatch) return idMatch[1];
  const slugMatch = url.match(/\/place\/([^\/]+)/);
  if (slugMatch) return decodeURIComponent(slugMatch[1].replace(/\+/g, ' ')).toLowerCase().trim();
  return url;
}

// ── Sleep utility ─────────────────────────────────────────────
function sleep(ms) {
  return new Promise(r => setTimeout(r, ms));
}

// ── Scroll the Maps results panel to load more businesses ─────
async function scrollResults(page, maxResults) {
  const feedSelector = 'div[role="feed"]';
  let previousCount = 0;
  let staleRounds = 0;

  for (let i = 0; i < 40; i++) { // safety cap: 40 scroll rounds
    const count = await page.$$eval('div[role="feed"] > div > div > a[href*="maps/place"]', els => els.length).catch(() => 0);

    if (count >= maxResults) {
      log.scraper(`Loaded ${count} results (hit max ${maxResults}).`);
      break;
    }

    // Check for "end of list" marker (bilingual support)
    const endOfList = await page.evaluate(() => {
      const feed = document.querySelector('div[role="feed"]');
      if (!feed) return false;
      const text = feed.innerText || '';
      return text.includes("You've reached the end of the list") ||
             text.includes("akhir dari daftar") ||
             !!document.querySelector('span.HlvSq');
    }).catch(() => false);

    if (endOfList) {
      log.scraper(`End of results reached at ${count} items.`);
      break;
    }

    if (count === previousCount) {
      staleRounds++;
      if (staleRounds >= 5) {
        log.scraper(`Results stalled at ${count} after ${staleRounds} rounds. Moving on.`);
        break;
      }
    } else {
      staleRounds = 0;
    }
    previousCount = count;

    // Scroll inside the feed panel
    await page.evaluate((sel) => {
      const el = document.querySelector(sel);
      if (el) el.scrollTop = el.scrollHeight;
    }, feedSelector);

    await sleep(SCROLL_DELAY);
  }
}

// ── Extract listing details (URL, name, rating, reviews, website) directly from results panel ─
async function extractListingCards(page) {
  return page.$$eval(
    'div[role="feed"] > div > div',
    cards => cards.map(card => {
      const a = card.querySelector('a[href*="maps/place"]');
      if (!a) return null;

      let name = a.getAttribute('aria-label') || '';
      if (!name) {
        const titleEl = a.querySelector('.qbfV2') || a.querySelector('div.fontHeadlineSmall');
        name = titleEl ? titleEl.textContent : '';
      }
      if (!name) {
        const lines = card.innerText.split('\n').map(l => l.trim()).filter(Boolean);
        name = lines[0] || '';
      }
      name = name.replace(/^(Ad\s*·\s*|Sponsored\s*·\s*)+/i, '').trim();

      // Extract Website URL directly from list card if present
      let websiteUrl = null;
      const webAnchor = card.querySelector('a[aria-label*="Website" i], a[aria-label*="Situs" i], a[data-value="Website" i], a[data-tooltip*="website" i]');
      if (webAnchor && webAnchor.href && !webAnchor.href.includes('google.com/maps')) {
        websiteUrl = webAnchor.href;
      }

      // Extract Rating & Review Count directly from list card text
      let rating = null;
      let reviewCount = null;
      const fullText = card.innerText || '';
      
      const ratingMatch = fullText.match(/([\d.,]+)\s*★/) || fullText.match(/★\s*([\d.,]+)/);
      if (ratingMatch) rating = parseFloat(ratingMatch[1].replace(',', '.'));
      
      const ariaEl = card.querySelector('span[aria-label*="ulasan" i], span[aria-label*="review" i]');
      const ariaText = ariaEl ? ariaEl.getAttribute('aria-label') : '';
      const rawReviewStr = (ariaText || fullText || '');
      const rbMatch = rawReviewStr.match(/\(([\d,.]+)\s*(?:rb|k)\b/i)
        || rawReviewStr.match(/([\d,.]+)\s*(?:rb|k)\b\s*(?:ulasan|reviews?)?/i);
      if (rbMatch) {
        reviewCount = Math.round(parseFloat(rbMatch[1].replace(',', '.')) * 1000);
      } else {
        const reviewMatch = fullText.match(/\(([\d,.]+)\)/)
          || fullText.match(/([\d,.]+)\s*(?:ulasan|reviews?)/i)
          || (ariaText ? ariaText.match(/([\d,.]+)/) : null);
        if (reviewMatch) {
          reviewCount = parseInt(reviewMatch[1].replace(/[^\d]/g, ''), 10);
        }
      }

      // Extract Category & Address directly from card text
      let cardCategory = null;
      let cardAddress = null;
      const subLines = fullText.split('\n').map(l => l.trim()).filter(Boolean);
      for (const line of subLines) {
        if (line.includes('·')) {
          const parts = line.split('·').map(p => p.trim());
          for (const part of parts) {
            if (!cardCategory && part.length > 2 && part.length < 50 && !/★|\d+\s*(?:rb|k|\)|\()|open|closed|tutup|buka/i.test(part)) {
              cardCategory = part;
            } else if (!cardAddress && (part.includes('Jl.') || part.includes('Street') || part.includes('St') || part.includes('Ave') || part.includes('Road') || part.length > 10)) {
              cardAddress = part;
            }
          }
        }
      }

      return {
        url: a.href,
        name: name || '',
        websiteUrl,
        rating,
        reviewCount,
        cardCategory,
        cardAddress
      };
    }).filter(Boolean)
  ).catch(() => []);
}

// ── Extract business details from a single listing page ───────
async function extractBusinessDetails(page) {
  const details = {
    businessName: null,
    rating: null,
    reviewCount: null,
    category: null,
    phone: null,
    websiteUrl: null,
    mapsUrl: page.url(),
  };

  try {
    // Business name — main heading
    details.businessName = await page.$eval('h1', el => el.textContent.trim()).catch(() => null);

    // Rating — aria-label on the stars element (e.g. "4.5 stars")
    const ratingText = await page.$eval('div[role="img"][aria-label*="star"]', el => el.getAttribute('aria-label')).catch(() => null);
    if (ratingText) {
      const m = ratingText.match(/([\d.]+)/);
      if (m) details.rating = parseFloat(m[1]);
    }
    // Fallback: try span.ceNzKf (common Maps rating selector)
    if (!details.rating) {
      const fallback = await page.$eval('span.ceNzKf', el => el.getAttribute('aria-label') || el.textContent).catch(() => null);
      if (fallback) {
        const m = String(fallback).match(/([\d.]+)/);
        if (m) details.rating = parseFloat(m[1]);
      }
    }

    // Review count — look for text with parentheses like "(1,234)" or "ulasan" in aria-label, supporting 'rb' and 'k' multipliers
    const reviewText = await page.$eval('button[jsaction*="reviewChart"] span', el => el.textContent).catch(() => null)
      || await page.$eval('span[aria-label*="review" i], span[aria-label*="ulasan" i], button[aria-label*="review" i], button[aria-label*="ulasan" i]', el => el.getAttribute('aria-label') || el.textContent).catch(() => null);
    if (reviewText) {
      const rawStr = String(reviewText).trim();
      const rbMatch = rawStr.match(/([\d,.]+)\s*(?:rb|k)\b/i);
      if (rbMatch) {
        details.reviewCount = Math.round(parseFloat(rbMatch[1].replace(',', '.')) * 1000);
      } else {
        const cleaned = rawStr.replace(/[(),.\s]/g, '').replace(/ /g, '');
        const m = cleaned.match(/(\d+)/);
        if (m) details.reviewCount = parseInt(m[1], 10);
      }
    }

    // Category — button with jsaction containing 'category'
    details.category = await page.$eval(
      'button[jsaction*="category"]',
      el => el.textContent.trim()
    ).catch(() => null);
    // Fallback: the second button in the action bar area
    if (!details.category) {
      details.category = await page.$eval(
        'button[jsaction*="pane.rating.category"]',
        el => el.textContent.trim()
      ).catch(() => null);
    }

    // Phone — look for data-item-id prefix first, then fallback to tooltips/labels
    details.phone = await page.$eval(
      '[data-item-id^="phone:"]',
      el => {
        const text = el.textContent ? el.textContent.trim() : '';
        if (text) return text;
        const href = el.getAttribute('href') || '';
        if (href.startsWith('tel:')) return href.replace('tel:', '').trim();
        return null;
      }
    ).catch(() => null);

    if (!details.phone) {
      details.phone = await page.$eval(
        'button[data-tooltip*="phone" i], button[data-tooltip*="telepon" i], button[data-tooltip*="téléphone" i], button[data-tooltip*="telefon" i]',
        el => el.getAttribute('aria-label') || el.textContent.trim()
      ).catch(() => null) || await page.$eval(
        'a[href*="wa.me/"], a[href*="api.whatsapp.com/send"]',
        el => {
          const href = el.getAttribute('href') || '';
          const match = href.match(/(?:wa\.me\/|phone=)(\+?\d+)/);
          return match ? match[1] : null;
        }
      ).catch(() => null);
    }

    if (details.phone) {
      // Strip language-specific label prefixes like "Telepon: ", "Phone: "
      details.phone = details.phone.replace(/^[^:]+:\s*/, '').trim();
      // Strip non-ASCII icon glyphs (e.g. 📞)
      details.phone = details.phone.replace(/[^\x20-\x7E]/g, '').trim();
    }

    // Website URL
    details.websiteUrl = await page.$eval(
      'a[data-item-id="authority"]',
      el => el.href
    ).catch(() => null);
    if (!details.websiteUrl) {
      details.websiteUrl = await page.$eval(
        'a[aria-label*="Website" i], a[aria-label*="Situs" i], a[aria-label*="Web" i], a[data-tooltip*="website" i], a[data-tooltip*="situs" i]',
        el => el.href
      ).catch(() => null);
    }

    // Check closed status (permanently closed in multiple languages)
    details.isClosed = await page.$('span:has-text("Permanently closed"), span:has-text("Tutup permanen"), span:has-text("Permanente geschlossen"), span:has-text("Permanentemente chiuso"), span:has-text("Permanentemente cerrado")').then(el => !!el).catch(() => false);
  } catch (err) {
    log.scraper(`Detail extraction error: ${err.message}`);
  }

  return details;
}

// ── Email normalization & junk rejection ──────────────────────
// Repairs the malformed patterns found in legacy emails_seen.txt:
//   phone-prefixed   0811-2801-98080811-2707-808admin@bhplaw.co.id → admin@bhplaw.co.id
//   country-code     +62bakerytenggilis@gmail.com → bakerytenggilis@gmail.com
//   concatenated TLD x@fourpoints.comreservasi → x@fourpoints.com · x@reyandco.co.ididen → x@reyandco.co.id
//   stray punct      -esupport@136point1.com → esupport@136point1.com
//   N/A patterns     na@…, none@…, .id@gmail.com → rejected outright
// Returns '' for anything that still looks like junk — junk is never synced.
// Genuine TLDs (common gTLDs + ccTLDs + compounds). A domain ending in one
// of these is structurally valid — never truncate it.
const REAL_TLDS = new Set([
  // compounds (checked longest-first by label count)
  'com.au', 'net.au', 'org.au', 'co.id', 'ac.id', 'sch.id', 'web.id', 'or.id', 'go.id', 'my.id', 'biz.id',
  'co.uk', 'org.uk', 'ac.uk', 'gov.uk', 'co.nz', 'org.nz', 'com.sg', 'net.sg', 'org.sg',
  'com.my', 'net.my', 'org.my', 'com.ph', 'co.th', 'com.vn', 'com.hk', 'org.hk', 'com.tw', 'com.cn', 'org.cn',
  'co.jp', 'or.jp', 'co.kr', 'co.in', 'com.pk', 'co.za', 'co.ke', 'co.il', 'com.tr', 'com.mx', 'com.br',
  'com.ar', 'com.co', 'com.pe', 'com.cl', 'com.ve', 'com.sa', 'com.ae', 'com.qa', 'com.kw', 'com.bd', 'com.lk',
  // classic gTLDs
  'com', 'net', 'org', 'edu', 'gov', 'mil', 'int', 'info', 'biz', 'name', 'pro',
  'aero', 'asia', 'cat', 'coop', 'jobs', 'mobi', 'museum', 'tel', 'travel', 'xxx',
  // common new gTLDs
  'app', 'dev', 'io', 'ai', 'me', 'tv', 'cc', 'co', 'online', 'site', 'website', 'store', 'shop', 'blog',
  'tech', 'cloud', 'digital', 'agency', 'solutions', 'services', 'company', 'community', 'network', 'systems',
  'consulting', 'group', 'international', 'world', 'media', 'studio', 'design', 'photography', 'photos',
  'gallery', 'cafe', 'coffee', 'restaurant', 'bar', 'pizza', 'dental', 'legal', 'law', 'lawyer', 'clinic',
  'care', 'health', 'medical', 'doctor', 'spa', 'salon', 'gym', 'fit', 'fitness', 'yoga', 'hotel', 'hotels',
  'villa', 'tours', 'realestate', 'property', 'properties', 'construction', 'builders', 'plumbing',
  'electrical', 'cleaning', 'laundry', 'florist', 'flowers', 'wedding', 'events', 'education', 'school',
  'academy', 'training', 'office', 'space', 'rental', 'rentals', 'car', 'cars', 'auto', 'autos', 'wash',
  'detailing', 'pet', 'pets', 'vet', 'grooming', 'marketing', 'advertising', 'production', 'productions',
  'video', 'photo', 'photographer', 'boutique', 'fashion', 'beauty', 'makeup', 'nails', 'hair', 'barber',
  'tattoo', 'bakery', 'cake', 'cakes', 'tea', 'food', 'organizer', 'software', 'house', 'land', 'estate',
  'center', 'city', 'life', 'live', 'today', 'news', 'press', 'host', 'email', 'mail', 'xyz', 'top',
  // ccTLDs seen across the launcher batches
  'id', 'au', 'sg', 'my', 'uk', 'us', 'nz', 'ca', 'de', 'fr', 'jp', 'kr', 'cn', 'hk', 'tw', 'th', 'vn',
  'ph', 'in', 'pk', 'bd', 'lk', 'ae', 'sa', 'qa', 'kw', 'il', 'tr', 'za', 'ng', 'ke', 'eg', 'mx', 'br',
  'ar', 'cl', 'pe', 've', 'nl', 'se', 'no', 'fi', 'dk', 'be', 'ch', 'at', 'es', 'it', 'pt', 'pl', 'cz',
  'sk', 'hu', 'hr', 'ro', 'bg', 'gr', 'ru', 'ua', 'ie', 'gi', 'mt', 'cy', 'ee', 'lv', 'lt', 'lu', 'si', 'li',
]);

// Short TLDs used for the truncation pass (longest-first).
const KNOWN_TLDS = [
  'com.au', 'com.sg', 'com.my', 'com.ph', 'co.id', 'co.uk', 'co.nz',
  'co.jp', 'ne.jp', 'or.jp', 'ac.jp', 'com.mx', 'com.br', 'com.es', 'com.ar', 'com.co', 'co.at', 'co.it',
  'ac.id', 'sch.id', 'web.id', 'or.id', 'go.id',
  'com', 'net', 'org', 'edu', 'gov', 'info', 'biz',
  'id', 'io', 'co', 'au', 'sg', 'my', 'uk', 'me', 'de', 'fr', 'es', 'it', 'jp', 'br', 'mx',
];

function fixConcatenatedTld(domain) {
  // 1. Domain already ends with a genuine TLD → clean, never truncate.
  const labels = domain.split('.');
  for (let l = Math.min(3, labels.length - 1); l >= 1; l--) {
    if (REAL_TLDS.has(labels.slice(-l).join('.'))) return domain;
  }
  // 2. No genuine ending: a known short TLD glued to trailing letters
  //    (e.g. "comreservasi", "co.ididen") → truncate at the TLD boundary.
  for (const tld of KNOWN_TLDS) {
    const marker = '.' + tld;
    const idx = domain.lastIndexOf(marker);
    if (idx <= 0) continue;
    const tail = domain.slice(idx + marker.length);
    if (/^[a-z]{3,}$/.test(tail)) return domain.slice(0, idx + marker.length);
  }
  return domain;
}

function normalizePhoneE164(rawPhone) {
  if (!rawPhone || typeof rawPhone !== 'string') return rawPhone || '';
  let digits = rawPhone.trim().replace(/[^\d+]/g, '');
  if (!digits) return rawPhone;

  // Indonesian local phone number formats (0812... -> +62812..., 021... -> +6221...)
  if (/^0(8|21|22|31|24|274|361|271|341|251)/.test(digits)) {
    return '+62' + digits.slice(1);
  }
  if (digits.startsWith('62') && !digits.startsWith('+')) {
    return '+' + digits;
  }
  if (!digits.startsWith('+') && digits.length >= 8) {
    return '+62' + digits.replace(/^0+/, '');
  }
  return digits;
}

function stripPhonePrefix(local) {
  // Long phone-like run at the start: "+62…" or "0811-…-808" (≥5 phone chars)
  let m = local.match(/^\+?\d[\d().\-\s]{4,}(?=[a-z])/);
  if (m) return local.slice(m[0].length);
  // Explicit short country code glued to letters: "+62brand", "+1-brand"
  m = local.match(/^\+\d{1,3}[-.]?(?=[a-z])/);
  if (m) return local.slice(m[0].length);
  return local;
}

// Note: cleanEmailAddress, verifyDomainMx, and isDeliverableEmail are imported from ./email-validator

// Helper to extract email addresses from currently loaded page content
async function extractEmailsFromPage(page, emailsSet) {
  try {
    const body = await page.evaluate(() => document.body ? document.body.innerText : '').catch(() => '');
    const html = await page.content().catch(() => '');

    // 1. Cloudflare email protection XOR decoding
    const cfRegexMatches = html.match(/(?:data-cfemail=["']([0-9a-fA-F]+)["']|\/cdn-cgi\/l\/email-protection#([0-9a-fA-F]+))/gi) || [];
    for (const cfm of cfRegexMatches) {
      const hex = cfm.replace(/^.*?(?:data-cfemail=["']|#)/i, '').replace(/["'].*$/, '');
      const decoded = EmailCrawlerPool.decodeCloudflareEmail ? EmailCrawlerPool.decodeCloudflareEmail(hex) : '';
      if (decoded) {
        const clean = cleanEmailAddress(decoded);
        if (clean) emailsSet.add(clean);
      }
    }

    // 2. Normal email extraction
    const combined = body + ' ' + html;
    const matches = combined.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/g) || [];
    for (const email of matches) {
      const clean = cleanEmailAddress(email);
      if (clean) emailsSet.add(clean);
    }

    // 3. De-obfuscation extraction for [at] / (at) / {at} / HTML entities
    const entityDecoded = combined
      .replace(/&#64;|&#x40;|&commat;/gi, '@')
      .replace(/&#46;|&#x2e;/gi, '.')
      .replace(/&#160;|&nbsp;/gi, ' ')
      .replace(/&amp;/gi, '&');

    const deobfuscated = entityDecoded
      .replace(/\s*\[\s*(?:at|AT)\s*\]\s*|\s*\(\s*(?:at|AT)\s*\)\s*|\s*\{\s*(?:at|AT)\s*\}\s*|\s+(?:at|AT)\s+/g, '@')
      .replace(/\s*\[\s*(?:dot|DOT)\s*\]\s*|\s*\(\s*(?:dot|DOT)\s*\)\s*|\s*\{\s*(?:dot|DOT)\s*\}\s*|\s+(?:dot|DOT)\s+/g, '.');
    const deMatches = deobfuscated.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/g) || [];
    for (const email of deMatches) {
      const clean = cleanEmailAddress(email);
      if (clean) emailsSet.add(clean);
    }

    // 4. Schema.org JSON-LD & Meta Tag extraction stream
    const structuredData = await page.evaluate(() => {
      const texts = [];
      const scripts = Array.from(document.querySelectorAll('script[type="application/ld+json"]'));
      for (const s of scripts) {
        if (s.textContent) texts.push(s.textContent);
      }
      const metas = Array.from(document.querySelectorAll('meta[content]'));
      for (const m of metas) {
        const content = m.getAttribute('content');
        if (content && content.includes('@')) texts.push(content);
      }
      return texts.join(' ');
    }).catch(() => '');

    if (structuredData) {
      const structMatches = structuredData.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/g) || [];
      for (const email of structMatches) {
        const clean = cleanEmailAddress(email);
        if (clean) emailsSet.add(clean);
      }
    }

    // 5. Grab mailto: links and sanitize them
    const mailtos = await page.$$eval('a[href^="mailto:"]', els => els.map(el => el.href.replace(/^mailto:/i, '').split('?')[0])).catch(() => []);
    for (const m of mailtos) {
      const parts = m.split(/[,;]/);
      for (let p of parts) {
        try { p = decodeURIComponent(p.trim()); } catch (_) {}
        const clean = cleanEmailAddress(p);
        if (clean) emailsSet.add(clean);
      }
    }
  } catch (err) {
    // Ignore minor extraction errors on page
  }
}

// Helper to check if a URL points explicitly to a raw private/loopback IP literal
function isPrivateIpLiteral(urlStr) {
  if (!urlStr || typeof urlStr !== 'string') return false;
  try {
    const hostname = new URL(urlStr).hostname.toLowerCase();
    if (hostname === 'localhost' || hostname === '::1' || hostname === '0.0.0.0') return true;

    // IPv4 literal check
    if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(hostname)) {
      const parts = hostname.split('.').map(Number);
      if (parts[0] === 127) return true; // Loopback
      if (parts[0] === 10) return true;  // Class A Private
      if (parts[0] === 172 && parts[1] >= 16 && parts[1] <= 31) return true; // Class B Private
      if (parts[0] === 192 && parts[1] === 168) return true; // Class C Private
      if (parts[0] === 169 && parts[1] === 254) return true; // Cloud Metadata / Link-Local
    }
  } catch {}
  return false;
}

// Note: Legacy synchronous website crawling replaced by decoupled EmailCrawlerPool (20 worker threads).

// ── Website dedup key (shared platforms key by full path, else domain) ──
function websiteDedupKey(websiteUrl) {
  try {
    const urlObj = new URL(websiteUrl);
    const domain = urlObj.hostname.replace(/^www\./, '').toLowerCase();
    const sharedPlatforms = ['linktr.ee', 'linktree.com', 'carrd.co', 'facebook.com', 'instagram.com', 'wa.me', 'whatsapp.com', 'youtube.com'];
    if (sharedPlatforms.includes(domain)) {
      return `${domain}${urlObj.pathname.toLowerCase().replace(/\/$/, '')}`;
    }
    return domain;
  } catch {
    return null;
  }
}

// ── Save a single lead to local store and optional webhook ──
async function flushFailedSyncQueue(progress) {
  // Local store is synchronous and atomic, retry queue not needed
}

async function syncLead(lead, progress) {
  if (shuttingDown || isShuttingDown) return;

  try {
    store.saveLead(lead);
    progress.synced = (progress.synced || 0) + 1;
    log.sync(`Saved lead "${lead.businessName}" to local database. Total leads: ${progress.synced}`);

    // Optional user webhook dispatch
    const webhookUrl = process.env.WEBHOOK_URL;
    if (webhookUrl) {
      fetch(webhookUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ event: 'lead.discovered', lead })
      }).catch(() => {});
    }
  } catch (err) {
    log.sync(`Error saving lead "${lead.businessName}": ${err.message}`);
  }
}

// ── Load local deduplication cache from store ─────────────────
async function syncSeenListsWithDatabase(progress) {
  if (shuttingDown || isShuttingDown) return;
  const allLeads = Array.from(store.leads.values());
  const emailSet = new Set(progress.emailsSeen);
  const businessSet = new Set(progress.businessesSeen.map(b => b.toLowerCase().trim()));

  for (const l of allLeads) {
    if (l.primaryEmail) emailSet.add(l.primaryEmail.toLowerCase().trim());
    if (l.emails) l.emails.forEach(e => emailSet.add(e.toLowerCase().trim()));
    if (l.businessName) businessSet.add(l.businessName.toLowerCase().trim());
  }

  progress.emailsSeen = [...emailSet];
  progress.businessesSeen = [...businessSet];
  log.sync(`Loaded local duplicate-prevention index: ${emailSet.size} emails, ${businessSet.size} businesses.`);
}

// ── Save results to local JSON (append-safe) ──────────────────
function appendResultsLocal(leads, niche, city) {
  if (!fs.existsSync(RESULTS_DIR)) fs.mkdirSync(RESULTS_DIR, { recursive: true });

  const filename = `${niche.toLowerCase().replace(/\s+/g, '-')}_${city.toLowerCase().replace(/\s+/g, '-')}.json`;
  const filepath = path.join(RESULTS_DIR, filename);

  let existing = [];
  if (fs.existsSync(filepath)) {
    try { existing = JSON.parse(fs.readFileSync(filepath, 'utf-8')); } catch { existing = []; }
  }

  existing.push(...leads);
  fs.writeFileSync(filepath, JSON.stringify(existing, null, 2), 'utf-8');
  log.data(`Appended ${leads.length} leads to ${filename} (total: ${existing.length})`);
}

// ── Organic Search Fallback Blacklist & Helper (Requirement R2) ──
const DIRECTORY_DOMAINS = new Set([
  'yelp.com', 'yellowpages.com', 'yellowbook.com', 'tripadvisor.com', 'tripadvisor.co.id',
  'tripadvisor.co.uk', 'google.com', 'google.co.id', 'maps.google.com', 'apple.com',
  'bing.com', 'wikipedia.org', 'facebook.com', 'fb.com', 'instagram.com', 'linkedin.com',
  'twitter.com', 'x.com', 'tiktok.com', 'pinterest.com', 'youtube.com', 'youtu.be',
  'foursquare.com', 'mapquest.com', 'waze.com', 'yahoo.com', 'duckduckgo.com',
  'reddit.com', 'trustpilot.com', 'capterra.com', 'g2.com', 'bbb.org'
]);

function isDirectoryUrl(urlString) {
  try {
    const parsed = new URL(urlString);
    if (parsed.protocol !== 'http:' && parsed.protocol !== 'https:') return true;
    const host = parsed.hostname.toLowerCase().replace(/^www\./, '');
    if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(host) || host === 'localhost') return true;
    for (const d of DIRECTORY_DOMAINS) {
      if (host === d || host.endsWith('.' + d)) return true;
    }
    return false;
  } catch (_) {
    return true;
  }
}

let ddgMutedUntil = 0;

async function searchOrganicWebsiteFallback(businessName, city) {
  if (!businessName || Date.now() < ddgMutedUntil) return null;
  const queryStr = `"${businessName}" "${city || ''}" website`.trim();
  const searchUrl = `https://html.duckduckgo.com/html/?q=${encodeURIComponent(queryStr)}`;

  try {
    const res = await fetch(searchUrl, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.9'
      },
      timeout: 6000
    });

    if (res.status === 403 || res.status === 429) {
      ddgMutedUntil = Date.now() + 300000; // Mute for 5 minutes to prevent IP bans
      log.skip(`[ORGANIC FALLBACK] DuckDuckGo rate-limited (HTTP ${res.status}). Muting fallback search for 5 minutes.`);
      return null;
    }

    if (!res.ok) return null;
    const html = await res.text();
    const $ = cheerio.load(html);

    const links = $('.result__a');
    for (let i = 0; i < links.length; i++) {
      let rawHref = $(links[i]).attr('href');
      if (!rawHref) continue;

      let targetUrl = rawHref;
      if (rawHref.includes('uddg=')) {
        try {
          const match = rawHref.match(/uddg=([^&]+)/);
          if (match && match[1]) {
            targetUrl = decodeURIComponent(match[1]);
          }
        } catch (_) {}
      }

      if (targetUrl && !isDirectoryUrl(targetUrl)) {
        return targetUrl;
      }
    }
  } catch (err) {
    // Network or timeout error - silent ignore to preserve speed
  }
  return null;
}

// ── Qualification check ───────────────────────────────────────
function qualifyLead(details, progress, city, activeSlug) {
  const reasons = [];

  if (!details.businessName) {
    reasons.push('no name');
  }

  // Institutional Non-SMB Defense: Never qualify stadiums, malls, hospitals, universities, transit hubs
  if (isInstitutional(details.businessName)) {
    reasons.push(`institutional non-smb name ("${details.businessName}")`);
  }
  if (isInstitutional(details.category)) {
    reasons.push(`institutional non-smb category ("${details.category}")`);
  }
  if (details.reviewCount != null && details.reviewCount >= 2500 && (isInstitutional(details.businessName) || isInstitutional(details.category))) {
    reasons.push(`review outlier (${details.reviewCount}) for non-smb`);
  }

  if (details.isClosed) {
    reasons.push('permanently closed');
  }

  if (MIN_REVIEWS > 0 && (details.reviewCount == null || details.reviewCount < MIN_REVIEWS)) {
    reasons.push(`reviews=${details.reviewCount || 0} < ${MIN_REVIEWS}`);
  }

  if (details.rating != null && details.rating < MIN_RATING) {
    reasons.push(`rating=${details.rating || 0} < ${MIN_RATING}`);
  }

  // Must have at least one contact method
  const hasContact = details.phone || details.websiteUrl || (details.emails && details.emails.length > 0);
  if (!hasContact) {
    reasons.push('no contact info');
  }

  // Niche match: multi-signal weighted closeness matcher across category, business name, and URL
  let matchedSlug = matchClosestNiche(details, activeSlug);

  if (!matchedSlug) {
    reasons.push(`category "${details.category || 'unknown'}" unmatched`);
  }

  // Business dedup
  if (details.businessName) {
    const bizKey = `${details.businessName.toLowerCase()}::${city.toLowerCase()}`;
    if (progress.businessesSeen.includes(bizKey)) {
      reasons.push('duplicate business');
    }
  }

  return { qualified: reasons.length === 0, reasons, matchedSlug };
}

// ── Core: scrape one city × niche combo ───────────────────────
// Returns: 'done' (niche quota filled) · 'exhausted' · 'captcha' · 'quota' · 'error'
async function processCombo(ctx, city, slug, combo) {
  const { page, browser, progress, seen } = ctx;
  const countryKey = normalizeCountryKey(process.env.SCRAPER_COUNTRY || findCountryForCity(city) || LOCALE || 'indonesia');
  const searchLocale = countryKey === 'indonesia'
    ? 'id'
    : (['germany', 'austria', 'switzerland'].includes(countryKey)
      ? 'de'
      : (['france', 'belgium'].includes(countryKey)
        ? 'fr'
        : (['spain', 'mexico'].includes(countryKey)
          ? 'es'
          : 'en')));

  const keywords = getNicheKeywords(slug, searchLocale);
  const kwIndex = combo.kwIndex || 0;
  const niche = keywords[kwIndex % keywords.length];
  const key = comboKey(city, slug);

  const useSpatialMesh = process.env.SCRAPER_SPATIAL_MESH !== 'false';
  const districts = useSpatialMesh ? getSubDistricts(countryKey, city, true) : [city];
  const distIndex = combo.distIndex || 0;
  const currentDistrict = (districts && distIndex < districts.length) ? districts[distIndex] : city;

  let queryLocation = city;
  if (useSpatialMesh && currentDistrict && currentDistrict.toLowerCase() !== city.toLowerCase()) {
    queryLocation = currentDistrict.toLowerCase().includes(city.toLowerCase()) ? currentDistrict : `${currentDistrict}, ${city}`;
  }

  // Navigate to Google Maps search with country-appropriate locale
  const searchQuery = encodeURIComponent(`${niche} in ${queryLocation}`);
  const mapsUrl = `https://www.google.com/maps/search/${searchQuery}/?hl=${searchLocale}`;

  try {
    await page.goto(mapsUrl, { waitUntil: 'domcontentloaded', timeout: 30000 });
  } catch (err) {
    log.scraper(`Navigation timeout for ${niche} × ${queryLocation}: ${err.message}. Marking combo error-skip.`);
    return 'error';
  }

  await sleep(3000);

  // CAPTCHA check
  if (await checkCaptcha(page, progress)) return 'captcha';

  // Accept cookies/consent if prompted (English, German, French, Spanish, Italian)
  const consentBtn = await page.$('button[aria-label*="Accept" i], button[aria-label*="akzeptieren" i], button[aria-label*="accepter" i], button[aria-label*="aceptar" i], button[aria-label*="accetta" i]').catch(() => null)
    || await page.$('form[action*="consent"] button').catch(() => null);
  if (consentBtn) {
    await consentBtn.click().catch(() => {});
    await sleep(2000);
  }

  // Scroll to load results — depth multiplies the pagination target
  const scrollTarget = MAX_PER_SEARCH * combo.depth;
  await scrollResults(page, scrollTarget);

  // Extract + dedupe listing cards
  const listings = await extractListingCards(page);
  const uniqueListings = [];
  const seenUrlsOnPage = new Set();
  for (const item of listings) {
    const pkey = getPlaceKey(item.url);
    if (pkey && !seenUrlsOnPage.has(pkey)) {
      seenUrlsOnPage.add(pkey);
      uniqueListings.push(item);
    }
  }
  log.scraper(`"${niche}" [kw ${kwIndex + 1}/${keywords.length}] × "${queryLocation}" [district ${distIndex + 1}/${districts.length}]: ${uniqueListings.length} unique cards (depth ${combo.depth}, cursor at ${combo.offset}).`);

  // ── INSTANT FAST-PATH DEDUP SHIELD: Filter unseen cards BEFORE entering detail loop ──
  const unseenCards = uniqueListings.slice(combo.offset).filter(item => {
    const pkey = getPlaceKey(item.url);
    if (pkey && seen.places.has(pkey)) return false;
    if (item.name) {
      if (isInstitutional(item.name)) return false;
      const bizKey = `${item.name.toLowerCase()}::${city.toLowerCase()}`;
      if (seen.businesses.has(bizKey)) return false;
    }
    if (item.cardCategory && isInstitutional(item.cardCategory)) return false;
    if (item.reviewCount != null && item.reviewCount >= 2500 && (isInstitutional(item.name) || isInstitutional(item.cardCategory))) return false;
    if (MIN_REVIEWS > 0 && item.reviewCount != null && item.reviewCount < MIN_REVIEWS) return false;
    return true;
  });

  if (unseenCards.length === 0 && uniqueListings.length > combo.offset) {
    log.skip(`"${niche}" [kw ${kwIndex + 1}/${keywords.length}] × "${queryLocation}": All ${uniqueListings.length - combo.offset} remaining cards ALREADY PROCESSED — INSTANT FAST-PATH SKIP in 1ms.`);
    // Register all place keys to seen list instantly in bulk
    for (const item of uniqueListings) {
      const pkey = getPlaceKey(item.url);
      if (pkey && !seen.places.has(pkey)) {
        seen.places.add(pkey);
        progress.placesSeen.push(pkey);
        appendPlaceSeen(pkey);
      }
      if (!progress.urlsSeen.includes(item.url)) progress.urlsSeen.push(item.url);
    }
    combo.offset = uniqueListings.length;

    // Fast-forward district mesh -> keyword variation -> pagination depth
    if (useSpatialMesh && distIndex + 1 < districts.length) {
      combo.distIndex = distIndex + 1;
      combo.offset = 0;
      log.rotation(`Combo ${key} instant-advancing to sub-district ${distIndex + 2}/${districts.length} ("${districts[distIndex + 1]}")...`);
      saveProgress(progress);
      return 'next_district';
    }
    if (kwIndex + 1 < keywords.length) {
      combo.kwIndex = kwIndex + 1;
      combo.distIndex = 0;
      combo.offset = 0;
      log.rotation(`Combo ${key} instant-advancing to keyword variation ${kwIndex + 2}/${keywords.length} ("${keywords[kwIndex + 1]}")...`);
      saveProgress(progress);
      return 'next_kw';
    }
    if (combo.depth < MAX_DEPTH) {
      combo.depth++;
      combo.kwIndex = 0;
      combo.distIndex = 0;
      combo.offset = 0;
      log.rotation(`Combo ${key} instant-deepening search pagination to depth ${combo.depth}...`);
      saveProgress(progress);
      return 'deepened';
    }

    markExhausted(progress, key);
    markQueryVisited(progress, slug, city);
    saveProgress(progress);
    return 'exhausted';
  }

  if (uniqueListings.length <= combo.offset) {
    // 1. Advance to next sub-district in spatial grid mesh if available
    if (useSpatialMesh && distIndex + 1 < districts.length) {
      combo.distIndex = distIndex + 1;
      combo.offset = 0;
      log.rotation(`Combo ${key} advancing to sub-district ${distIndex + 2}/${districts.length} ("${districts[distIndex + 1]}")...`);
      saveProgress(progress);
      return 'next_district';
    }
    // 2. Try next keyword variation for this niche if available
    if (kwIndex + 1 < keywords.length) {
      combo.kwIndex = kwIndex + 1;
      combo.distIndex = 0;
      combo.offset = 0;
      log.rotation(`Combo ${key} switching to keyword variation ${kwIndex + 2}/${keywords.length} ("${keywords[kwIndex + 1]}")...`);
      saveProgress(progress);
      return 'next_kw';
    }
    // 3. Auto-deepen pagination if max depth not reached
    if (combo.depth < MAX_DEPTH) {
      combo.depth++;
      combo.kwIndex = 0;
      combo.distIndex = 0;
      combo.offset = 0;
      log.rotation(`Combo ${key} deepening search pagination to depth ${combo.depth}...`);
      saveProgress(progress);
      return 'deepened';
    }

    markExhausted(progress, key);
    markQueryVisited(progress, slug, city);
    log.rotation(`Combo ${key} EXHAUSTED at max depth ${combo.depth} across all ${keywords.length} keyword variations & ${districts.length} districts. Skipped until pass reset.`);
    saveProgress(progress);
    return 'exhausted';
  }

  const quotaLabel = isFinite(DAILY_QUOTA) ? DAILY_QUOTA : '∞';
  let newFinds = 0;

  for (let li = combo.offset; li < uniqueListings.length; li++) {
    if (progress.emailsScrapedToday >= DAILY_QUOTA) return 'quota';

    const nicheTotal = progress.nicheEmailCount[slug] || 0;
    if (nicheTotal >= NICHE_EMAIL_QUOTA) return 'done';

    await waitIfPaused();

    const listing = uniqueListings[li];
    const { url: listingUrl, name: bizName } = listing;
    const listingKey = getPlaceKey(listingUrl);

    // ── EARLY DEDUP #1: place key / URL seen — skip page load entirely ──
    const isUrlProcessed = listingKey && seen.places.has(listingKey);
    if (isUrlProcessed) {
      log.skip(`[${li + 1}/${uniqueListings.length}] Place "${listingKey}" already processed. Skipping page load.`);
      combo.offset = li + 1;
      continue;
    }

    // ── EARLY DEDUP #2: business name seen — skip page load entirely ──
    if (bizName) {
      const bizKey = `${bizName.toLowerCase()}::${city.toLowerCase()}`;
      if (seen.businesses.has(bizKey)) {
        log.skip(`[${li + 1}/${uniqueListings.length}] "${bizName}" already scraped (businessesSeen). Skipping page load.`);
        if (!progress.urlsSeen.includes(listingUrl)) progress.urlsSeen.push(listingUrl);
        if (listingKey && !seen.places.has(listingKey)) {
          seen.places.add(listingKey);
          progress.placesSeen.push(listingKey);
          appendPlaceSeen(listingKey);
        }
        combo.offset = li + 1;
        continue;
      }
    }

    // ── EARLY PRE-FILTER #2.5: Institutional Entity Pre-Filter ──
    if (isInstitutional(bizName) || isInstitutional(listing.cardCategory)) {
      log.skip(`[${li + 1}/${uniqueListings.length}] "${bizName}" — Institutional non-SMB (${listing.cardCategory || 'blacklisted name'}). Skipping.`);
      if (!progress.urlsSeen.includes(listingUrl)) progress.urlsSeen.push(listingUrl);
      if (listingKey && !seen.places.has(listingKey)) {
        seen.places.add(listingKey);
        progress.placesSeen.push(listingKey);
        appendPlaceSeen(listingKey);
      }
      combo.offset = li + 1;
      continue;
    }

    // ── EARLY PRE-FILTER #2.6: Cross-Border Geo-Mismatch Guard ──
    if (countryKey !== 'indonesia') {
      const addr = (listing.cardAddress || '').toLowerCase();
      const lurl = (listingUrl || '').toLowerCase();
      if (addr.includes('indonesia') || addr.includes('jakarta') || addr.includes('surabaya') || addr.includes('bandung') || addr.includes('bali') || lurl.includes('indonesia')) {
        log.skip(`[${li + 1}/${uniqueListings.length}] "${bizName}" — Cross-border mismatch (found Indonesian address while scraping ${countryKey}). Skipping.`);
        if (!progress.urlsSeen.includes(listingUrl)) progress.urlsSeen.push(listingUrl);
        if (listingKey && !seen.places.has(listingKey)) {
          seen.places.add(listingKey);
          progress.placesSeen.push(listingKey);
          appendPlaceSeen(listingKey);
        }
        combo.offset = li + 1;
        continue;
      }
    }

    // ── EARLY PRE-FILTER #3: Review count pre-check (only if MIN_REVIEWS > 0) ──
    if (MIN_REVIEWS > 0 && listing.reviewCount != null && listing.reviewCount < MIN_REVIEWS) {
      log.skip(`[${li + 1}/${uniqueListings.length}] "${bizName || 'Listing'}" — reviews=${listing.reviewCount} < ${MIN_REVIEWS} (card pre-filter). Skipping page load.`);
      if (!progress.urlsSeen.includes(listingUrl)) progress.urlsSeen.push(listingUrl);
      if (listingKey && !seen.places.has(listingKey)) {
        seen.places.add(listingKey);
        progress.placesSeen.push(listingKey);
        appendPlaceSeen(listingKey);
      }
      combo.offset = li + 1;
      continue;
    }

    let details;
    if (listing.websiteUrl) {
      // 🚀 DIRECT CARD BYPASS: Website URL extracted directly from search card — 0ms page load!
      details = {
        businessName: bizName || 'Unknown',
        rating: listing.rating || 4.5,
        reviewCount: listing.reviewCount != null ? listing.reviewCount : 0,
        category: listing.cardCategory || null, // Never blindly force search keyword as category!
        phone: null,
        websiteUrl: listing.websiteUrl,
        mapsUrl: listingUrl,
        emails: [],
        address: listing.cardAddress || null,
      };
      if (!progress.urlsSeen.includes(listingUrl)) progress.urlsSeen.push(listingUrl);
      if (listingKey && !seen.places.has(listingKey)) {
        seen.places.add(listingKey);
        progress.placesSeen.push(listingKey);
        appendPlaceSeen(listingKey);
      }
    } else {
      // Fallback: Visit listing detail page ONLY if website button is missing from list card
      let clickedInPlace = false;
      if (listingKey) {
        try {
          const cardLink = await page.$(`div[role="feed"] a[href*="${listingKey}"], a[href*="${listingKey}"]`).catch(() => null);
          if (cardLink) {
            await cardLink.click({ timeout: 2000 });
            await sleep(400);
            clickedInPlace = true;
          }
        } catch (_) {}
      }

      if (!clickedInPlace) {
        try {
          await page.goto(listingUrl, { waitUntil: 'domcontentloaded', timeout: 15000 });
          await sleep(300);
        } catch (err) {
          log.skip(`Listing ${li + 1}/${uniqueListings.length} timeout. Skipping.`);
          if (!progress.urlsSeen.includes(listingUrl)) progress.urlsSeen.push(listingUrl);
          if (listingKey && !seen.places.has(listingKey)) {
            seen.places.add(listingKey);
            progress.placesSeen.push(listingKey);
            appendPlaceSeen(listingKey);
          }
          combo.offset = li + 1;
          saveProgress(progress);
          continue;
        }
      }

      // CAPTCHA check on detail page
      if (await checkCaptcha(page, progress)) {
        combo.offset = li;
        saveProgress(progress);
        return 'captcha';
      }

      if (!progress.urlsSeen.includes(listingUrl)) progress.urlsSeen.push(listingUrl);
      if (listingKey && !seen.places.has(listingKey)) {
        seen.places.add(listingKey);
        progress.placesSeen.push(listingKey);
        appendPlaceSeen(listingKey);
      }

      details = await extractBusinessDetails(page);
      details.emails = [];
    }

    // Qualify
    const { qualified, reasons, matchedSlug } = qualifyLead(details, progress, city, slug);
    if (!qualified) {
      log.skip(`[${li + 1}/${uniqueListings.length}] "${details.businessName || 'Unknown'}" — ${reasons.join(', ')}`);
      progress.skipped++;
      combo.offset = li + 1;
      saveProgress(progress);
      await sleep(SKIP_PAUSE_MS);
      continue;
    }

    // Organic search fallback if website missing
    if (!details.websiteUrl && details.businessName) {
      log.scraper(`[FALLBACK SEARCH] Attempting organic website search for "${details.businessName}" (${city})...`);
      const fallbackUrl = await searchOrganicWebsiteFallback(details.businessName, city);
      if (fallbackUrl) {
        log.scraper(`[FALLBACK SEARCH] Discovered website URL for "${details.businessName}": ${fallbackUrl}`);
        details.websiteUrl = fallbackUrl;
      }
    }

    // Website-less Lead Ingestion Track
    const normPhone = normalizePhoneE164(details.phone);
    if (!details.websiteUrl) {
      if (!normPhone) {
        log.skip(`[${li + 1}/${uniqueListings.length}] "${details.businessName}" — no website URL found and no phone number. Skipped as no-contact.`);
        progress.skipped++;
        combo.offset = li + 1;
        saveProgress(progress);
        await sleep(SKIP_PAUSE_MS);
        continue;
      }

      const bizKey = `${details.businessName.toLowerCase()}::${city.toLowerCase()}`;
      if (seen.businesses.has(bizKey)) {
        log.skip(`[${li + 1}/${uniqueListings.length}] "${details.businessName}" — business key already seen. Skipping wa_manual sync.`);
        combo.offset = li + 1;
        saveProgress(progress);
        await sleep(SKIP_PAUSE_MS);
        continue;
      }

      log.skip(`[${li + 1}/${uniqueListings.length}] "${details.businessName}" — No website/email found. Skipping database sync.`);
      seen.businesses.add(bizKey);
      if (!progress.businessesSeen.includes(bizKey)) {
        progress.businessesSeen.push(bizKey);
      }
      combo.offset = li + 1;
      saveProgress(progress);
      await sleep(SKIP_PAUSE_MS);
      continue;
    }

    // ── EARLY DEDUP #3: website domain already crawled or in-flight ──
    const webKey = websiteDedupKey(details.websiteUrl);
    if (webKey && (seen.websites.has(webKey) || (seen.inFlightWebsites && seen.inFlightWebsites.has(webKey)))) {
      log.skip(`[${li + 1}/${uniqueListings.length}] "${details.businessName}" — website "${webKey}" already crawled/in-flight. Skipping.`);
      combo.offset = li + 1;
      saveProgress(progress);
      await sleep(SKIP_PAUSE_MS);
      continue;
    }

    if (webKey && seen.inFlightWebsites) {
      seen.inFlightWebsites.add(webKey);
    }

    // Stream website URL into decoupled async HTTP crawler pool
    const enqueued = crawlerPool.enqueueWebsiteCrawl({
      businessName: details.businessName,
      websiteUrl: details.websiteUrl,
      placeKey: listingKey,
      nicheSlug: slug,
      niche: niche,
      city: city,
      matchedSlug: matchedSlug,
      phone: details.phone,
      rating: details.rating,
      reviewCount: details.reviewCount,
      mapsUrl: details.mapsUrl,
      locale: LOCALE
    });

    if (enqueued) {
      log.scraper(`[PRODUCER] Enqueued website crawl for "${details.businessName}" (${details.websiteUrl}) → Pool Queue: ${crawlerPool.getStats().queueLength}`);
    }

    combo.offset = li + 1;
    saveProgress(progress);
    await sleep(SKIP_PAUSE_MS);
    continue;
  }

  markExhausted(progress, key);
  markQueryVisited(progress, slug, city);
  log.rotation(`Combo ${key} EXHAUSTED at depth ${combo.depth} (${newFinds} new this visit, end of ${uniqueListings.length} cards).`);
  saveProgress(progress);
  return 'exhausted';
}

// ── Process one niche across all cities (up to the per-niche quota) ──
// Returns: 'done' · 'partial' (all cities exhausted/errored) · 'captcha' · 'quota'
async function processNiche(ctx, slug) {
  const { progress } = ctx;
  const collected = progress.nicheEmailCount[slug] || 0;
  if (collected >= NICHE_EMAIL_QUOTA) {
    log.rotation(`Niche "${slug}" already filled (${collected}/${NICHE_EMAIL_QUOTA}) this pass. Moving on.`);
    return 'done';
  }

  const needed = NICHE_EMAIL_QUOTA - collected;
  log.rotation(`Niche "${slug}" needs ${needed} more email(s) this pass.`);

  let anyOpen = false;
  for (const city of CITIES) {
    if (progress.emailsScrapedToday >= DAILY_QUOTA) return 'quota';
    if ((progress.nicheEmailCount[slug] || 0) >= NICHE_EMAIL_QUOTA) return 'done';

    // 4000MB (4GB) V8 Heap Memory Shield: auto-flush Playwright context & garbage collect if memory builds up
    const heapMb = Math.round(process.memoryUsage().heapUsed / (1024 * 1024));
    if (heapMb > 4000 && ctx.browser) {
      log.system(`[MEMORY SHIELD] Heap usage ${heapMb}MB > 4000MB cap. Auto-recycling browser context...`);
      try {
        if (ctx.page) await ctx.page.close().catch(() => {});
        if (ctx.browserCtx) await ctx.browserCtx.close().catch(() => {});
        ctx.browserCtx = await ctx.browser.newContext({
          userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36',
          locale: LOCALE === 'id' ? 'id-ID' : 'en-US'
        });
        ctx.page = await ctx.browserCtx.newPage();
        if (global.gc) global.gc();
      } catch (memErr) {
        log.error(`[MEMORY SHIELD] Browser recycling error: ${memErr.message}`);
      }
    }

    const key = comboKey(city, slug);
    if (isExhausted(progress, key)) {
      log.rotation(`Combo ${key} exhausted (depth ${(progress.perComboCursor[key] || {}).depth || 1}) — skipped.`);
      continue;
    }
    anyOpen = true;

    let result;
    do {
      const combo = getCombo(progress, city, slug);
      log.rotation(`  → City "${city}" (cursor ${combo.offset}, depth ${combo.depth}, kw ${combo.kwIndex || 0}, dist ${combo.distIndex || 0})`);
      result = await processCombo(ctx, city, slug, combo);

      if (result === 'captcha') return 'captcha';
      if (result === 'quota') return 'quota';
      if (result === 'done') {
        log.rotation(`Niche "${slug}" quota filled (${progress.nicheEmailCount[slug]}/${NICHE_EMAIL_QUOTA}).`);
        return 'done';
      }
    } while (result === 'next_district' || result === 'next_kw' || result === 'deepened');
    // 'exhausted' / 'error' → try the next city
  }

  if (!anyOpen) {
    log.rotation(`Niche "${slug}": all ${CITIES.length} city combo(s) exhausted — deferred to a future pass.`);
  }
  return 'partial';
}

// ── MAIN ──────────────────────────────────────────────────────
async function main() {
  console.log('\n' + '═'.repeat(60));
  console.log('  ScrapScrap Local Engine (Open Source)');
  console.log('  Google Maps Lead Scraper & Website Email Harvester');
  console.log('═'.repeat(60) + '\n');

  // Validate config
  if (!CITIES.length) {
    console.error('[ERROR] SCRAPER_CITIES empty in .env');
    process.exit(1);
  }

  // Clean any stale orphaned Chromium processes from previous abnormal terminations
  cleanStaleWorkerBrowser(RUN_ID);

  let progress = loadProgress();
  globalProgress = progress;

  const seenWebsitesSet = new Set(globalProgress?.websitesSeen || []);

  // Initialize decoupled HTTP Email Crawler Pool (20 worker threads) with DLQ & retry support
  crawlerPool = new EmailCrawlerPool({
    concurrency: parseInt(process.env.EMAIL_CRAWLER_CONCURRENCY, 10) || 20,
    maxRetries: 2,
    dlqPath: path.join(STATE_DIR, 'failed_websites.json'),
    cleanEmailAddress,
    isWebsiteSeen: (url) => {
      const key = EmailCrawlerPool.websiteDedupKey ? EmailCrawlerPool.websiteDedupKey(url) : null;
      return key ? seenWebsitesSet.has(key) : false;
    },
    markWebsiteSeen: (url) => {
      const key = EmailCrawlerPool.websiteDedupKey ? EmailCrawlerPool.websiteDedupKey(url) : null;
      if (key) seenWebsitesSet.add(key);
    }
  });

  crawlerPool.on('error', async ({ item, error }) => {
    if (shuttingDown || isShuttingDown) return;
    log.skip('[ASYNC CRAWLER ERROR] ' + (item?.websiteUrl || item?.businessName || 'unknown') + ': ' + (error?.message || error));
    if (item && item.businessName && item.city) {
      const normPhone = normalizePhoneE164(item.phone);
      const bizKey = `${item.businessName.toLowerCase()}::${item.city.toLowerCase()}`;
      const seen = buildSeenCache(globalProgress);
      if (bizKey && !seen.businesses.has(bizKey)) {
        seen.businesses.add(bizKey);
        if (!globalProgress.businessesSeen.includes(bizKey)) {
          globalProgress.businessesSeen.push(bizKey);
        }
        saveProgress(globalProgress);
      }
    }
  });

  crawlerPool.on('crawlFailed', async ({ item, error, fatal }) => {
    if (shuttingDown || isShuttingDown) return;
    const webKey = EmailCrawlerPool.websiteDedupKey(item?.websiteUrl);
    if (webKey && fatal) {
      const seen = buildSeenCache(globalProgress);
      seen.websites.add(webKey);
      if (globalProgress && !globalProgress.websitesSeen.includes(webKey)) {
        globalProgress.websitesSeen.push(webKey);
      }
    }
    log.skip(`[ASYNC CRAWLER DLQ] Website "${item?.websiteUrl || 'unknown'}" failed after retries: ${error?.message || error}. Recorded in DLQ.`);
  });

  crawlerPool.on('crawlCompleted', async ({ item, foundEmails, socialLinks }) => {
    if (shuttingDown || isShuttingDown) return;
    const seen = buildSeenCache(globalProgress);

    // Register website as successfully crawled in seen list
    const webKey = EmailCrawlerPool.websiteDedupKey(item.websiteUrl);
    if (webKey) {
      seen.websites.add(webKey);
      if (globalProgress && !globalProgress.websitesSeen.includes(webKey)) {
        globalProgress.websitesSeen.push(webKey);
      }
    }

    const newEmails = [];
    if (foundEmails && foundEmails.length > 0) {
      for (const e of foundEmails) {
        const clean = cleanEmailAddress(e);
        if (clean && !seen.emails.has(clean) && !newEmails.includes(clean)) {
          newEmails.push(clean);
        }
      }
    }

    if (newEmails.length > 0) {
      const lead = {
        businessName: item.businessName,
        city: item.city,
        niche: item.niche,
        matchedSlug: item.matchedSlug,
        phone: normalizePhoneE164(item.phone),
        rating: item.rating,
        reviewCount: item.reviewCount,
        mapsUrl: item.mapsUrl,
        websiteUrl: item.websiteUrl,
        emails: newEmails,
        socialLinks: socialLinks || {},
        status: 'new',
        locale: item.locale || LOCALE,
        scrapedAt: new Date().toISOString(),
      };

      const bizKey = `${item.businessName.toLowerCase()}::${item.city.toLowerCase()}`;
      seen.businesses.add(bizKey);
      if (!globalProgress.businessesSeen.includes(bizKey)) {
        globalProgress.businessesSeen.push(bizKey);
      }
      for (const email of newEmails) {
        seen.emails.add(email);
        if (!globalProgress.emailsSeen.includes(email)) {
          globalProgress.emailsSeen.push(email);
        }
        appendEmailSeen(email);
      }

      globalProgress.scraped++;
      globalProgress.emailsScrapedToday = (globalProgress.emailsScrapedToday || 0) + newEmails.length;
      if (item.nicheSlug) {
        globalProgress.nicheEmailCount[item.nicheSlug] = (globalProgress.nicheEmailCount[item.nicheSlug] || 0) + newEmails.length;
      }

      log.data(`[ASYNC CRAWLER STREAM] ✓ "${lead.businessName}" — ${lead.matchedSlug} | emails: ${newEmails.join(', ')}` +
        (socialLinks && socialLinks.instagram ? ` | IG: ${socialLinks.instagram}` : ''));

      appendResultsLocal([lead], item.niche, item.city);
      await syncLead(lead, globalProgress);
      saveProgress(globalProgress);
      return;
    }

    // Fallback: 0 new emails found -> check for phone-qualified lead (status: 'wa_manual')
    // Strict qualification: 0 new emails found -> mark seen and skip database sync
    const bizKey = item.businessName && item.city ? `${item.businessName.toLowerCase()}::${item.city.toLowerCase()}` : null;
    if (bizKey && !seen.businesses.has(bizKey)) {
      log.skip(`[ASYNC CRAWLER STREAM] "${item.businessName}" — 0 deliverable emails found. Skipping database sync.`);
      seen.businesses.add(bizKey);
      if (!globalProgress.businessesSeen.includes(bizKey)) {
        globalProgress.businessesSeen.push(bizKey);
      }
      saveProgress(globalProgress);
      return;
    }

    log.skip(`[ASYNC CRAWLER] "${item.businessName}" (${item.websiteUrl || 'no-url'}) — no new email found.`);
  });

  const quotaLabel = isFinite(DAILY_QUOTA) ? DAILY_QUOTA : '∞ (UNLIMITED)';
  log.rotation(`Run ID: ${runId} | Cities: ${CITIES.length} | Niches: ${NICHE_ORDER.length} | Pass target: ${NICHE_EMAIL_QUOTA} × ${NICHE_ORDER.length} = ${NICHE_EMAIL_QUOTA * NICHE_ORDER.length} emails`);
  log.rotation(`Resume state: pass ${progress.passesCompleted + 1} (${progress.passesCompleted} completed), niche ${Math.min(progress.currentNicheIndex + 1, NICHE_ORDER.length)}/${NICHE_ORDER.length}` +
    (progress.currentNicheIndex >= NICHE_ORDER.length ? ' (in-order sweep complete)' : ` (${NICHE_ORDER[progress.currentNicheIndex]})`) +
    `, needs-retry: [${progress.needsRetry.join(', ') || 'none'}]`);

  while (true) {
    globalProgress = progress;

    // Startup global seen-list synchronization
    await syncSeenListsWithDatabase(progress);
    const seen = buildSeenCache(progress);

    log.queue(`Daily unique email quota: ${quotaLabel} | Emails scraped today: ${progress.emailsScrapedToday} (from ${progress.scraped} leads)`);
    log.queue(`Global dedup: ${progress.emailsSeen.length} emails, ${progress.businessesSeen.length} businesses, ${progress.placesSeen.length} places, ${progress.websitesSeen.length} websites`);

    if (progress.emailsScrapedToday >= DAILY_QUOTA) {
      log.queue(`Daily unique email quota already reached (${progress.emailsScrapedToday}/${DAILY_QUOTA}). Waiting for new calendar day...`);
      await sleep(15 * 60 * 1000);
      continue;
    }

    // Launch browser with NVIDIA RTX 3060 Hardware Acceleration
    log.scraper(`Launching browser (headless=${HEADLESS}, locale=${LOCALE}, GPU hardware acceleration enabled)...`);
    const browser = await chromium.launch({
      headless: HEADLESS,
      args: [
        '--disable-blink-features=AutomationControlled',
        '--disable-dev-shm-usage',
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--ignore-gpu-blocklist',
        '--enable-gpu-rasterization',
        '--enable-zero-copy',
      ],
    });
    activeBrowser = browser;
    const bProc = typeof browser.process === 'function' ? browser.process() : null;
    if (bProc && bProc.pid) {
      saveWorkerBrowserPid(RUN_ID, bProc.pid);
    }

    let context = await browser.newContext({
      locale: LOCALE,
      userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
    });

    let page = await context.newPage();
    page.setDefaultTimeout(20000);

    const ctx = { get page() { return page; }, browser, progress, seen };
    let nichesProcessed = 0;
    let stopForQuota = false;

    try {
      const workOrder = buildWorkOrder(progress);
      log.rotation(`Work order this session: ${workOrder.map(o => o.slug + (o.isRetry ? '(retry)' : '')).join(' → ') || '(wrap only)'}`);

      for (const item of workOrder) {
        if (progress.emailsScrapedToday >= DAILY_QUOTA) { stopForQuota = true; break; }

        // Persist position BEFORE starting the niche (crash-safe resume)
        if (!item.isRetry) {
          progress.currentNicheIndex = item.index;
        }
        progress.lastNiche = nicheKeyword(item.slug); // legacy observability field
        saveProgress(progress);

        // ── Niche transition banner ──
        console.log('\n' + '─'.repeat(58));
        log.rotation(`▶ NICHE ${item.index + 1}/${NICHE_ORDER.length}: "${item.slug}" (${nicheKeyword(item.slug)})` +
          ` | pass ${progress.passesCompleted + 1} | collected ${progress.nicheEmailCount[item.slug] || 0}/${NICHE_EMAIL_QUOTA}` +
          (item.isRetry ? ' | NEEDS-RETRY (captcha recovery)' : ''));
        console.log('─'.repeat(58));

        // Recycle browser context every 5 niches to free leaked memory
        if (nichesProcessed > 0 && nichesProcessed % 5 === 0) {
          log.scraper('Recycling browser context to prevent memory leaks...');
          await context.close().catch(() => {});
          context = await browser.newContext({
            locale: LOCALE,
            userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
          });
          page = await context.newPage();
          page.setDefaultTimeout(20000);
        }

        const result = await processNiche(ctx, item.slug);
        nichesProcessed++;

        if (result === 'captcha') {
          if (!progress.needsRetry.includes(item.slug)) progress.needsRetry.push(item.slug);
          log.captcha(`Niche "${item.slug}" flagged needs-retry. State saved — exiting code 2 for backoff restart.`);
          saveProgress(progress);
          process.exit(2);
        }
        if (result === 'quota') { stopForQuota = true; break; }

        // Niche finished (quota filled or all cities exhausted) → advance pointer
        if (!item.isRetry) {
          progress.currentNicheIndex = item.index + 1;
        } else {
          progress.needsRetry = progress.needsRetry.filter(s => s !== item.slug);
          log.rotation(`Needs-retry niche "${item.slug}" cleared (${progress.nicheEmailCount[item.slug] || 0}/${NICHE_EMAIL_QUOTA}).`);
        }
        saveProgress(progress);

        log.rotation(`◀ NICHE ${item.index + 1}/${NICHE_ORDER.length} "${item.slug}" ${result === 'done' ? 'COMPLETE' : 'partial — will revisit next pass'} (${progress.nicheEmailCount[item.slug] || 0}/${NICHE_EMAIL_QUOTA}).`);
      }

      // Full work order finished → wrap to niche 1 and keep cycling
      if (!stopForQuota) {
        progress.currentNicheIndex = NICHE_ORDER.length; // marker: in-order sweep done
        wrapRotation(progress); // passesCompleted+1, currentNicheIndex → 0
        saveProgress(progress);
      } else {
        log.queue(`Daily unique email quota reached (${progress.emailsScrapedToday}/${quotaLabel}). Rotation state saved mid-order.`);
        saveProgress(progress);
      }

    } catch (err) {
      console.error(`[FATAL] Unhandled error: ${err.message}`);
      console.error(err.stack);
    } finally {
      saveProgress(progress);
      await browser.close().catch(() => {});
      removeWorkerBrowserPid(RUN_ID);

      console.log('\n' + '═'.repeat(60));
      console.log('  ScrapScrap Session Summary');
      console.log('═'.repeat(60));
      console.log(`  Date:      ${progress.date}`);
      console.log(`  Pass:      ${progress.passesCompleted + 1} (${progress.passesCompleted} completed, niche pointer: ${progress.currentNicheIndex})`);
      console.log(`  Emails:    ${progress.emailsScrapedToday}/${isFinite(DAILY_QUOTA) ? DAILY_QUOTA : '∞'}`);
      console.log(`  Leads:     ${progress.scraped} total`);
      console.log(`  Synced:    ${progress.synced}`);
      console.log(`  Skipped:   ${progress.skipped}`);
      console.log(`  Emails DB: ${progress.emailsSeen.length} total`);
      console.log(`  Biz DB:    ${progress.businessesSeen.length} total`);
      console.log('═'.repeat(60) + '\n');
    }

    log.queue(`[DAEMON] Sweep session completed pass ${progress.passesCompleted}. Sleeping ${PASS_PAUSE_SECS} seconds before next sweep check...`);
    await sleep(PASS_PAUSE_SECS * 1000);
  }
}

// ── Run ───────────────────────────────────────────────────────
main().catch(err => {
  console.error('[FATAL] Top-level crash:', err);
  process.exit(1);
});
