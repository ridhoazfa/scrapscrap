// ============================================================
// index.js — Programmatic API & Primitives for ScrapScrap
// ScrapScrap Open Source Suite
//
// Clean Node.js exports for custom automation scripts,
// integrations, and AI-agent autonomous workflows.
// ============================================================

const store = require('./data/store');
const validator = require('./core/validator');
const EmailCrawlerPool = require('./core/crawler-pool');
const niches = require('./core/niches');
const spatial = require('./core/spatial');

/**
 * Verify a single email address with 5-layer deliverability check.
 * @param {string} email
 * @returns {Promise<string>} Deliverable email or empty string if invalid/undeliverable
 */
async function verifyEmail(email) {
  return validator.isDeliverableEmail(email);
}

/**
 * Check if a domain has valid DNS MX records.
 * @param {string} domain
 * @returns {Promise<boolean>}
 */
async function checkDomainMx(domain) {
  return validator.verifyDomainMx(domain);
}

/**
 * Clean and normalize an email address synchronously.
 * @param {string} email
 * @returns {string} Clean email or empty string
 */
function cleanEmail(email) {
  return validator.cleanEmailAddress(email);
}

/**
 * Query leads from the local database with optional filters.
 * @param {object} options
 */
function getLeads(options = {}) {
  return store.queryLeads(options);
}

/**
 * Update an existing lead record.
 * @param {string} id
 * @param {object} updates
 */
function updateLead(id, updates) {
  return store.updateLead(id, updates);
}

/**
 * Export leads to RFC4180 standard CSV string.
 * @param {Array} leads
 * @returns {string}
 */
function exportCsv(leads) {
  return store.exportToCsv(leads);
}

/**
 * Get crawler statistics and database metrics.
 */
function getStats() {
  return store.getStats();
}

module.exports = {
  store,
  validator,
  EmailCrawlerPool,
  niches,
  spatial,
  verifyEmail,
  checkDomainMx,
  cleanEmail,
  getLeads,
  updateLead,
  exportCsv,
  getStats
};
