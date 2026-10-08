// ============================================================
// store.js — Zero-Compilation Local Lead Data Repository
// ScrapScrap Open Source Suite
//
// Fast, flat-file JSON repository with in-memory caching,
// debounced disk persistence, and streaming CSV/JSON export.
// Zero C++ compilers or native build requirements.
// ============================================================

const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const DATA_DIR = path.join(__dirname, '../../data');
const LEADS_FILE = path.join(DATA_DIR, 'leads.json');

class LeadStore {
  constructor() {
    this.leads = new Map(); // id -> lead
    this.dirty = false;
    this.saveTimeout = null;
    this.ensureDataDir();
    this.load();
  }

  ensureDataDir() {
    if (!fs.existsSync(DATA_DIR)) {
      try { fs.mkdirSync(DATA_DIR, { recursive: true }); } catch (_) {}
    }
  }

  load() {
    this.ensureDataDir();
    if (fs.existsSync(LEADS_FILE)) {
      try {
        const raw = fs.readFileSync(LEADS_FILE, 'utf8');
        const list = JSON.parse(raw);
        if (Array.isArray(list)) {
          this.leads.clear();
          for (const item of list) {
            if (item && item.id) {
              this.leads.set(item.id, item);
            }
          }
        }
      } catch (err) {
        console.error('[store] Error loading leads.json:', err.message);
      }
    }
  }

  scheduleSave() {
    this.dirty = true;
    if (this.saveTimeout) return;
    this.saveTimeout = setTimeout(() => {
      this.saveTimeout = null;
      this.flushSync();
    }, 1000);
  }

  flushSync() {
    if (!this.dirty) return;
    this.ensureDataDir();
    try {
      // 1. Merge existing leads from disk so parallel workers never clobber peer leads
      if (fs.existsSync(LEADS_FILE)) {
        try {
          const diskRaw = fs.readFileSync(LEADS_FILE, 'utf8');
          const diskList = JSON.parse(diskRaw);
          if (Array.isArray(diskList)) {
            for (const item of diskList) {
              if (item && item.id && !this.leads.has(item.id)) {
                this.leads.set(item.id, item);
              }
            }
          }
        } catch (_) {}
      }

      const list = Array.from(this.leads.values());
      const tempFile = `${LEADS_FILE}.tmp.${Date.now()}.${process.pid}`;
      fs.writeFileSync(tempFile, JSON.stringify(list, null, 2), 'utf8');

      // 2. Resilient atomic rename with retry loop for Windows file-lock protection
      for (let attempt = 0; attempt < 5; attempt++) {
        try {
          fs.renameSync(tempFile, LEADS_FILE);
          break;
        } catch (renErr) {
          if (attempt === 4) {
            // Direct write fallback
            try { fs.writeFileSync(LEADS_FILE, JSON.stringify(list, null, 2), 'utf8'); } catch (_) {}
            try { fs.unlinkSync(tempFile); } catch (_) {}
          } else {
            const start = Date.now();
            while (Date.now() - start < 15) {}
          }
        }
      }

      this.dirty = false;
    } catch (err) {
      console.error('[store] Error writing leads.json:', err.message);
    }
  }

  generateId(lead) {
    if (lead.placeKey) return crypto.createHash('md5').update(lead.placeKey).digest('hex').slice(0, 16);
    const key = `${(lead.businessName || '').toLowerCase()}::${(lead.city || '').toLowerCase()}::${(lead.websiteUrl || '').toLowerCase()}`;
    return crypto.createHash('md5').update(key).digest('hex').slice(0, 16);
  }

  /**
   * Upsert a discovered or adjusted lead
   */
  saveLead(leadData) {
    const id = leadData.id || this.generateId(leadData);
    const existing = this.leads.get(id);

    const now = new Date().toISOString();
    const emails = Array.isArray(leadData.emails) ? Array.from(new Set(leadData.emails)) : [];
    const primaryEmail = leadData.primaryEmail || (emails.length > 0 ? emails[0] : null);

    const record = {
      id,
      businessName: leadData.businessName || 'Unnamed Business',
      city: leadData.city || 'Unknown',
      niche: leadData.niche || leadData.matchedSlug || 'General',
      matchedSlug: leadData.matchedSlug || leadData.niche || 'general',
      phone: leadData.phone || '',
      rating: typeof leadData.rating === 'number' ? leadData.rating : 0,
      reviewCount: typeof leadData.reviewCount === 'number' ? leadData.reviewCount : 0,
      mapsUrl: leadData.mapsUrl || '',
      websiteUrl: leadData.websiteUrl || '',
      emails: emails,
      primaryEmail: primaryEmail,
      contactPerson: leadData.contactPerson || (existing ? existing.contactPerson : ''),
      notes: leadData.notes || (existing ? existing.notes : ''),
      socialLinks: leadData.socialLinks || { instagram: null, facebook: null, linkedin: null, tiktok: null },
      status: leadData.status || (emails.length > 0 ? 'verified' : 'new'),
      locale: leadData.locale || 'en',
      createdAt: existing ? existing.createdAt : now,
      updatedAt: now
    };

    this.leads.set(id, record);
    this.scheduleSave();
    return record;
  }

  /**
   * Update fields on an existing lead
   */
  updateLead(id, updates) {
    const lead = this.leads.get(id);
    if (!lead) return null;

    if (updates.businessName !== undefined) lead.businessName = updates.businessName;
    if (updates.city !== undefined) lead.city = updates.city;
    if (updates.niche !== undefined) lead.niche = updates.niche;
    if (updates.phone !== undefined) lead.phone = updates.phone;
    if (updates.websiteUrl !== undefined) lead.websiteUrl = updates.websiteUrl;
    if (updates.primaryEmail !== undefined) lead.primaryEmail = updates.primaryEmail;
    if (updates.contactPerson !== undefined) lead.contactPerson = updates.contactPerson;
    if (updates.notes !== undefined) lead.notes = updates.notes;
    if (updates.status !== undefined) lead.status = updates.status;
    if (Array.isArray(updates.emails)) lead.emails = Array.from(new Set(updates.emails));

    lead.updatedAt = new Date().toISOString();
    this.leads.set(id, lead);
    this.scheduleSave();
    return lead;
  }

  deleteLead(id) {
    const deleted = this.leads.delete(id);
    if (deleted) this.scheduleSave();
    return deleted;
  }

  getLeadById(id) {
    return this.leads.get(id) || null;
  }

  /**
   * Filter and paginate leads
   */
  queryLeads(options = {}) {
    let list = Array.from(this.leads.values());

    // Search filter
    if (options.search) {
      const q = options.search.toLowerCase().trim();
      list = list.filter(l =>
        (l.businessName && l.businessName.toLowerCase().includes(q)) ||
        (l.city && l.city.toLowerCase().includes(q)) ||
        (l.websiteUrl && l.websiteUrl.toLowerCase().includes(q)) ||
        (l.primaryEmail && l.primaryEmail.toLowerCase().includes(q)) ||
        (l.contactPerson && l.contactPerson.toLowerCase().includes(q)) ||
        (l.emails && l.emails.some(e => e.toLowerCase().includes(q)))
      );
    }

    // Niche filter
    if (options.niche && options.niche !== 'all') {
      const n = options.niche.toLowerCase();
      list = list.filter(l => l.niche && (l.niche.toLowerCase() === n || (l.matchedSlug && l.matchedSlug.toLowerCase() === n)));
    }

    // City filter
    if (options.city && options.city !== 'all') {
      const c = options.city.toLowerCase();
      list = list.filter(l => l.city && l.city.toLowerCase() === c);
    }

    // Rating filter
    if (options.minRating) {
      const minR = parseFloat(options.minRating);
      if (!isNaN(minR)) list = list.filter(l => l.rating >= minR);
    }

    // Reviews filter
    if (options.minReviews) {
      const minRev = parseInt(options.minReviews, 10);
      if (!isNaN(minRev)) list = list.filter(l => l.reviewCount >= minRev);
    }

    // Email status filter
    if (options.emailStatus) {
      if (options.emailStatus === 'has_email') {
        list = list.filter(l => l.primaryEmail || (l.emails && l.emails.length > 0));
      } else if (options.emailStatus === 'no_email') {
        list = list.filter(l => !l.primaryEmail && (!l.emails || l.emails.length === 0));
      } else if (options.emailStatus === 'multi_email') {
        list = list.filter(l => l.emails && l.emails.length > 1);
      }
    }

    // Sort order (default newest first)
    list.sort((a, b) => new Date(b.updatedAt || b.createdAt) - new Date(a.updatedAt || a.createdAt));

    const total = list.length;
    const page = parseInt(options.page, 10) || 1;
    const limit = parseInt(options.limit, 10) || 50;
    const startIndex = (page - 1) * limit;
    const paginated = list.slice(startIndex, startIndex + limit);

    return {
      total,
      page,
      limit,
      totalPages: Math.ceil(total / limit) || 1,
      leads: paginated
    };
  }

  getStats() {
    const list = Array.from(this.leads.values());
    const total = list.length;
    let withEmail = 0;
    let multiEmail = 0;
    let totalRatings = 0;
    let ratedCount = 0;

    const cityCounts = {};
    const nicheCounts = {};

    for (const l of list) {
      if (l.primaryEmail || (l.emails && l.emails.length > 0)) withEmail++;
      if (l.emails && l.emails.length > 1) multiEmail++;
      if (l.rating > 0) {
        totalRatings += l.rating;
        ratedCount++;
      }
      if (l.city) cityCounts[l.city] = (cityCounts[l.city] || 0) + 1;
      if (l.niche) nicheCounts[l.niche] = (nicheCounts[l.niche] || 0) + 1;
    }

    return {
      totalLeads: total,
      leadsWithEmail: withEmail,
      leadsWithoutEmail: total - withEmail,
      multiEmailLeads: multiEmail,
      averageRating: ratedCount > 0 ? (totalRatings / ratedCount).toFixed(1) : '0.0',
      topCities: Object.entries(cityCounts).sort((a, b) => b[1] - a[1]).slice(0, 5),
      topNiches: Object.entries(nicheCounts).sort((a, b) => b[1] - a[1]).slice(0, 5)
    };
  }

  /**
   * Formats leads into standard CSV formatted for cold outreach platforms
   */
  exportToCsv(leadsList) {
    const leads = leadsList || Array.from(this.leads.values());
    const headers = [
      'Business Name',
      'Contact Person',
      'Primary Email',
      'All Emails',
      'Phone',
      'City',
      'Niche',
      'Rating',
      'Review Count',
      'Website',
      'Google Maps URL',
      'Instagram',
      'Facebook',
      'LinkedIn',
      'TikTok',
      'Notes',
      'Status'
    ];

    const escapeCsv = (val) => {
      if (val === null || val === undefined) return '""';
      let str = String(val);
      if (/^[=+\-@\t\r]/.test(str)) {
        str = "'" + str; // Neutralize spreadsheet formula / DDE injection
      }
      return `"${str.replace(/"/g, '""')}"`;
    };

    const rows = [headers.join(',')];
    for (const l of leads) {
      const social = l.socialLinks || {};
      const row = [
        escapeCsv(l.businessName),
        escapeCsv(l.contactPerson || ''),
        escapeCsv(l.primaryEmail || (l.emails && l.emails[0]) || ''),
        escapeCsv((l.emails || []).join('; ')),
        escapeCsv(l.phone || ''),
        escapeCsv(l.city || ''),
        escapeCsv(l.niche || ''),
        escapeCsv(l.rating || ''),
        escapeCsv(l.reviewCount || ''),
        escapeCsv(l.websiteUrl || ''),
        escapeCsv(l.mapsUrl || ''),
        escapeCsv(social.instagram || ''),
        escapeCsv(social.facebook || ''),
        escapeCsv(social.linkedin || ''),
        escapeCsv(social.tiktok || ''),
        escapeCsv(l.notes || ''),
        escapeCsv(l.status || '')
      ];
      rows.push(row.join(','));
    }

    return rows.join('\r\n');
  }
}

// Global Singleton
const storeInstance = new LeadStore();
module.exports = storeInstance;
