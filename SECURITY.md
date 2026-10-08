# Security Policy

## Supported Versions

| Version | Supported          |
| :---    | :---               |
| 1.0.x   | Yes                |

---

## Reporting a Vulnerability

We take the security of ScrapScrap seriously. If you discover a vulnerability or security flaw, please report it responsibly rather than opening a public GitHub issue.

Please email vulnerability details to:
**[ridho@codaxiom.com](mailto:ridho@codaxiom.com)**

Include:
- A description of the vulnerability.
- Steps to reproduce or a proof of concept.
- Potential impact and affected components.

We will acknowledge receipt within 48 hours and work on a fix promptly.

---

## Security Architecture & Defenses

ScrapScrap implements multiple defense-in-depth measures:

### 1. Server-Side Request Forgery (SSRF) Defense
The HTTP crawler pool (`src/core/crawler-pool.js`) strictly validates all target domains before issuing GET requests and during HTTP 3xx redirects. The following destinations are blocked:
- Loopback addresses (`127.0.0.0/8`, `localhost`, `[::1]`)
- Private RFC1918 blocks (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`)
- Cloud instance metadata services (`169.254.169.254`, `metadata.google.internal`, `instance-data`)
- Internal DNS domains (`*.local`, `*.internal`, `*.lan`, `*.arpa`)
- Non-HTTP protocols (`file:`, `ftp:`, `gopher:`, `dict:`)

### 2. Spreadsheet Formula Injection (DDE Defense)
Scraped business titles, contact names, and notes are untrusted text. In `src/data/store.js`, any cell string starting with formula operators (`=`, `+`, `-`, `@`, `\t`, `\r`) is automatically prepended with a single quote (`'`), neutralizing automatic formula execution when exported CSV files are opened in Microsoft Excel, Google Sheets, or LibreOffice Calc.

### 3. Local Data Isolation
ScrapScrap does not transmit telemetry, analytics, or scraped records to external servers. All data remains exclusively on your local disk in `data/leads.json`.

### 4. Process Isolation
Chromium process termination uses tracked process IDs (`src/core/process-reaper.js`) to ensure that host user browser sessions are never impacted.
