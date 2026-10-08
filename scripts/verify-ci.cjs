const assert = require('assert');
const store = require('../src/data/store');
const CrawlerPool = require('../src/core/crawler-pool');
const pool = new CrawlerPool();

console.log('[CI] Running CSV DDE Formula Injection test...');
const csv = store.exportToCsv([{ id: 't1', businessName: '=cmd|A0', primaryEmail: 'a@example.com' }]);
assert(csv.includes("'=cmd"), 'Must neutralize = formula with single quote');

console.log('[CI] Running SSRF protection test...');
assert.strictEqual(pool.enqueueWebsiteCrawl('T', 'http://127.0.0.1'), false, 'Must block 127.0.0.1');
assert.strictEqual(pool.enqueueWebsiteCrawl('T', 'http://169.254.169.254'), false, 'Must block metadata IP');
assert.strictEqual(pool.enqueueWebsiteCrawl('T', 'file:///etc/passwd'), false, 'Must block file:// protocol');
assert.strictEqual(pool.enqueueWebsiteCrawl('T', 'https://example.com'), true, 'Must allow public domain');

console.log('[CI] All sanity checks passed cleanly.');
process.exit(0);
