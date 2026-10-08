// ============================================================
// validator.js — 5-Layer Email Deliverability & Verification Engine
// ScrapScrap Open Source Suite
//
// 5-Layer Defense:
//   Layer 1: Syntax hygiene, percent-decoding, asset extension stripping
//   Layer 2: Multi-lingual placeholder / dummy username blacklist
//   Layer 3: Template & developer demo domain blacklist
//   Layer 4: ESP Reserved System Desk traps (support@yahoo.com, etc.)
//   Layer 5: Persistent dead domains suppression + DNS MX verification
// ============================================================

const dns = require('dns');
const fs = require('fs');
const path = require('path');

try {
  dns.setServers(['1.1.1.1', '8.8.8.8']);
} catch (_) {}

const resolveMx = dns.promises.resolveMx;

// ── Persistent Dead Domains & Dead Emails Cache ───────────────
const DEAD_DOMAINS_SET = new Set();
const DEAD_EMAILS_SET = new Set();
const STATE_DIR = path.join(__dirname, '../../data/state');
const DEAD_DOMAINS_PATH = path.join(STATE_DIR, 'dead_domains.txt');
const DEAD_EMAILS_PATH = path.join(STATE_DIR, 'dead_emails.txt');

function reloadDeadLists() {
  if (!fs.existsSync(STATE_DIR)) {
    try { fs.mkdirSync(STATE_DIR, { recursive: true }); } catch (_) {}
  }

  if (fs.existsSync(DEAD_DOMAINS_PATH)) {
    try {
      const content = fs.readFileSync(DEAD_DOMAINS_PATH, 'utf8');
      content.split(/\r?\n/).forEach(line => {
        const trimmed = line.trim().toLowerCase();
        if (trimmed) DEAD_DOMAINS_SET.add(trimmed);
      });
    } catch (_) {}
  }

  if (fs.existsSync(DEAD_EMAILS_PATH)) {
    try {
      const content = fs.readFileSync(DEAD_EMAILS_PATH, 'utf8');
      content.split(/\r?\n/).forEach(line => {
        const trimmed = line.trim().toLowerCase();
        if (trimmed) DEAD_EMAILS_SET.add(trimmed);
      });
    } catch (_) {}
  }
}
reloadDeadLists();

// ── Real & Known TLD Tables for Concatenated Domain Repairs ────
const REAL_TLDS = new Set([
  'com.au', 'net.au', 'org.au', 'co.id', 'ac.id', 'sch.id', 'web.id', 'or.id', 'go.id', 'my.id', 'biz.id',
  'co.uk', 'org.uk', 'ac.uk', 'gov.uk', 'co.nz', 'org.nz', 'com.sg', 'net.sg', 'org.sg', 'com.my', 'net.my',
  'com.ph', 'co.th', 'com.vn', 'com.hk', 'org.hk', 'com.tw', 'com.cn', 'co.jp', 'co.kr', 'co.in', 'com.pk',
  'co.za', 'com.mx', 'com.br', 'com.ar', 'com.co', 'com', 'net', 'org', 'edu', 'gov', 'info', 'biz', 'app',
  'dev', 'io', 'ai', 'me', 'tv', 'cc', 'co', 'online', 'site', 'website', 'store', 'shop', 'blog', 'tech',
  'cloud', 'digital', 'agency', 'solutions', 'services', 'company', 'studio', 'design', 'photography',
  'dental', 'legal', 'lawyer', 'clinic', 'care', 'health', 'medical', 'doctor', 'spa', 'salon', 'gym', 'fit',
  'hotel', 'villa', 'realestate', 'cleaning', 'laundry', 'florist', 'wedding', 'education', 'school', 'academy',
  'car', 'auto', 'wash', 'detailing', 'pet', 'vet', 'grooming', 'bakery', 'cake', 'food', 'id', 'au', 'sg',
  'my', 'uk', 'us', 'nz', 'ca', 'de', 'fr', 'jp', 'kr', 'cn', 'hk', 'tw', 'th', 'vn', 'ph', 'in', 'pk', 'bd',
  'lk', 'ae', 'sa', 'qa', 'kw', 'il', 'tr', 'za', 'mx', 'br', 'ar', 'cl', 'pe', 'nl', 'se', 'no', 'fi', 'dk',
  'be', 'ch', 'at', 'es', 'it', 'pt', 'pl', 'cz', 'sk', 'hu', 'hr', 'ro', 'bg', 'gr', 'ru', 'ua', 'ie'
]);

const KNOWN_TLDS = [
  'com.au', 'com.sg', 'com.my', 'com.ph', 'co.id', 'co.uk', 'co.nz',
  'co.jp', 'ne.jp', 'or.jp', 'ac.jp', 'com.mx', 'com.br', 'com.es', 'com.ar', 'com.co', 'co.at', 'co.it',
  'ac.id', 'sch.id', 'web.id', 'or.id', 'go.id',
  'com', 'net', 'org', 'edu', 'gov', 'info', 'biz',
  'id', 'io', 'co', 'au', 'sg', 'my', 'uk', 'me', 'de', 'fr', 'es', 'it', 'jp', 'br', 'mx',
];

function fixConcatenatedTld(domain) {
  if (!domain || typeof domain !== 'string') return domain;
  const labels = domain.split('.');
  for (let l = Math.min(3, labels.length - 1); l >= 1; l--) {
    if (REAL_TLDS.has(labels.slice(-l).join('.'))) return domain;
  }
  for (const tld of KNOWN_TLDS) {
    const marker = '.' + tld;
    const idx = domain.lastIndexOf(marker);
    if (idx > 0) {
      const tail = domain.slice(idx + marker.length);
      if (/^[a-z]{3,}$/.test(tail)) return domain.slice(0, idx + marker.length);
    }
  }
  return domain;
}

function stripPhonePrefix(local) {
  if (!local || typeof local !== 'string') return local;
  let m = local.match(/^\+?\d[\d().\-\s]{4,}(?=[a-z])/);
  if (m) return local.slice(m[0].length);
  m = local.match(/^\+\d{1,3}[-.]?(?=[a-z])/);
  if (m) return local.slice(m[0].length);
  return local;
}

function decodeCloudflareEmail(cfHex) {
  if (!cfHex || typeof cfHex !== 'string') return '';
  const cleanHex = cfHex.trim().replace(/^.*#/, '').replace(/[^0-9a-fA-F]/g, '');
  if (cleanHex.length < 4 || cleanHex.length % 2 !== 0) return '';
  try {
    const k = parseInt(cleanHex.substr(0, 2), 16);
    let email = '';
    for (let n = 2; n < cleanHex.length; n += 2) {
      const charCode = parseInt(cleanHex.substr(n, 2), 16) ^ k;
      email += String.fromCharCode(charCode);
    }
    return email;
  } catch (_) {
    return '';
  }
}

// ── Banned Dictionaries & Blacklists ──────────────────────────
const BANNED_USERNAMES = new Set([
  'example', 'test', 'testing', 'user', 'username', 'email', 'youremail', 'yourmail', 'your-email', 'your_email',
  'my.email', 'mymail', 'myemail', 'emal', 'sample', 'address', 'mailservice', 'beispiel', 'ejemplo', 'asdf',
  'name', 'yourname', 'your_name', 'your-name', 'myname', 'filler', 'placeholder', 'dummy', 'temp', 'temporary',
  'formtest', 'noreply', 'no-reply', 'donotreply', 'admin123', 'na', 'none', 'null', 'mail123', 'email123', 'abcde',
  'quiz-counter', 'synth', 'synthetic', 'mock', 'fake', 'lead-test', 'test-lead'
]);

const BANNED_DOMAINS = new Set([
  'example.com', 'example.org', 'example.net', 'example.edu',
  'domain.com', 'email.com', 'site.com', 'test.com', 'template.com',
  'yourdomain.com', 'yourcompany.com', 'mywebsite.com', 'webpage.com',
  'sentry.io', 'wixpress.com', 'wix.com', 'weebly.com', 'squarespace.com',
  'shopify.com', 'godaddy.com', 'wordpress.org', 'wordpress.com',
  'bootstrap.com', 'jquery.com', 'gravatar.com', 'github.com', 'google.com',
  'facebook.com', 'instagram.com', 'twitter.com', 'linkedin.com', 'pinterest.com',
  'mail.com', 'bugsnag.com', 'rollbar.com', 'datadoghq.com', 'newrelic.com',
  'intercom.io', 'hubspot.com', 'drift.com', 'zendesk.com', 'cloudflare.com',
  'schema.org', 'w3.org', 'mailservice.com', 'traveler.com', 'extension.com',
  'sample.com', 'youremail.com', 'address.com', 'divi.express', 'beispiel.de',
  'beispiel.at', 'domain.com.au', 'domain.at', 'domain.ch', 'yahooinc.com', 'microsoft.com',
  'info.com', 'canvas.com', 'tejani.clinic',
  'ragtorichescleaningsolutions.com', 'floridajustice.com',
  'latofonts.com', 'open-sans.com', 'montserrat.com', 'roboto.org',
  'inter-font.com', 'fontfabric.com', 'monotype.com', 'linotype.com',
  'dafont.com', 'fontsquirrel.com', 'myfonts.com', 'underware.nl',
  'daltonmaag.com', 'fontspring.com', 'fonts.com', 'lineto.com',
  'fontbureau.com', 'typography.com', 'typekit.net', 'adobe.com',
  'unpkg.com', 'jsdelivr.net', 'cdnjs.com', 'fontawesome.com', 'fortawesome.com',
  'de-juris.com', 'templatemonster.com', 'themeforest.net', 'envato.com',
  'surecart.com', 'elementor.com', 'wpengine.com', 'woocommerce.com',
  'gravityforms.com', 'contactform7.com', 'wpastra.com', 'kadencewp.com',
  'cpanel.net', 'whmcs.com', 'automattic.com', 'wp.com'
]);

const MAJOR_ESPS = new Set([
  'gmail.com', 'googlemail.com', 'yahoo.com', 'yahoo.co.id', 'yahoo.co.uk',
  'hotmail.com', 'outlook.com', 'live.com', 'msn.com',
  'icloud.com', 'me.com', 'mac.com', 'protonmail.com', 'proton.me', 'zoho.com', 'aol.com'
]);

const ESP_BANNED_ROLES = new Set([
  'support', 'admin', 'contact', 'info', 'help', 'billing', 'service',
  'abuse', 'security', 'postmaster', 'webmaster', 'sales', 'feedback',
  'compliance', 'team', 'office', 'general', 'hello', 'hi', 'marketing', 'privacy', 'legal'
]);

/**
 * Synchronous email syntax cleaner and pattern disqualifier.
 * Returns clean lowercase email string, or empty string if disqualified.
 * @param {string} rawEmail 
 * @returns {string}
 */
function cleanEmailAddress(rawEmail) {
  if (!rawEmail || typeof rawEmail !== 'string') return '';
  let email = rawEmail.trim().toLowerCase();

  try {
    email = decodeURIComponent(email);
  } catch (_) {}

  email = email.replace(/^(mailto:|email:|url:|tel:|\/\/|\s+)+/i, '');
  if (/^(n\/?a|none|null|undefined|no[-_ ]?email|tidak\s?ada)(@|$)/.test(email)) return '';

  email = email.replace(/\\u([0-9a-f]{4})/gi, (_, hex) => {
    try { return String.fromCharCode(parseInt(hex, 16)); } catch (_) { return ''; }
  });
  email = email.replace(/^u00[0-9a-f]{2}/i, '');

  const match = email.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/);
  if (!match) return '';

  let finalEmail = match[0].trim().replace(/[,.;:]+$/, '');
  finalEmail = finalEmail.replace(/%[0-9a-f]{2}/gi, '');
  finalEmail = finalEmail.replace(/[\s\r\n]/g, '');

  let [username, domain] = finalEmail.split('@');
  if (!username || !domain) return '';
  username = username.replace(/^u00[0-9a-f]{2}/i, '');

  const hadLeadingDot = username.startsWith('.');
  username = stripPhonePrefix(username);
  username = username.replace(/^[^a-z0-9]+/, '').replace(/[^a-z0-9]+$/, '');
  if (hadLeadingDot && username.length <= 3) return '';
  if (/\.fb$/.test(username) || username.includes('.fb.')) return '';

  domain = domain.replace(/[^a-z0-9.-]/gi, '').replace(/[,.;:]+$/, '').replace(/\.+$/, '');
  domain = fixConcatenatedTld(domain);

  if (!username || username.length < 1) return '';
  if (/^\d+$/.test(username)) return '';
  if (!domain.includes('.')) return '';
  finalEmail = `${username}@${domain}`;

  // Layer 1: Asset extensions
  const ends = ['.png', '.jpg', '.jpeg', '.gif', '.svg', '.webp', '.ico', '.bmp', '.css', '.js', '.woff', '.woff2', '.ttf', '.eot', '.pdf', '.zip', '.mp4', '.mp3', '.avif'];
  if (ends.some(ext => finalEmail.endsWith(ext))) return '';
  if (/@\d+x\./.test(finalEmail) || /@\d+x$/i.test(finalEmail)) return '';

  // Layer 2: Banned Usernames
  if (BANNED_USERNAMES.has(username)) return '';

  // Layer 3: Banned Domains
  if (BANNED_DOMAINS.has(domain)) return '';
  for (const banned of BANNED_DOMAINS) {
    if (domain.endsWith('.' + banned)) return '';
  }
  if (domain.startsWith('example.') || domain.includes('-staging') || domain.endsWith('.fb')) return '';

  // Layer 4: ESP Reserved System Desk Traps
  if (MAJOR_ESPS.has(domain)) {
    if (ESP_BANNED_ROLES.has(username)) return '';
    if (/\.(com|shop|id|co\.id|net|org|xyz|site|online|store|info|biz|ae|ch|de|be|club|live|tech|app|io|agency|ltd|group|cc|me|asia|space)$/i.test(username)) {
      return '';
    }
  }

  // Layer 5: Persistent dead list check
  if (DEAD_DOMAINS_SET.has(domain)) return '';
  if (DEAD_EMAILS_SET.has(finalEmail)) return '';

  if (domain.includes('.gov') || domain.includes('.go.id') || domain.includes('.mil')) return '';
  if (domain.endsWith('.belajar.id') || domain.includes('.edu') || domain.includes('.ac.id') || domain.includes('.sch.id')) return '';

  return finalEmail;
}

// ── In-Memory MX Verification Cache (24-Hour TTL) ──────────────
const MX_CACHE = new Map();
const MX_CACHE_TTL_MS = 24 * 60 * 60 * 1000;

/**
 * Asynchronously verifies if a domain has valid Mail Exchange (MX) DNS records.
 * @param {string} domain 
 * @returns {Promise<boolean>}
 */
async function verifyDomainMx(domain) {
  const cleanDomain = (domain || '').toLowerCase().trim();
  if (!cleanDomain || !cleanDomain.includes('.') || cleanDomain.startsWith('.') || cleanDomain.endsWith('.')) {
    return false;
  }

  if (BANNED_DOMAINS.has(cleanDomain) || DEAD_DOMAINS_SET.has(cleanDomain)) {
    return false;
  }

  if (MAJOR_ESPS.has(cleanDomain)) {
    return true;
  }

  const cached = MX_CACHE.get(cleanDomain);
  if (cached && cached.expiresAt > Date.now()) {
    return cached.ok;
  }

  try {
    const records = await Promise.race([
      resolveMx(cleanDomain),
      new Promise((_, reject) => setTimeout(() => reject(new Error('TIMEOUT')), 2500))
    ]);

    const isValid = Array.isArray(records) && records.length > 0 && records.some(r => r.exchange && r.exchange.trim() !== '' && r.exchange.trim() !== '.');
    MX_CACHE.set(cleanDomain, { ok: isValid, expiresAt: Date.now() + MX_CACHE_TTL_MS });
    if (!isValid) {
      DEAD_DOMAINS_SET.add(cleanDomain);
    }
    return isValid;
  } catch (err) {
    const isAuthoritativeDead = err && (err.code === 'ENOTFOUND' || err.code === 'ENODATA');
    if (isAuthoritativeDead) {
      MX_CACHE.set(cleanDomain, { ok: false, expiresAt: Date.now() + MX_CACHE_TTL_MS });
      DEAD_DOMAINS_SET.add(cleanDomain);
    } else {
      // Transient error (TIMEOUT, ESERVFAIL, ECONNREFUSED) — cache for only 10m without poisoning persistent DEAD_DOMAINS_SET
      MX_CACHE.set(cleanDomain, { ok: false, expiresAt: Date.now() + 10 * 60 * 1000 });
    }
    return false;
  }
}

/**
 * Validates syntax, blacklists, and verifies DNS MX deliverability.
 * @param {string} rawEmail 
 * @returns {Promise<string>} Clean email if deliverable, empty string if rejected
 */
async function isDeliverableEmail(rawEmail) {
  const clean = cleanEmailAddress(rawEmail);
  if (!clean) return '';
  const domain = clean.split('@')[1];
  const hasMx = await verifyDomainMx(domain);
  return hasMx ? clean : '';
}

module.exports = {
  cleanEmailAddress,
  verifyDomainMx,
  isDeliverableEmail,
  decodeCloudflareEmail,
  stripPhonePrefix,
  fixConcatenatedTld,
  reloadDeadLists,
  BANNED_USERNAMES,
  BANNED_DOMAINS,
  MAJOR_ESPS,
  DEAD_DOMAINS_SET,
  DEAD_EMAILS_SET
};
