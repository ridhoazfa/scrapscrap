// ============================================================
// server.js — Standalone Lead Studio HTTP Server
// ScrapScrap Open Source Suite
//
// Zero-dependency native Node HTTP server providing REST API
// and serving the Apple-grade Lead Studio interface on port 3800.
// ============================================================

const http = require('http');
const fs = require('fs');
const path = require('path');
const { spawn } = require('child_process');

const store = require('../data/store');
const validator = require('../core/validator');

const PORT = parseInt(process.env.PORT, 10) || 3800;
const PUBLIC_DIR = path.join(__dirname, 'public');

let activeScraperProcess = null;
let activeScraperLog = [];

function sendJson(res, statusCode, data) {
  res.writeHead(statusCode, {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type'
  });
  res.end(JSON.stringify(data));
}

function parseJsonBody(req) {
  return new Promise((resolve, reject) => {
    let body = '';
    req.on('data', chunk => {
      body += chunk;
      if (body.length > 10 * 1024 * 1024) {
        req.destroy();
        reject(new Error('Payload too large'));
      }
    });
    req.on('end', () => {
      try {
        resolve(body ? JSON.parse(body) : {});
      } catch (err) {
        reject(err);
      }
    });
    req.on('error', reject);
  });
}

const server = http.createServer(async (req, res) => {
  // CORS Preflight
  if (req.method === 'OPTIONS') {
    res.writeHead(204, {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type'
    });
    res.end();
    return;
  }

  const parsedUrl = new URL(req.url, `http://${req.headers.host || 'localhost'}`);
  const pathname = parsedUrl.pathname;
  const query = Object.fromEntries(parsedUrl.searchParams);

  try {
    // ── API Routes ──────────────────────────────────────────────
    if (pathname === '/api/stats' && req.method === 'GET') {
      const stats = store.getStats();
      return sendJson(res, 200, {
        ...stats,
        isScraperActive: !!activeScraperProcess,
        recentLogs: activeScraperLog.slice(-20)
      });
    }

    if (pathname === '/api/leads' && req.method === 'GET') {
      const results = store.queryLeads(query);
      return sendJson(res, 200, results);
    }

    if (pathname.startsWith('/api/leads/') && req.method === 'PUT') {
      const id = pathname.replace('/api/leads/', '').trim();
      const body = await parseJsonBody(req);
      const updated = store.updateLead(id, body);
      if (!updated) return sendJson(res, 404, { error: 'Lead not found' });
      return sendJson(res, 200, { success: true, lead: updated });
    }

    if (pathname.startsWith('/api/leads/') && req.method === 'DELETE') {
      const id = pathname.replace('/api/leads/', '').trim();
      const deleted = store.deleteLead(id);
      return sendJson(res, 200, { success: deleted });
    }

    if (pathname === '/api/verify' && req.method === 'POST') {
      const body = await parseJsonBody(req);
      const rawEmail = (body.email || '').trim();
      const clean = validator.cleanEmailAddress(rawEmail);
      if (!clean) {
        return sendJson(res, 200, {
          email: rawEmail,
          deliverable: false,
          reason: 'Syntax invalid, blacklisted role, or dummy address'
        });
      }

      const domain = clean.split('@')[1];
      const hasMx = await validator.verifyDomainMx(domain);
      return sendJson(res, 200, {
        email: clean,
        deliverable: hasMx,
        mxRecords: hasMx,
        domain
      });
    }

    if (pathname === '/api/export/csv' && req.method === 'GET') {
      const results = store.queryLeads({ ...query, limit: 100000 });
      const csv = store.exportToCsv(results.leads);
      res.writeHead(200, {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': 'attachment; filename="scrapscrap-leads.csv"'
      });
      res.end(csv);
      return;
    }

    if (pathname === '/api/scrape/start' && req.method === 'POST') {
      if (activeScraperProcess) {
        return sendJson(res, 400, { error: 'A scraper job is already running' });
      }

      let body = {};
      try {
        body = await parseJsonBody(req);
      } catch (err) {
        return sendJson(res, 400, { error: 'Invalid JSON payload: ' + err.message });
      }

      const sanitizeStr = (s, maxLen = 256) => String(s || '').replace(/[\r\n\0]/g, '').slice(0, maxLen).trim();
      const cities = sanitizeStr(body.city || body.cities || 'Jakarta');
      const country = sanitizeStr(body.country || 'indonesia');
      const niche = sanitizeStr(body.niche || 'Gym');
      const minRating = sanitizeStr(body.minRating || '4.0', 16);
      const minReviews = sanitizeStr(body.minReviews || '100', 16);
      const headless = (body.headless === false || body.headless === 'false') ? 'false' : 'true';

      activeScraperLog = [`[STUDIO] Starting scraper run: ${cities} (${niche}) [Mode: ${headless === 'true' ? 'Headless' : 'Visual Window'}]...`];

      const envCopy = {
        ...process.env,
        SCRAPER_CITIES: cities,
        SCRAPER_COUNTRY: country,
        SCRAPER_NICHES: niche,
        SCRAPER_MIN_RATING: minRating,
        SCRAPER_MIN_REVIEWS: minReviews,
        SCRAPER_HEADLESS: headless,
        SCRAPER_RUN_ID: `studio-${Date.now().toString().slice(-4)}`
      };

      const cliPath = path.join(__dirname, '../cli.js');
      activeScraperProcess = spawn(process.execPath, [cliPath], {
        env: envCopy,
        cwd: path.join(__dirname, '../../')
      });

      activeScraperProcess.stdout.on('data', data => {
        const lines = data.toString().split('\n').filter(Boolean);
        for (const l of lines) {
          activeScraperLog.push(l.trim());
          if (activeScraperLog.length > 200) activeScraperLog.shift();
        }
      });

      activeScraperProcess.stderr.on('data', data => {
        activeScraperLog.push(`[ERR] ${data.toString().trim()}`);
      });

      activeScraperProcess.on('close', code => {
        activeScraperLog.push(`[STUDIO] Scraper process completed (exit code ${code}).`);
        activeScraperProcess = null;
      });

      return sendJson(res, 200, { success: true, message: 'Scraper started' });
    }

    if (pathname === '/api/scrape/stop' && req.method === 'POST') {
      if (activeScraperProcess) {
        try {
          if (process.platform === 'win32') {
            const { execSync } = require('child_process');
            execSync(`taskkill /pid ${activeScraperProcess.pid} /T /F >nul 2>&1`);
          } else {
            process.kill(-activeScraperProcess.pid, 'SIGINT');
          }
        } catch (_) {
          try { activeScraperProcess.kill('SIGINT'); } catch (__) {}
        }
        activeScraperProcess = null;
        activeScraperLog.push('[STUDIO] Scraper process terminated by user.');
      }
      return sendJson(res, 200, { success: true, message: 'Scraper stopped' });
    }

    // ── Static Files ────────────────────────────────────────────
    let cleanPath = pathname || '/';
    try { cleanPath = decodeURIComponent(cleanPath); } catch (_) {}
    if (cleanPath.indexOf('\0') !== -1) {
      res.writeHead(400);
      return res.end('Bad Request');
    }

    const resolvedPublic = path.resolve(PUBLIC_DIR);
    let filePath = path.resolve(resolvedPublic, '.' + path.normalize('/' + (cleanPath === '/' ? 'index.html' : cleanPath)));
    if (!filePath.startsWith(resolvedPublic + path.sep) && filePath !== path.join(resolvedPublic, 'index.html')) {
      res.writeHead(403);
      return res.end('Forbidden');
    }

    if (fs.existsSync(filePath) && fs.statSync(filePath).isFile()) {
      const ext = path.extname(filePath).toLowerCase();
      const contentTypes = {
        '.html': 'text/html; charset=utf-8',
        '.css': 'text/css; charset=utf-8',
        '.js': 'application/javascript; charset=utf-8',
        '.json': 'application/json',
        '.svg': 'image/svg+xml'
      };
      res.writeHead(200, { 'Content-Type': contentTypes[ext] || 'text/plain' });
      fs.createReadStream(filePath).pipe(res);
      return;
    }

    // Fallback to index.html for SPA client navigation
    const indexPath = path.join(PUBLIC_DIR, 'index.html');
    if (fs.existsSync(indexPath)) {
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
      fs.createReadStream(indexPath).pipe(res);
      return;
    }

    res.writeHead(404);
    res.end('Not Found');
  } catch (err) {
    console.error('[HTTP ERROR]', err);
    sendJson(res, 500, { error: err.message });
  }
});

server.listen(PORT, () => {
  console.log(`\n============================================================`);
  console.log(`  ScrapScrap Lead Studio running at:`);
  console.log(`  -> http://localhost:${PORT}`);
  console.log(`============================================================\n`);
});

module.exports = server;
