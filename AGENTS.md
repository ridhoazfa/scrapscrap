# AGENTS.md: AI Platform & Agent Operating Manual for ScrapScrap

> **Who reads this**: AI coding assistants (Cursor, Claude Code, Antigravity, Windsurf, GitHub Copilot, Codex, Aider) operating inside this repository.  
> **What this is**: The programmatic blueprint for controlling ScrapScrap, inspecting lead outputs, running background crawls, and executing email deliverability validation autonomously.

---

## 1. Architecture & Component Map

| Path | Purpose | Programmatic Usage |
| :--- | :--- | :--- |
| `src/index.js` | Main Node.js API exports | `const { getLeads, verifyEmail, store } = require('scrapscrap');` |
| `src/cli.js` | Unified cross-platform CLI | Supports `--json` flag for machine-readable stdout output |
| `src/core/scraper.js` | Google Maps Playwright crawler | Headless Chromium round-robin worker |
| `src/core/crawler-pool.js` | Website email extractor | Multi-threaded HTTP crawler with Cloudflare XOR decoder |
| `src/core/validator.js` | Deliverability verification | 5-layer check with DNS MX queries (`1.1.1.1` & `8.8.8.8`) |
| `src/data/store.js` | Zero-compilation lead repository | In-memory query engine + atomic JSON/CSV persistence |
| `src/ui/server.js` | Lead Studio Web server | Serves REST API and Apple-grade dashboard on `http://localhost:3800` |
| `data/leads.json` | Local leads database | Array of qualified business lead records (gitignored) |

---

## 2. Programmatic Node.js API

AI agents writing automation scripts or test pipelines should import `src/index.js` directly:

```javascript
const {
  verifyEmail,
  checkDomainMx,
  getLeads,
  updateLead,
  exportCsv,
  store
} = require('./src/index');

// 1. Verify an email address with full DNS MX check
const deliverable = await verifyEmail('contact@business.com');
console.log('Is deliverable:', !!deliverable);

// 2. Query stored leads
const result = getLeads({
  search: 'Fitness',
  emailStatus: 'has_email',
  minRating: 4.0,
  minReviews: 100,
  page: 1,
  limit: 20
});
console.log(`Found ${result.total} matching leads.`);

// 3. Update or adjust a lead's primary email
updateLead('lead_id_here', {
  primaryEmail: 'owner@business.com',
  contactPerson: 'Sarah Connor',
  status: 'verified'
});

// 4. Export leads to CSV string
const csvString = exportCsv(result.leads);
```

---

## 3. Headless CLI for Subagent Execution

AI subagents should execute `src/cli.js` with the `--json` flag to avoid interactive terminal prompts:

```bash
# Verify email address (returns JSON payload)
node src/cli.js --verify "info@company.com" --json

# Get database metrics (returns JSON payload)
node src/cli.js --stats --json

# Export database to CSV
node src/cli.js --export "exports/leads.csv" --json

# Run a targeted headless sweep
node src/cli.js --country "united-states" --cities "Austin,Dallas" --niche "Gym" --min-rating 4.0 --min-reviews 100 --headless true
```

---

## 4. Lead Record JSON Schema

All leads persisted in `data/leads.json` strictly conform to the following schema:

```json
{
  "id": "a1b2c3d4e5f67890",
  "businessName": "Summit Fitness Club",
  "city": "Austin",
  "niche": "Gym",
  "matchedSlug": "gym",
  "phone": "+1 512-555-0199",
  "rating": 4.8,
  "reviewCount": 342,
  "mapsUrl": "https://www.google.com/maps/place/...",
  "websiteUrl": "https://summitfitnessclub.com",
  "emails": [
    "info@summitfitnessclub.com",
    "membership@summitfitnessclub.com"
  ],
  "primaryEmail": "info@summitfitnessclub.com",
  "contactPerson": "Alex Rivera",
  "notes": "Premium boutique gym with personal training focus",
  "socialLinks": {
    "instagram": "https://instagram.com/summitfitness",
    "facebook": "https://facebook.com/summitfitness",
    "linkedin": null,
    "tiktok": null
  },
  "status": "verified",
  "locale": "en",
  "createdAt": "2026-10-08T16:30:00.000Z",
  "updatedAt": "2026-10-08T16:35:00.000Z"
}
```

---

## 5. Security & Hygiene Rules for Agents

1. **Zero Secret Leaks**: Never hardcode production API tokens or private URLs in commits. All configuration must flow through `.env` or CLI arguments.
2. **Local Storage First**: Leads must remain stored on local disk (`data/leads.json`). Never transmit scraped PII to unverified third-party endpoints.
3. **Zero Emojis in Web UI**: Any modifications to `src/ui/` must use vector SVG iconography (Lucide / standard SVG). Unicode emojis in frontend UI code are strictly prohibited.
