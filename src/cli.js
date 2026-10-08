#!/usr/bin/env node
// ============================================================
// cli.js — Universal Cross-Platform Command Line Interface
// ScrapScrap Open Source Suite
// ============================================================

const path = require('path');
const fs = require('fs');
require('dotenv').config({ path: path.join(__dirname, '../.env') });
const scrapscrap = require('./index');

function printHelp() {
  console.log(`
ScrapScrap — Local Google Maps & Website Email Harvester (v1.0.0)

USAGE:
  scrapscrap [command / options]

OPTIONS:
  --ui                      Launch the Apple-grade Lead Studio Web UI (default: port 3800)
  --port <number>           Specify Web Studio port (default: 3800)
  --cities <list>           Comma-separated city targets (e.g. "Jakarta,Bandung" or "Austin,Dallas")
  --country <name>          Country name or slug (e.g. "indonesia", "united-states")
  --niche <name>            Target business niche (e.g. "Gym", "Dental Clinic", "Lawyer")
  --min-rating <number>     Minimum Google Maps star rating (default: 4.0)
  --min-reviews <number>    Minimum review count floor (default: 100)
  --headless <true|false>   Run Chromium in headless mode (default: true)
  --export <file.csv>       Export all stored leads to CSV
  --verify <email>          Run 5-layer deliverability and DNS MX check on an email
  --stats                   Display database lead counts and email coverage stats
  --json                    Format output as machine-readable JSON (for AI agents & scripts)
  --help, -h                Show this help screen

EXAMPLES:
  # Launch the Web Studio
  scrapscrap --ui

  # Verify an email address directly
  scrapscrap --verify contact@gymstudio.com

  # Export all stored leads to CSV
  scrapscrap --export leads-export.csv

  # Run headless scraper for Austin Gyms
  scrapscrap --cities "Austin" --niche "Gym" --min-rating 4.0 --min-reviews 50
`);
}

async function runCli() {
  const args = process.argv.slice(2);

  if (args.length === 0 || args.includes('--ui')) {
    // Launch Web Studio
    require('./ui/server');
    return;
  }

  if (args.includes('--help') || args.includes('-h')) {
    printHelp();
    return;
  }

  const isJson = args.includes('--json');

  // Verify email flag
  const verifyIdx = args.indexOf('--verify');
  if (verifyIdx !== -1 && args[verifyIdx + 1]) {
    const targetEmail = args[verifyIdx + 1];
    const isClean = scrapscrap.cleanEmail(targetEmail);
    if (!isClean) {
      if (isJson) {
        console.log(JSON.stringify({ email: targetEmail, deliverable: false, reason: 'SYNTAX_OR_BLACKLIST' }));
      } else {
        console.log(`[VERIFY] "${targetEmail}" -> FAILED (Invalid syntax, disposable, or blacklisted role)`);
      }
      process.exit(1);
    }

    const domain = isClean.split('@')[1];
    const hasMx = await scrapscrap.checkDomainMx(domain);
    if (isJson) {
      console.log(JSON.stringify({ email: isClean, deliverable: hasMx, mxRecords: hasMx }));
    } else {
      if (hasMx) {
        console.log(`[VERIFY] "${isClean}" -> DELIVERABLE (Valid MX records verified)`);
      } else {
        console.log(`[VERIFY] "${isClean}" -> UNDELIVERABLE (No active MX exchange records found for @${domain})`);
      }
    }
    return;
  }

  // Database stats flag
  if (args.includes('--stats')) {
    const stats = scrapscrap.getStats();
    if (isJson) {
      console.log(JSON.stringify(stats, null, 2));
    } else {
      console.log('\n--- ScrapScrap Database Stats ---');
      console.log(`Total Leads Stored    : ${stats.totalLeads}`);
      console.log(`Leads with Emails     : ${stats.leadsWithEmail}`);
      console.log(`Without Emails        : ${stats.leadsWithoutEmail}`);
      console.log(`Multi-Email Leads     : ${stats.multiEmailLeads}`);
      console.log(`Average Rating        : ${stats.averageRating}`);
      console.log('---------------------------------\n');
    }
    return;
  }

  // Export CSV flag
  const exportIdx = args.indexOf('--export');
  if (exportIdx !== -1 && args[exportIdx + 1]) {
    const targetPath = path.resolve(process.cwd(), args[exportIdx + 1]);
    const csvData = scrapscrap.exportCsv();
    fs.writeFileSync(targetPath, csvData, 'utf8');
    if (isJson) {
      console.log(JSON.stringify({ success: true, exportedFile: targetPath, count: scrapscrap.store.leads.size }));
    } else {
      console.log(`[EXPORT] Successfully exported ${scrapscrap.store.leads.size} leads to: ${targetPath}`);
    }
    return;
  }

  // Scraper execution flags
  const citiesIdx = args.indexOf('--cities');
  const countryIdx = args.indexOf('--country');
  const nicheIdx = args.indexOf('--niche');
  const ratingIdx = args.indexOf('--min-rating');
  const reviewsIdx = args.indexOf('--min-reviews');
  const headlessIdx = args.indexOf('--headless');

  if (citiesIdx !== -1 && args[citiesIdx + 1]) {
    process.env.SCRAPER_CITIES = args[citiesIdx + 1];
  }
  if (countryIdx !== -1 && args[countryIdx + 1]) {
    process.env.SCRAPER_COUNTRY = args[countryIdx + 1];
  }
  if (nicheIdx !== -1 && args[nicheIdx + 1]) {
    process.env.SCRAPER_NICHES = args[nicheIdx + 1];
  }
  if (ratingIdx !== -1 && args[ratingIdx + 1]) {
    process.env.SCRAPER_MIN_RATING = args[ratingIdx + 1];
  }
  if (reviewsIdx !== -1 && args[reviewsIdx + 1]) {
    process.env.SCRAPER_MIN_REVIEWS = args[reviewsIdx + 1];
  }
  if (headlessIdx !== -1 && args[headlessIdx + 1]) {
    process.env.SCRAPER_HEADLESS = args[headlessIdx + 1];
  }

  // Run scraper engine
  require('./core/scraper');
}

runCli().catch(err => {
  console.error('[CLI ERROR]', err.message);
  process.exit(1);
});
