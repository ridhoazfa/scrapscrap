// ============================================================
// process-reaper.js — Anti-Zombie Process Reaper
// ScrapScrap Open Source Suite
//
// Reaps orphaned Playwright Chromium instances and child workers
// by reading recorded worker PIDs in data/state/pid-*.json.
// Safe and targeted: NEVER kills the user's personal Google Chrome.
// ============================================================

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const STATE_DIR = path.join(__dirname, '../../data/state');

function killPidTree(pid) {
  if (!pid || typeof pid !== 'number') return;
  try {
    if (process.platform === 'win32') {
      execSync(`taskkill /pid ${pid} /T /F >nul 2>&1`);
    } else {
      process.kill(-pid, 'SIGKILL');
    }
  } catch (_) {}
}

function reapAllRecordedWorkers() {
  if (!fs.existsSync(STATE_DIR)) return 0;
  let reaped = 0;

  try {
    const files = fs.readdirSync(STATE_DIR);
    for (const file of files) {
      if (file.startsWith('pid-') && file.endsWith('.json')) {
        const fullPath = path.join(STATE_DIR, file);
        try {
          const raw = fs.readFileSync(fullPath, 'utf8');
          const data = JSON.parse(raw);
          if (data && data.pid) {
            console.log(`[PROCESS REAPER] Terminating Chromium worker PID ${data.pid} (run: ${data.runId || 'unknown'})...`);
            killPidTree(data.pid);
            reaped++;
          }
        } catch (_) {}
        try { fs.unlinkSync(fullPath); } catch (_) {}
      }
    }
  } catch (err) {
    console.error('[PROCESS REAPER ERROR]', err.message);
  }

  return reaped;
}

if (require.main === module) {
  const count = reapAllRecordedWorkers();
  console.log(`[PROCESS REAPER] Finished. Cleaned ${count} worker process(es).`);
}

module.exports = {
  killPidTree,
  reapAllRecordedWorkers
};
