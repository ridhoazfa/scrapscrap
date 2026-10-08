# ScrapScrap

> **Local-first Google Maps lead scraper & website email harvester with native DNS MX deliverability verification and Lead Studio GUI.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/Node.js-%3E%3D18.0.0-brightgreen.svg)](https://nodejs.org/)
[![Playwright](https://img.shields.io/badge/Playwright-Chromium-orange.svg)](https://playwright.dev/)

---

## Why ScrapScrap?

Most commercial lead scrapers (Apify, Outscraper, Bright Data) charge \$99 to \$250 per month, cap your results, or hand you raw unverified emails that bounce and damage your outbound domain reputation.

**ScrapScrap runs 100% locally on your machine.** It crawls Google Maps listings via Playwright, extracts public business websites, sweeps their pages with a 20-thread asynchronous HTTP crawler, decrypts Cloudflare-obfuscated emails, and validates DNS MX exchange records before saving the lead to your local database.

### Key Capabilities

- **Zero Subscription Fees**: Runs on your local hardware. No API tokens or monthly limits.
- **5-Layer Deliverability Verification**: Automatically checks syntax, strips asset false positives (`.png`, `.jpg`), filters template test emails (`user@domain.com`), drops major ESP system desks (`support@yahoo.com`), and queries Cloudflare (`1.1.1.1`) and Google (`8.8.8.8`) DNS servers for valid MX records.
- **Cloudflare XOR De-Obfuscation**: Decodes `/cdn-cgi/l/email-protection` hex strings automatically.
- **Lead Studio Web UI**: A local dashboard (`http://localhost:3800`) inspired by Apple design principles. Search, filter, inspect, edit primary outreach emails, add contact persons, and export clean CSVs.
- **1-Click Windows Launchers**: Double-click batch runners in `launchers/` to spawn up to 10 parallel worker windows across target cities without touching the command line.
- **AI-Agent Ready**: Includes `AGENTS.md` and `.cursorrules` with programmatic APIs for autonomous subagent workflows in Cursor, Claude Code, and Antigravity.

---

## 60-Second Quickstart

### Prerequisites
- Node.js >= 18.0.0
- Playwright Chromium (`npx playwright install chromium`)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/ridhoazfa/scrapscrap.git
cd scrapscrap

# 2. Install dependencies
npm install

# 3. Install Playwright browser binary
npm run install-browser
```

### Running the Web Studio

```bash
# Launch the local dashboard at http://localhost:3800
npm run ui

# Or on Windows, double-click:
quickstart.bat
```

Open [http://localhost:3800](http://localhost:3800) in your browser. Configure your target cities, select a niche, and monitor real-time worker logs.

---

## Command Line Interface (CLI)

ScrapScrap can be run completely headless from your terminal:

```bash
# Verify a single email deliverability directly via DNS MX lookup
node src/cli.js --verify "info@summitfitness.com"

# Scrape a specific city and niche with custom review filters
node src/cli.js --cities "Austin,Dallas" --niche "Gym" --min-rating 4.0 --min-reviews 100

# Export all banked leads to a clean CSV
node src/cli.js --export "leads.csv"

# Display database metrics in terminal
node src/cli.js --stats
```

### Machine-Readable Mode for AI Coding Agents

Add the `--json` flag to receive structured JSON outputs in stdout:

```bash
node src/cli.js --verify "contact@studio.com" --json
node src/cli.js --stats --json
```

---

## Programmatic Node.js API

Import ScrapScrap into your own scripts or automation pipelines:

```javascript
const { getLeads, verifyEmail, updateLead, exportCsv } = require('scrapscrap');

// Verify email deliverability
const deliverable = await verifyEmail('owner@agency.com');
if (deliverable) {
  console.log('Valid email ready for outreach:', deliverable);
}

// Query stored leads
const result = getLeads({
  search: 'Dental',
  emailStatus: 'has_email',
  minRating: 4.5
});
console.log(`Found ${result.total} dentists.`);

// Export to CSV
const csv = exportCsv(result.leads);
```

---

## Windows 1-Click Launchers (`launchers/`)

For Windows users who prefer zero command-line overhead:
1. Open the `launchers/` folder.
2. Double-click any pre-generated batch file (e.g. `run-united-states-pt1.bat`, `run-indonesia-pt1.bat`, `run-united-kingdom-pt1.bat`).
3. Up to 10 isolated worker consoles will spawn in parallel, each scraping a dedicated city with automatic CAPTCHA backoff and process isolation.
4. To terminate all workers at any time, double-click `stop-all.bat`.

To regenerate or customize launchers from `countries.json`:
```bash
npm run generate-launchers
```

---

## Responsible Usage & Rate Limits

- **Respect Public Targets**: ScrapScrap is built for B2B contact discovery from public Google Maps listings and business websites.
- **Anti-Spam Compliance**: Always verify that your outreach complies with local laws (CAN-SPAM, GDPR, CASL, PECR).
- **Rate-Limiting**: Playwright Google Maps crawling includes built-in exponential backoff if temporary CAPTCHA challenges are encountered. Run within reasonable worker concurrency for your internet connection.

---

## License

MIT License &copy; 2026 [Ridho Azfa](https://github.com/ridhoazfa). See [LICENSE](LICENSE) for details.
