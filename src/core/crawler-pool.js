// ============================================================
// crawler-pool.js — Multi-Threaded HTTP Email & Social Crawler Pool
// ScrapScrap Open Source Suite
//
// Fast, non-blocking website email extraction via axios + cheerio.
// Concurrency: up to 20 parallel HTTP worker threads (EMAIL_CRAWLER_CONCURRENCY).
// ============================================================

const axios = require('axios');
const cheerio = require('cheerio');
const EventEmitter = require('events');
const https = require('https');
const fs = require('fs');
const path = require('path');

const {
  cleanEmailAddress,
  verifyDomainMx,
  decodeCloudflareEmail,
  stripPhonePrefix,
  fixConcatenatedTld,
  DEAD_DOMAINS_SET
} = require('./validator');

const httpsAgent = new https.Agent({ rejectUnauthorized: false });

function websiteDedupKey(websiteUrl) {
  if (!websiteUrl || typeof websiteUrl !== 'string') return null;
  try {
    const urlObj = new URL(websiteUrl);
    const domain = urlObj.hostname.replace(/^www\./, '').toLowerCase();
    if (DEAD_DOMAINS_SET.has(domain)) return null;
    const sharedPlatforms = ['linktr.ee', 'linktree.com', 'carrd.co', 'facebook.com', 'instagram.com', 'wa.me', 'whatsapp.com', 'youtube.com'];
    if (sharedPlatforms.includes(domain)) {
      return `${domain}${urlObj.pathname.toLowerCase().replace(/\/$/, '')}`;
    }
    return domain;
  } catch (_) {
    return null;
  }
}

function isPrivateIpLiteral(urlStr) {
  if (!urlStr || typeof urlStr !== 'string') return false;
  try {
    const hostname = new URL(urlStr).hostname.toLowerCase();
    if (hostname === 'localhost' || hostname === '::1' || hostname === '0.0.0.0') return true;
    if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(hostname)) {
      const parts = hostname.split('.').map(Number);
      if (parts[0] === 127) return true;
      if (parts[0] === 10) return true;
      if (parts[0] === 172 && parts[1] >= 16 && parts[1] <= 31) return true;
      if (parts[0] === 192 && parts[1] === 168) return true;
      if (parts[0] === 169 && parts[1] === 254) return true;
    }
  } catch (_) {}
  return false;
}

class EmailCrawlerPool extends EventEmitter {
  constructor(options = {}) {
    super();
    this.concurrency = options.concurrency || parseInt(process.env.EMAIL_CRAWLER_CONCURRENCY, 10) || 20;
    this.timeoutMs = options.timeoutMs || 5000;
    this.subPageTimeoutMs = options.subPageTimeoutMs || 4000;
    this.maxSubPages = options.maxSubPages || 4;
    this.maxRetries = options.maxRetries || 2;
    this.userAgent = options.userAgent || 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36';

    this.dlqPath = options.dlqPath || path.join(__dirname, '../../data/state/failed_websites.json');

    this.queue = [];
    this.activeWorkers = 0;
    this.seenWebsites = new Set();
    this.inFlightWebsites = new Set();
    this.cleanEmailAddress = options.cleanEmailAddress || cleanEmailAddress;
    this.shuttingDown = false;
    this.isShuttingDown = false;

    this.isWebsiteSeen = options.isWebsiteSeen || ((url) => {
      const key = websiteDedupKey(url);
      return key ? this.seenWebsites.has(key) : false;
    });

    this.markWebsiteSeen = options.markWebsiteSeen || ((url) => {
      const key = websiteDedupKey(url);
      if (key) this.seenWebsites.add(key);
    });
  }

  cancel() {
    this.shuttingDown = true;
    this.isShuttingDown = true;
    this.queue = [];
    this.removeAllListeners('error');
    this.removeAllListeners('crawlCompleted');
  }

  /**
   * Enqueue a business lead website for asynchronous HTTP crawling.
   */
  enqueueWebsiteCrawl(itemOrName, websiteUrl, placeKey, nicheSlug, metadata = {}) {
    if (this.shuttingDown || this.isShuttingDown) return false;

    let item;
    if (typeof itemOrName === 'object' && itemOrName !== null) {
      item = { ...itemOrName };
    } else {
      item = {
        businessName: itemOrName,
        websiteUrl: websiteUrl,
        placeKey: placeKey,
        nicheSlug: nicheSlug,
        ...metadata
      };
    }

    if (!item.websiteUrl || typeof item.websiteUrl !== 'string' || isPrivateIpLiteral(item.websiteUrl)) {
      return false;
    }

    if (this.isWebsiteSeen(item.websiteUrl)) {
      return false;
    }
    this.markWebsiteSeen(item.websiteUrl);

    this.queue.push(item);
    this.processQueue();
    return true;
  }

  processQueue() {
    if (this.shuttingDown || this.isShuttingDown) {
      this.queue = [];
      return;
    }
    while (this.activeWorkers < this.concurrency && this.queue.length > 0 && !this.shuttingDown && !this.isShuttingDown) {
      const item = this.queue.shift();
      this.activeWorkers++;
      this.crawlItem(item)
        .catch(err => {
          if (!this.shuttingDown && !this.isShuttingDown) {
            const msg = err?.message || String(err);
            const name = err?.name || '';
            const code = err?.code || '';
            if (name !== 'AbortError' && code !== 'ECONNRESET' && code !== 'ETIMEDOUT' && !msg.includes('aborted') && !msg.includes('socket hang up') && !msg.includes('FetchError')) {
              this.emit('error', { item, error: err });
            }
          }
        })
        .finally(() => {
          this.activeWorkers--;
          if (!this.shuttingDown && !this.isShuttingDown) {
            this.processQueue();
          }
        });
    }
  }

  recordDlq(item, errorReason) {
    if (!item || !item.websiteUrl) return;
    try {
      const dir = path.dirname(this.dlqPath);
      if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
      let records = [];
      if (fs.existsSync(this.dlqPath)) {
        try {
          const raw = fs.readFileSync(this.dlqPath, 'utf8');
          records = JSON.parse(raw);
          if (!Array.isArray(records)) records = [];
        } catch (_) {
          records = [];
        }
      }
      const existingIdx = records.findIndex(r => r.websiteUrl === item.websiteUrl);
      const dlqEntry = {
        websiteUrl: item.websiteUrl,
        businessName: item.businessName || null,
        city: item.city || null,
        niche: item.niche || item.nicheSlug || null,
        error: errorReason || 'Unknown crawl error',
        attempts: item.attempts || 1,
        failedAt: new Date().toISOString()
      };
      if (existingIdx >= 0) {
        records[existingIdx] = dlqEntry;
      } else {
        records.push(dlqEntry);
      }
      if (records.length > 10000) {
        records = records.slice(records.length - 10000);
      }
      fs.writeFileSync(this.dlqPath, JSON.stringify(records, null, 2), 'utf8');
    } catch (_) {}
  }

  async crawlItem(item) {
    if (this.shuttingDown || this.isShuttingDown) return;
    const { websiteUrl } = item;
    const emails = new Set();
    const socialLinks = { instagram: null, facebook: null, linkedin: null, tiktok: null };
    let crawlSucceeded = false;

    try {
      const homeHtml = await this.fetchHtml(websiteUrl, this.timeoutMs);
      if (this.shuttingDown || this.isShuttingDown) return;
      if (homeHtml) {
        crawlSucceeded = true;
        this.extractFromHtml(homeHtml, websiteUrl, emails, socialLinks);
      }

      if (emails.size === 0 && homeHtml && !this.shuttingDown && !this.isShuttingDown) {
        const subPageUrls = this.findSubPageLinks(homeHtml, websiteUrl);
        if (subPageUrls.length > 0) {
          await Promise.allSettled(
            subPageUrls.slice(0, this.maxSubPages).map(async (subUrl) => {
              if (this.shuttingDown || this.isShuttingDown) return;
              const subHtml = await this.fetchHtml(subUrl, this.subPageTimeoutMs);
              if (this.shuttingDown || this.isShuttingDown) return;
              if (subHtml) {
                this.extractFromHtml(subHtml, subUrl, emails, socialLinks);
              }
            })
          );
        }
      }
    } catch (err) {
      if (this.shuttingDown || this.isShuttingDown) return;
      const msg = err?.message || String(err);
      const name = err?.name || '';
      const code = err?.code || '';
      const isTransient = name === 'AbortError' || code === 'ECONNRESET' || code === 'ETIMEDOUT' || code === 'ENOTFOUND' || code === 'ECONNREFUSED' || msg.includes('aborted') || msg.includes('socket hang up') || msg.includes('timeout') || msg.includes('FetchError');

      const currentAttempt = item.attempts || 1;
      if (isTransient && currentAttempt <= this.maxRetries) {
        item.attempts = currentAttempt + 1;
        this.queue.push(item);
        return;
      }

      this.recordDlq(item, msg);
      this.emit('crawlFailed', { item, error: err, fatal: true });
      if (!isTransient) throw err;
      return;
    }

    if (this.shuttingDown || this.isShuttingDown) return;

    if (!crawlSucceeded) {
      const currentAttempt = item.attempts || 1;
      if (currentAttempt <= this.maxRetries) {
        item.attempts = currentAttempt + 1;
        this.queue.push(item);
        return;
      }
      this.recordDlq(item, 'HTTP non-200 / empty response');
      this.emit('crawlFailed', { item, error: new Error('HTTP non-200 / empty response'), fatal: true });
      return;
    }

    const cleanEmails = [...emails].map(e => this.cleanEmailAddress(e)).filter(Boolean);
    const deliverableEmails = [];
    for (const em of cleanEmails) {
      const atIdx = em.lastIndexOf('@');
      const domain = atIdx > 0 ? em.slice(atIdx + 1) : '';
      if (domain) {
        const hasMx = await verifyDomainMx(domain);
        if (hasMx) deliverableEmails.push(em);
      }
    }

    this.emit('crawlCompleted', {
      item,
      foundEmails: deliverableEmails,
      socialLinks,
      crawledAt: new Date().toISOString()
    });
  }

  async fetchHtml(url, timeout) {
    if (this.shuttingDown || this.isShuttingDown) return null;
    try {
      const response = await axios.get(url, {
        timeout: timeout || this.timeoutMs,
        maxRedirects: 3,
        maxContentLength: 5 * 1024 * 1024,
        httpsAgent: httpsAgent,
        beforeRedirect: (options) => {
          const redirectUrl = options.href || `${options.protocol}//${options.hostname}${options.path}`;
          if (isPrivateIpLiteral(redirectUrl)) {
            throw new Error(`SSRF blocked: Redirect to private IP literal prohibited`);
          }
        },
        headers: {
          'User-Agent': this.userAgent,
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9,id;q=0.8,de;q=0.7,fr;q=0.7,es;q=0.7,ja;q=0.6'
        },
        validateStatus: status => status >= 200 && status < 400
      });
      if (this.shuttingDown || this.isShuttingDown) return null;
      if (typeof response.data === 'string') {
        return response.data.length > 2 * 1024 * 1024 ? response.data.slice(0, 2 * 1024 * 1024) : response.data;
      }
      return '';
    } catch (_) {
      return null;
    }
  }

  extractFromHtml(html, pageUrl, emailsSet, socialLinks) {
    if (!emailsSet) emailsSet = new Set();
    if (!socialLinks) socialLinks = {};
    if (!html) return { emails: Array.from(emailsSet), socialLinks };

    const $ = cheerio.load(html);

    // 1. Cloudflare email protection XOR decoding
    $('[data-cfemail]').each((_, el) => {
      const cfHex = $(el).attr('data-cfemail');
      const decoded = decodeCloudflareEmail(cfHex);
      if (decoded) emailsSet.add(decoded);
    });

    $('a[href*="/cdn-cgi/l/email-protection#"]').each((_, el) => {
      const href = $(el).attr('href') || '';
      const decoded = decodeCloudflareEmail(href);
      if (decoded) emailsSet.add(decoded);
    });

    const cfRegexMatches = html.match(/(?:data-cfemail=["']([0-9a-fA-F]+)["']|\/cdn-cgi\/l\/email-protection#([0-9a-fA-F]+))/gi) || [];
    for (const cfm of cfRegexMatches) {
      const hex = cfm.replace(/^.*?(?:data-cfemail=["']|#)/i, '').replace(/["'].*$/, '');
      const decoded = decodeCloudflareEmail(hex);
      if (decoded) emailsSet.add(decoded);
    }

    // 2. HTML entity normalization & de-obfuscation
    const htmlEntityDecoded = html
      .replace(/&#64;|&#x40;|&commat;/gi, '@')
      .replace(/&#46;|&#x2e;/gi, '.')
      .replace(/&#47;|&#x2f;/gi, '/')
      .replace(/&#160;|&nbsp;/gi, ' ')
      .replace(/&amp;/gi, '&');

    // 3. Text pattern de-obfuscation
    const deobfuscated = htmlEntityDecoded
      .replace(/\s*\[\s*(?:at|AT)\s*\]\s*|\s*\(\s*(?:at|AT)\s*\)\s*|\s*\{\s*(?:at|AT)\s*\}\s*|\s+(?:at|AT)\s+/g, '@')
      .replace(/\s*\[\s*(?:dot|DOT)\s*\]\s*|\s*\(\s*(?:dot|DOT)\s*\)\s*|\s*\{\s*(?:dot|DOT)\s*\}\s*|\s+(?:dot|DOT)\s+/g, '.');

    // 4. Standard regex email extraction
    const rawMatches = html.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/g) || [];
    for (const e of rawMatches) emailsSet.add(e);

    const deMatches = deobfuscated.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/g) || [];
    for (const e of deMatches) emailsSet.add(e);

    // 5. Mailto href attributes
    $('a[href^="mailto:"]').each((_, el) => {
      const href = $(el).attr('href') || '';
      const raw = href.replace(/^mailto:/i, '').split('?')[0].trim();
      if (raw) {
        const parts = raw.split(/[,;]/);
        for (let p of parts) {
          p = p.trim();
          try { p = decodeURIComponent(p); } catch (_) {}
          if (p) emailsSet.add(p);
        }
      }
    });

    // 6. Schema.org JSON-LD scripts & meta tags
    $('script[type="application/ld+json"]').each((_, el) => {
      const text = $(el).html() || '';
      const m = text.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/g) || [];
      for (const e of m) emailsSet.add(e);
    });
    $('meta[content*="@"]').each((_, el) => {
      const content = $(el).attr('content') || '';
      const m = content.match(/[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}/g) || [];
      for (const e of m) emailsSet.add(e);
    });

    // 7. Social Media links extraction
    $('a[href]').each((_, el) => {
      const href = $(el).attr('href');
      if (!href) return;

      if (!socialLinks.instagram && /instagram\.com\/[a-zA-Z0-9._-]+/i.test(href)) {
        if (!this.isSystemSocialPath('instagram', href)) {
          socialLinks.instagram = this.cleanSocialUrl(href);
        }
      } else if (!socialLinks.facebook && /facebook\.com\/[a-zA-Z0-9._-]+/i.test(href)) {
        if (!this.isSystemSocialPath('facebook', href)) {
          socialLinks.facebook = this.cleanSocialUrl(href);
        }
      } else if (!socialLinks.linkedin && /linkedin\.com\/(?:company|in)\/[a-zA-Z0-9._-]+/i.test(href)) {
        if (!this.isSystemSocialPath('linkedin', href)) {
          socialLinks.linkedin = this.cleanSocialUrl(href);
        }
      } else if (!socialLinks.tiktok && /tiktok\.com\/@[a-zA-Z0-9._-]+/i.test(href)) {
        if (!this.isSystemSocialPath('tiktok', href)) {
          socialLinks.tiktok = this.cleanSocialUrl(href);
        }
      }
    });

    return { emails: Array.from(emailsSet), socialLinks };
  }

  findSubPageLinks(html, baseUrl) {
    const subUrls = [];
    if (!html || !baseUrl) return subUrls;

    const highPriorityPatterns = [
      /contact/i, /kontakt/i, /contacto/i, /contatti/i, /contattaci/i, /contato/i, /contactos/i,
      /impressum/i, /mentions-legales/i, /aviso-legal/i, /note-legali/i,
      /hubungi/i, /fale-conosco/i, /contactez-nous/i, /nous-contacter/i,
      /reach-us/i, /get-in-touch/i, /お問い合わせ/i, /お問合せ/i, /問い合わせ/i, /連絡先/i
    ];

    const mediumPriorityPatterns = [
      /about/i, /tentang/i, /ueber-uns/i, /uber-uns/i, /ueber/i, /a-propos/i, /sobre-nosotros/i,
      /quienes-somos/i, /chi-siamo/i, /quem-somos/i, /over-ons/i, /om-oss/i, /o-nas/i, /o-firmie/i,
      /support/i, /lokasi/i, /location/i, /standort/i, /anfahrt/i, /dove-siamo/i, /onde-estamos/i,
      /donde-estamos/i, /locatie/i, /finn-oss/i, /hitta-oss/i, /dojazd/i, /coordonnees/i,
      /会社概要/i, /アクセス/i, /店舗情報/i, /team/i, /equipe/i, /equipo/i, /help/i, /info/i
    ];

    try {
      const $ = cheerio.load(html);
      const baseObj = new URL(baseUrl);
      const scoredLinks = [];

      $('a[href]').each((_, el) => {
        const href = $(el).attr('href');
        const text = $(el).text() || '';
        if (!href || href.startsWith('mailto:') || href.startsWith('tel:') || href.startsWith('#') || href.startsWith('javascript:')) return;

        let score = 0;
        if (highPriorityPatterns.some(p => p.test(href) || p.test(text))) {
          score = 10;
        } else if (mediumPriorityPatterns.some(p => p.test(href) || p.test(text))) {
          score = 5;
        }

        if (score > 0) {
          try {
            const abs = new URL(href, baseObj.href).href;
            if (new URL(abs).hostname === baseObj.hostname && abs !== baseObj.href) {
              if (!scoredLinks.some(item => item.url === abs)) {
                scoredLinks.push({ url: abs, score });
              }
            }
          } catch (_) {}
        }
      });

      scoredLinks.sort((a, b) => b.score - a.score);
      for (const item of scoredLinks) {
        subUrls.push(item.url);
      }
    } catch (_) {}

    return subUrls;
  }

  isSystemSocialPath(platform, rawUrl) {
    try {
      const u = new URL(rawUrl);
      const parts = u.pathname.split('/').map(p => p.trim().toLowerCase()).filter(Boolean);
      if (parts.length === 0) return true;
      const firstSegment = parts[0];

      const ignored = {
        instagram: ['p', 'reels', 'explore', 'stories', 'accounts', 'direct', 'tv', 'reel', 'channel', 'about', 'sharer', 'share'],
        facebook: ['sharer', 'share', 'tr', 'policies', 'dialog', 'plugins', 'share.php', 'intent', 'privacy', 'terms', 'help', 'login'],
        linkedin: ['share', 'sharing', 'sharearticle', 'intent', 'legal', 'privacy', 'jobs', 'feed'],
        tiktok: ['share', 'intent', 'embed', 'tag', 'music', 'video', 'foryou', 'trending', 'about', 'legal']
      };

      const ignoredList = ignored[platform];
      return ignoredList ? ignoredList.includes(firstSegment) : false;
    } catch (_) {
      return true;
    }
  }

  cleanSocialUrl(rawUrl) {
    try {
      const u = new URL(rawUrl);
      return `${u.protocol}//${u.hostname}${u.pathname}`.replace(/\/$/, '');
    } catch (_) {
      return rawUrl;
    }
  }

  async drain() {
    if (this.shuttingDown || this.isShuttingDown) {
      this.queue = [];
      return;
    }
    while ((this.queue.length > 0 || this.activeWorkers > 0) && !this.shuttingDown && !this.isShuttingDown) {
      await new Promise(r => setTimeout(r, 100));
    }
    if (this.shuttingDown || this.isShuttingDown) {
      this.queue = [];
    }
  }

  getStats() {
    return {
      queueLength: this.queue.length,
      activeWorkers: this.activeWorkers,
      concurrency: this.concurrency
    };
  }
}

EmailCrawlerPool.decodeCloudflareEmail = decodeCloudflareEmail;
EmailCrawlerPool.cleanEmailAddress = cleanEmailAddress;
EmailCrawlerPool.websiteDedupKey = websiteDedupKey;
EmailCrawlerPool.isPrivateIpLiteral = isPrivateIpLiteral;
EmailCrawlerPool.EmailCrawlerPool = EmailCrawlerPool;

module.exports = EmailCrawlerPool;
