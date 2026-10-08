# Contributing to ScrapScrap

Thank you for your interest in contributing to ScrapScrap. This project is built on simplicity, local-first performance, and strict design discipline.

---

## 1. Development Setup

### Prerequisites
- Node.js >= 18.0.0
- Git

```bash
# Clone the repository
git clone https://github.com/ridhoazfa/scrapscrap.git
cd scrapscrap

# Install dependencies
npm install

# Install Playwright browser binaries
npm run install-browser
```

---

## 2. Coding Guidelines

### 2.1 Zero Emojis in Web & App UI Design (Absolute Law)
- Never introduce unicode emojis (such as rockets, checkmarks, fire, pins) into UI templates, JavaScript, terminal logs, or Markdown documentation.
- For user interfaces, use clean SVG vector icons with consistent optical weight and stroke width.
- For console outputs, use bracketed text tags: `[OK]`, `[ERR]`, `[VERIFY]`, `[CRAWLER]`.

### 2.2 Dependency Discipline
- Keep the dependency footprint minimal. We avoid heavy UI frameworks, bundlers, and compilation toolchains.
- Favor Node.js standard libraries (`http`, `fs`, `dns`, `path`, `crypto`, `child_process`) over adding external npm packages.

### 2.3 Security Standards
- **SSRF Defense**: Ensure all external HTTP requests made by crawlers validate hostnames against `isPrivateIpLiteral()`. Private ranges, cloud metadata endpoints, and non-HTTP protocols must remain blocked.
- **CSV Formula Neutralization**: When modifying CSV exports in `store.js`, preserve DDE formula escaping (`/^[=+\-@\t\r]/` prefixed with `'`).
- **Process Safety**: Never introduce broad `taskkill /IM chrome.exe` commands. Process management must route through `src/core/process-reaper.js`.

---

## 3. Pull Request Checklist

Before submitting a pull request, ensure:
- [ ] Code runs on Node.js 18+ without warnings.
- [ ] No temporary files, test dumps, or scraped emails are committed (verify `git status`).
- [ ] Zero unicode emojis are present in code, logs, or documentation.
- [ ] Any new CLI flags or API methods are documented in `README.md` and `AGENTS.md`.

---

## 4. Submitting Changes

1. Fork the repository and create your branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Commit your changes using conventional commit messages:
   ```bash
   git commit -m "feat: add support for custom user-agent rotation"
   ```
3. Push to your fork and submit a Pull Request against the `main` branch.
