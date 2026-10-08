# ScrapScrap Architecture Specification

This document provides a technical overview of ScrapScrap's four core subsystems, concurrency models, data flows, and security boundaries.

---

## 1. System Architecture Overview

ScrapScrap is structured as an offline-first, pipeline-driven engine:

```text
[ Google Maps Search ] ---> [ Spatial Grid Bounds ]
                                    |
                                    v
                            [ Playwright Chromium ]
                                    |
                  +-----------------+-----------------+
                  |                                   |
                  v                                   v
          [ Direct Contact ]                  [ Business Website ]
          (Phone, Maps URL)                           |
                                                      v
                                            [ 20-Worker HTTP Pool ]
                                            (Subpage Links: /about, /contact)
                                                      |
                                                      v
                                            [ Cloudflare XOR Decoder ]
                                            (/cdn-cgi/l/email-protection)
                                                      |
                                                      v
                                            [ 5-Layer Deliverability ]
                                            (Syntax, Blacklist, DNS MX)
                                                      |
                                                      v
                                            [ Lead Store (leads.json) ]
                                            (Atomic Disk Merge & In-Memory Map)
                                                      |
                                                      v
                                            [ Lead Studio GUI & CSV ]
```

---

## 2. Core Subsystems

### 2.1 Subsystem 1: Spatial Google Maps Crawler (`src/core/scraper.js`, `spatial.js`, `niches.js`)
- **Technology**: Playwright Chromium (headless or headed).
- **Spatial Navigation**: Converts country and city combinations into bounded geographic coordinate search queries on Google Maps.
- **Scroll & Extraction Loop**:
  - Dynamically scrolls the left sidebar feed (`div[role="feed"]`).
  - Extracts business title, star rating, total review count, telephone, website URL, and Google Place Key.
  - Implements an adaptive delay algorithm (`SKIP_PAUSE_MS` vs `FIND_PAUSE_MS`) to mimic human browsing behavior.
- **Session Resilience**:
  - Tracks state in `data/state/progress.json` and records session checkpoints per run ID.
  - Handles rate-limit triggers and CAPTCHAs with exponential backoff (10s to 120s).

### 2.2 Subsystem 2: Multi-Threaded Website Crawler (`src/core/crawler-pool.js`)
- **Technology**: Axios HTTP client + Cheerio HTML parser + Node EventEmitter.
- **Concurrency**: Manages an internal work queue with up to 20 parallel worker threads (`EMAIL_CRAWLER_CONCURRENCY`).
- **Subpage Traversal**:
  - Fetches the homepage first. If zero candidate emails are discovered, parses internal links for high-probability contact pages (`/contact`, `/about`, `/team`, `/reach-us`, `/support`, `/impressum`).
  - Fetches up to 4 subpages concurrently per business domain.
- **Cloudflare XOR De-Obfuscation**:
  - Scans for elements with `data-cfemail` attributes.
  - Extracts the initial 2-byte hexadecimal XOR key and decodes the byte array back to plaintext ASCII email addresses without running a headless browser.

### 2.3 Subsystem 3: 5-Layer Deliverability Verification (`src/core/validator.js`)
- **Technology**: Node.js `dns` standard library with fallback resolvers (`1.1.1.1` and `8.8.8.8`).
- **Pipeline Stages**:
  1. *Syntax & Encoding*: Decodes percent-encoded entities (`%20`), strips `mailto:`, removes trailing punctuation, and strips prefixed phone numbers.
  2. *Username Filter*: Drops test usernames (`user`, `test`, `testing`, `placeholder`, `dummy`, `quiz-counter`).
  3. *Domain Filter*: Drops static builder and asset hosting domains (`sentry.io`, `wix.com`, `squarespace.com`, `shopify.com`, `example.com`).
  4. *ESP System Desk Trap*: Drops support/admin/billing desks on shared consumer webmail domains (`support@yahoo.com`, `admin@gmail.com`).
  5. *DNS MX Verification*: Resolves MX records asynchronously with domain-level caching and persistent suppression of dead domains.

### 2.4 Subsystem 4: Local Lead Repository (`src/data/store.js`)
- **Architecture**: In-memory `Map<string, Lead>` backed by debounced atomic file persistence.
- **Concurrency & Disk Merging**:
  - Multi-window batch runners run independently.
  - On write, `flushSync()` reads existing entries from `data/leads.json` on disk, merges any leads discovered by parallel peers, and writes to a process-unique temporary file (`leads.json.tmp.<timestamp>.<pid>`).
  - Uses atomic file renaming with backoff retries on Windows to prevent file-lock collisions.
- **CSV Export & DDE Protection**:
  - Generates RFC4180-compliant CSV files.
  - Neutralizes spreadsheet formula injection: if any value begins with `=, +, -, @, \t, \r`, it is prepended with a single quote (`'`).

---

## 3. Process Management & Safe Reaping (`src/core/process-reaper.js`)

To prevent orphaned Chromium instances without harming the operator's regular browsing sessions:
- Every scraper run records its child Chromium process ID in `data/state/pid-<runId>.json`.
- When stopping workers or cleaning up after a crash, `src/core/process-reaper.js` reads these files and terminates only the recorded ScrapScrap PIDs.
- Blind `taskkill /IM chrome.exe` commands are strictly avoided.

---

## 4. Security Boundaries

1. **SSRF Boundary**: `crawler-pool.js` strictly validates target URLs. Requests to private IPv4 blocks (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`), link-local metadata addresses (`169.254.169.254`), bracketed IPv6 loopbacks (`[::1]`), and non-HTTP schemes are rejected both before request initiation and during HTTP 3xx redirects.
2. **Local Isolation**: Zero telemetry or remote API calls. All scraped records remain on the local disk.
