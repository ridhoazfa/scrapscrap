# ScrapScrap

> Local-first Google Maps lead scraper and website email harvester with native DNS MX deliverability verification and local Lead Studio interface.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![CI](https://github.com/ridhoazfa/scrapscrap/actions/workflows/ci.yml/badge.svg)](https://github.com/ridhoazfa/scrapscrap/actions/workflows/ci.yml)
[![Node.js](https://img.shields.io/badge/Node.js-%3E%3D18.0.0-brightgreen.svg)](https://nodejs.org/)
[![Playwright](https://img.shields.io/badge/Playwright-Chromium-orange.svg)](https://playwright.dev/)
[![Zero Cloud Dependency](https://img.shields.io/badge/Cloud%20APIs-Zero%20(100%25%20Local)-success.svg)](#architecture)

---

## Overview

Most lead scrapers charge monthly subscriptions (\$99 to \$250/mo) for cloud credits, cap search volume, and export unverified email addresses that bounce when loaded into cold outreach software.

ScrapScrap runs entirely on your local machine. It automates Google Maps searches via Playwright Chromium, extracts business websites, crawls subpages using a 20-worker asynchronous HTTP pool, decodes Cloudflare email obfuscation, and verifies domain mail exchange (MX) records directly against public DNS resolvers before saving records to your local database.

```text
+-------------------+      +-----------------------+      +--------------------------+
|  Google Maps      | ---> |  20-Thread HTTP Pool  | ---> |  Cloudflare XOR Decoder  |
|  (Playwright)     |      |  (Subpage Discovery)  |      |  (/cdn-cgi/l/email-prot) |
+-------------------+      +-----------------------+      +--------------------------+
                                                                       |
+-------------------+      +-----------------------+                   v
|  Export: CSV / UI | <--- |  Local Store (JSON)   | <--- +--------------------------+
|  (Apple-grade UI) |      |  (Atomic disk merge)  |      |  5-Layer Deliverability  |
+-------------------+      +-----------------------+      |  (DNS MX @ 1.1.1.1/8.8)  |
                                                          +--------------------------+
```

---

## Comparison Matrix

| Feature | ScrapScrap (OSS) | Apify / Outscraper | Bright Data |
| :--- | :--- | :--- | :--- |
| **Cost** | **\$0 (Free & Open Source)** | \$49 to \$249 / month | \$500+ / month |
| **Usage Limits** | **Unlimited (Local CPU & Bandwidth)** | Capped by monthly credits | Pay-per-gigabyte |
| **Email Deliverability** | **Built-in 5-layer check + DNS MX** | Raw text only (Unverified) | Raw text only |
| **Cloudflare Decryption** | **Automatic XOR de-obfuscation** | Third-party actor add-ons | Proxy-dependent |
| **Data Privacy** | **100% Local (data stays on your disk)** | Uploaded to vendor cloud | Uploaded to vendor cloud |
| **Web Interface** | **Local Lead Studio (port 3800)** | Web dashboard | API / Complex dashboard |
| **CLI & AI Agent APIs** | **Native `--json` flag & Node module** | Custom API wrappers | REST API only |

*Note: Third-party service names (Apify, Outscraper, Bright Data) are referenced strictly for comparative purposes under nominative fair use. ScrapScrap is an independent project and has no affiliation with or endorsement from these providers.

---

## 60-Second Quickstart

### Prerequisites

- [Node.js](https://nodejs.org/) v18.0.0 or higher
- Windows, macOS, or Linux

### Installation

```bash
# 1. Clone repository
git clone https://github.com/ridhoazfa/scrapscrap.git
cd scrapscrap

# 2. Install dependencies
npm install

# 3. Install Playwright browser binary
npm run install-browser
```

### Starting Lead Studio (Web Interface)

```bash
npm run ui
```

Open [http://localhost:3800](http://localhost:3800) in your browser.

On Windows, you can also launch the interactive control center by double-clicking:
```bat
quickstart.bat
```

---

## Command Line Interface (CLI)

ScrapScrap includes a command-line interface for terminal usage and automation scripts:

```bash
# 1. Verify a single email address via DNS MX query
node src/cli.js --verify "info@summitfitness.com"

# 2. Scrape specific cities and niches with review rating filters
node src/cli.js --cities "Austin,Dallas" --niche "Gym" --min-rating 4.0 --min-reviews 100

# 3. Export all stored leads to a clean CSV
node src/cli.js --export "leads.csv"

# 4. Display database metrics in terminal
node src/cli.js --stats
```

### JSON Mode for AI Agents & CI/CD

Add `--json` to any command to receive machine-readable output in stdout:

```bash
node src/cli.js --verify "contact@studio.com" --json
node src/cli.js --stats --json
```

---

## Programmatic Node.js API

Import ScrapScrap into your own automation pipelines:

```javascript
const { getLeads, verifyEmail, updateLead, exportCsv } = require('scrapscrap');

async function main() {
  // 1. Verify email deliverability
  const deliverable = await verifyEmail('owner@example.com');
  console.log('Deliverable via MX:', deliverable);

  // 2. Query stored leads
  const result = getLeads({
    search: 'Dental',
    emailStatus: 'has_email',
    minRating: 4.5,
    limit: 10
  });
  console.log(`Matched ${result.total} dentists.`);

  // 3. Export filtered records to RFC4180 CSV
  const csv = exportCsv(result.leads);
}

main().catch(console.error);
```

---

## 5-Layer Deliverability Verification

ScrapScrap does not save raw email strings directly from webpage HTML. Every candidate address passes through a 5-layer pipeline:

1. **Syntax and Character Sanitization**: Strips URL schemes (`mailto:`), decodes percent-encoded entities, strips unicode artifacts, and removes leading phone prefixes.
2. **Placeholder and Dummy Username Filtering**: Rejects generic usernames (`test`, `dummy`, `user`, `youremail`, `myname`, `quiz-counter`).
3. **Template and Demo Domain Blacklist**: Rejects static website template domains (`example.com`, `sentry.io`, `wix.com`, `squarespace.com`, `weebly.com`, `shopify.com`).
4. **ESP Reserved System Desks**: Rejects system desks on shared public email providers (`support@yahoo.com`, `admin@gmail.com`, `billing@outlook.com`).
5. **Persistent Dead Domain Suppression & Authoritative DNS MX**: Rechecks against local dead domain caches and queries Cloudflare (`1.1.1.1`) and Google (`8.8.8.8`) for active Mail Exchange records.

### Understanding Deliverability & Bounces

ScrapScrap validates candidate addresses at the authoritative DNS MX record level, verifying that the target domain has active mail servers configured to receive mail. This immediately prunes the vast majority of invalid leads, including parked landing pages, dead domains, expired registrations, and malformed syntax.

#### The Tradeoff: Silent DNS MX vs. Invasive SMTP Probes

A common question is why ScrapScrap does not run automated SMTP mailbox handshakes (`RCPT TO` commands) during discovery:

1. **IP Reputation Defense**: Probing thousands of mailboxes without delivering messages is the fastest way to get your residential or office IP address added to Spamhaus, Spamcop, and Barracuda blocklists.
2. **Greylisting & Honeypots**: Corporate mail servers treat burst probe connections from consumer IPs as bot traffic, triggering immediate ISP throttling and greylisting.
3. **The Catch-All Reality**: Many commercial mail servers (Google Workspace, Microsoft 365, custom postfix configurations) use "catch-all" settings that return positive responses to any test address anyway, making local SMTP pings unreliable.

#### Practitioner Recommendation

DNS MX verification ensures that every exported domain has legitimate, active mail infrastructure. However, individual mailboxes within a valid domain can still occasionally bounce if an employee leaves or a business closes a specific desk.

For reliable inbox placement (maintaining bounce rates below 2% to 3% across cold campaigns), we recommend importing ScrapScrap exports into your outreach sequencer (such as Instantly or Smartlead), where ramp-up schedules and domain rotation protect your primary sender reputation.

---

## Windows 1-Click Launchers (`launchers/`)

For multi-threaded crawling on Windows without command-line configuration:

1. Open the `launchers/` directory.
2. Double-click any pre-generated country runner (e.g., `run-united-states-pt1.bat`, `run-united-kingdom-pt1.bat`, `run-indonesia-pt1.bat`).
3. Up to 10 isolated worker consoles spawn concurrently, each scraping an assigned city with independent state tracking and automatic CAPTCHA backoff.
4. To stop all workers at any time, run `stop-all.bat`.

To regenerate custom launchers from `countries.json`:
```bash
npm run generate-launchers
```

---

## Exporting for Cold Outreach

CSVs exported via Lead Studio (`/api/export/csv`) or CLI (`--export`) follow the RFC4180 format and include spreadsheet formula injection defense (DDE prevention). The columns map directly into cold outreach platforms such as Instantly, Smartlead, Lemlist, and Apollo:

- `Business Name`
- `Contact Person`
- `Primary Email`
- `All Emails`
- `Phone`
- `City`
- `Niche`
- `Rating`
- `Review Count`
- `Website`
- `Google Maps URL`
- `Instagram`
- `Facebook`
- `LinkedIn`
- `TikTok`
- `Notes`
- `Status`

---

## Documentation

- [ARCHITECTURE.md](ARCHITECTURE.md) - Subsystem technical documentation and concurrency model.
- [AGENTS.md](AGENTS.md) - Operating manual and programmatic interfaces for AI coding agents.
- [CLAUDE.md](CLAUDE.md) - Instructions and workflow commands for Claude Code CLI sessions.
- [CONTRIBUTING.md](CONTRIBUTING.md) - Development setup, code style, and pull request guidelines.
- [SECURITY.md](SECURITY.md) - Vulnerability reporting and security boundaries.

---

## Legal Disclaimer & Responsible Use

- **Public Data & CFAA Compliance**: ScrapScrap automates extraction of publicly available business contact information published by businesses on public directories and websites. It does not bypass paywalls, circumvent login credentials, or access private systems. Operating scrapers against publicly available data is recognized under legal precedent (such as *hiQ Labs v. LinkedIn* and *Van Buren v. United States*), provided users respect applicable terms of service and robots policies.
- **Trademark Notice**: Google, Google Maps, Apify, Outscraper, Bright Data, and any other company or service marks cited in this repository are trademarks of their respective holders. They are referenced strictly for comparative identification under nominative fair use (*New Kids on the Block v. News America Publishing*). ScrapScrap is an independent open-source project with zero affiliation, sponsorship, or endorsement from any cited trademark holder.
- **Outreach & Privacy Regulations**: Users are solely responsible for ensuring that any communication or data handling complies with relevant local regulations, including the CAN-SPAM Act, GDPR, UK GDPR, PECR, and CASL. Always provide genuine opt-out mechanisms and respect business privacy notices.
- **MIT License Notice**: This software is provided "AS IS", without warranty of any kind, express or implied. The maintainers and contributors assume no liability for misuse, damages, or regulatory violations resulting from operator usage.

---

## License

MIT License &copy; 2026 [Ridho Azfa](https://github.com/ridhoazfa). See [LICENSE](LICENSE) for details.
