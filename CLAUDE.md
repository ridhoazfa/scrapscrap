# CLAUDE.md: Claude Code Operating Guide for ScrapScrap

This file guides Claude Code (`claude` CLI) sessions when working in the `scrapscrap` codebase.

---

## 1. Project Overview

ScrapScrap is a local-first Google Maps and website email harvester with native DNS MX deliverability verification and a local web dashboard (Lead Studio). It operates completely on the local host without external API credits or cloud database dependencies.

- **Runtime**: Node.js >= 18.0.0 (CommonJS)
- **Primary Dependencies**: `playwright`, `cheerio`, `axios`, `dotenv`
- **Data Storage**: Local flat JSON files under `data/` with atomic in-memory buffering and disk-merging. Zero native C++ compilation.
- **Port**: 3800 (Lead Studio web interface)

---

## 2. Common Commands

```bash
# Install dependencies
npm install

# Install Playwright browser binary
npm run install-browser

# Launch Lead Studio Web UI (http://localhost:3800)
npm run ui
# or
node src/ui/server.js

# Run CLI verification
node src/cli.js --verify "info@example.com"
node src/cli.js --verify "info@example.com" --json

# Run CLI scraper
node src/cli.js --cities "Austin" --niche "Gym" --min-rating 4.0 --min-reviews 50

# Export leads to CSV
node src/cli.js --export "leads.csv"

# Show database stats
node src/cli.js --stats --json

# Regenerate launcher batch files from countries.json
npm run generate-launchers
```

---

## 3. Architecture & File Structure

```text
scrapscrap/
├── src/
│   ├── index.js             # Public programmatic Node.js API exports
│   ├── cli.js               # CLI argument parser with --json support
│   ├── core/
│   │   ├── scraper.js       # Playwright Google Maps crawler & session lifecycle
│   │   ├── crawler-pool.js  # 20-worker HTTP website scraper & Cloudflare XOR decoder
│   │   ├── validator.js     # 5-layer deliverability check & DNS MX resolver
│   │   ├── spatial.js       # Country/city lookup & Google Maps coordinate bounds
│   │   ├── niches.js        # 24 business niche definitions and keyword mapping
│   │   └── process-reaper.js# Process manager targeting ScrapScrap Chromium instances
│   ├── data/
│   │   └── store.js         # Atomic in-memory & disk-merging lead repository
│   └── ui/
│       ├── server.js        # Native HTTP server & REST API (port 3800)
│       └── public/
│           └── index.html   # Apple-grade single-file Lead Studio interface
├── launchers/               # Pre-generated Windows batch files for 48+ countries
├── countries.json           # Country, city, and subdistrict coordinates
├── data/                    # Runtime storage (gitignored: leads.json, state/)
├── AGENTS.md                # Multi-agent operating manual and JSON schema
├── ARCHITECTURE.md          # Detailed engineering documentation
├── CONTRIBUTING.md          # Contributor rules and guidelines
├── SECURITY.md              # Security policies and SSRF defenses
└── package.json
```

---

## 4. Coding & Design Standards

### 4.1 Zero Emojis in Web & App UI Design (Absolute Law)
- Never use unicode emojis (such as rockets, checkmarks, fire, pins) in web interfaces, console logs, or documentation.
- Use clean vector SVG iconography with uniform stroke weight in UI HTML.
- In terminal outputs, use text prefixes: `[OK]`, `[ERR]`, `[VERIFY]`, `[STUDIO]`, `->`.

### 4.2 Security Boundaries
- **SSRF Defense**: Any URL passed to `crawler-pool.js` must pass `isPrivateIpLiteral()`. Strictly block private IPv4/IPv6, bracketed `[::1]`, loopbacks, cloud metadata endpoints (`169.254.169.254`, `metadata.google.internal`), and non-HTTP protocols (`file:`, `ftp:`).
- **CSV Injection (DDE Defense)**: When formatting CSV records in `store.js`, any string starting with `=, +, -, @, \t, \r` must be prepended with a single quote (`'`) to neutralize formula execution in spreadsheet applications.
- **Process Isolation**: Never use broad `taskkill /IM chrome.exe` commands. Always use `src/core/process-reaper.js` to target only ScrapScrap PID records, protecting the user's personal browser tabs.

### 4.3 Data Isolation & Concurrency
- `data/leads.json` must be written atomically using temp files and disk merging to prevent multi-window worker collisions.
- The `data/` directory is gitignored and must never be committed.
