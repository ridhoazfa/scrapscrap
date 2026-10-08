// ============================================================
// generate-launchers.cjs — Generates 1-Click Launchers per Country
// ScrapScrap Open Source Suite
//
// Reads countries.json and creates launchers/*.bat files.
// Each launcher spawns parallel workers (one per city) with isolated RUN_IDs.
// ============================================================

const fs = require('fs');
const path = require('path');

const countriesPath = path.join(__dirname, 'countries.json');
const countries = JSON.parse(fs.readFileSync(countriesPath, 'utf8'));
const outDir = path.join(__dirname, 'launchers');
if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

// Wipe stale batch files
for (const f of fs.readdirSync(outDir)) {
  if (f.endsWith('.bat')) fs.rmSync(path.join(outDir, f));
}

let parts = 0, workers = 0;
for (const c of countries) {
  (c.splits || []).forEach((cities, i) => {
    const part = i + 1;
    const lines = [
      '@echo off',
      `REM ScrapScrap - 1-Click Multi-City Worker Pool (${c.name} Part ${part})`,
      'cd /d "%~dp0\\.."',
      'if exist "data\\state\\STOP_ALL_SCRAPERS" del /f /q "data\\state\\STOP_ALL_SCRAPERS" >nul 2>&1',
      ''
    ];

    cities.forEach((city, w) => {
      const wid = w + 1;
      const runId = `${c.name}-pt${part}-w${wid}`;
      const title = `ScrapScrapWorker ${c.name}-pt${part} [${city}]`;
      lines.push(`start "${title}" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=${c.name}&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=${city}&& set SCRAPER_LOCALE=${c.locale}&& set SCRAPER_RUN_ID=${runId}&& call run-core.bat"`);
      workers++;
    });

    lines.push(
      '',
      `echo Launched ${cities.length} worker(s) for ${c.name}-pt${part}.`,
      'echo Press any key to close this launcher console (workers will keep running).',
      'pause >nul'
    );

    const body = lines.join('\r\n');
    fs.writeFileSync(path.join(outDir, `run-${c.name}-pt${part}.bat`), body, 'utf-8');
    parts++;
  });
}

console.log(`[GENERATOR] Generated ${parts} launchers with ${workers} worker slots in launchers/`);
