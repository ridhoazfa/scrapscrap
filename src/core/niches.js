// ============================================================
// niches.js — SMB Category Classifier & Institutional Guard
// ScrapScrap Open Source Suite
// Maps raw Google Maps business category strings to standardized niche slugs.
// Guards against non-SMB entities (malls, stadiums, airports, etc.)
// and provides locale-partitioned keyword sets.
// ============================================================

// ── Exhaustive Institutional / Non-SMB Blacklist ───────────────
const INSTITUTIONAL_BLACKLIST = [
  // Stadiums, Arenas, Sports Complexes & Coliseums
  'stadium', 'stadion', 'arena', 'coliseum', 'gelora', 'sports complex', 'sport complex',
  'sports arena', 'sport arena', 'racing circuit', 'sirkuit', 'velodrome',

  // Shopping Malls, Plazas, Town Squares & Department Stores
  'mall', 'shopping mall', 'shopping center', 'shopping centre', 'plaza', 'town square',
  'centro comercial', 'galeria', 'department store', 'outlet mall', 'trade center',
  'supermall', 'megamall', 'hypermarket', 'supermarket', 'bazaar',

  // Public Infrastructure, Transit, Airports & Ports
  'airport', 'bandara', 'aeropuerto', 'flughafen', 'aeroport', 'aeroporto',
  'train station', 'stasiun', 'gare', 'bahnhof', 'estacion de tren', 'subway station',
  'metro station', 'bus station', 'bus terminal', 'terminal bus', 'ferry terminal',
  'harbor', 'harbour', 'port', 'pelabuhan',

  // Hospitals, Medical Centres, Mega-Healthcare Networks
  'hospital', 'rumah sakit', 'rsud', 'rsup', 'puskesmas', 'klinik utama',
  'general hospital', 'medical center', 'centre hospitalier', 'krankenhaus',
  'ospedale', 'hospice',

  // Universities, Colleges, Schools & Government Bodies
  'university', 'universitas', 'college', 'universitat', 'universite', 'universidad',
  'kampus', 'campus', 'school district', 'politeknik', 'polytechnic',
  'ministry', 'kementerian', 'dinas', 'embassy', 'kedutaan', 'consulate', 'konsulat',
  'city hall', 'balai kota', 'courthouse', 'pengadilan', 'police station',
  'kantor polisi', 'polres', 'polsek', 'fire station', 'pemadam kebakaran',
  'military base', 'markas', 'pangkalan',

  // Banks, Financial Institutions & ATMs
  'bank', 'atm', 'bca', 'mandiri', 'bni', 'bri', 'cimb', 'danamon', 'citibank',
  'hsbc', 'barclays', 'chase bank', 'wells fargo', 'bank of america',

  // Public Monuments, Museums, Religious Landmarks & Tourist Attractions
  'museum', 'monument', 'monas', 'taman mini', 'zoo', 'kebun binatang',
  'cathedral', 'katedral', 'gereja', 'church', 'mosque', 'masjid', 'temple',
  'pura', 'candi', 'synagogue', 'amusement park', 'theme park', 'waterpark',
  'water park', 'national park', 'taman nasional'
];

/**
 * isInstitutional — Fast check if a name or category represents a non-SMB institutional entity.
 * @param {string} text - Business name or raw category string
 * @returns {boolean}
 */
function isInstitutional(text) {
  if (!text || typeof text !== 'string') return false;
  const s = text.toLowerCase().trim();
  if (!s) return false;

  for (const item of INSTITUTIONAL_BLACKLIST) {
    // Check whole word or clear substring
    if (s === item) return true;
    const regex = new RegExp(`(^|[^a-z0-9])${item.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&')}([^a-z0-9]|$)`, 'i');
    if (regex.test(s)) return true;
  }
  return false;
}

// ── Locale-Partitioned Keyword Sets (24 Niches) ────────────────
const NICHE_KEYWORDS_BY_LOCALE = {
  gym: {
    en: ['gym', 'fitness center', 'crossfit gym', 'yoga studio', 'pilates studio', 'personal trainer', 'bodybuilding gym', 'martial arts school', 'boxing gym'],
    id: ['tempat fitness', 'pusat kebugaran', 'studio yoga', 'studio pilates', 'gym'],
    es: ['gimnasio', 'centro de fitness', 'estudio de yoga', 'estudio de pilates'],
    de: ['fitnessstudio', 'sportstudio', 'yogastudio', 'pilates studio'],
    fr: ['centre de remise en forme', 'salle de sport', 'studio de yoga']
  },
  restaurant: {
    en: ['restaurant', 'cafeteria', 'steakhouse', 'seafood restaurant', 'sushi bar', 'pizzeria', 'bistro'],
    id: ['restoran', 'rumah makan', 'warung makan', 'rumah makan padang', 'bistro'],
    es: ['restaurante', 'marisqueria', 'asador', 'pizzeria'],
    de: ['restaurant', 'gaststatte', 'speiselokal', 'steakhouse', 'pizzeria'],
    fr: ['restaurant', 'brasserie', 'bistro', 'trattoria', 'pizzeria']
  },
  barber: {
    en: ['barber', 'barbershop', 'haircut salon', 'men haircut', 'barber salon', 'shave shop', 'hair studio', 'barber shop'],
    id: ['pangkas rambut', 'tukang cukur', 'potong rambut pria', 'barbershop'],
    es: ['barberia', 'peluqueria de caballeros', 'barbero'],
    de: ['friseur', 'friseursalon', 'barbier', 'barbershop'],
    fr: ['barbier', 'salon de coiffure pour hommes', 'coiffeur']
  },
  dental: {
    en: ['dentist', 'dental clinic', 'orthodontist', 'teeth whitening', 'dental care', 'periodontist', 'pediatric dentist'],
    id: ['dokter gigi', 'klinik gigi', 'praktek dokter gigi', 'spesialis gigi', 'implan gigi'],
    es: ['dentista', 'clinica dental', 'clinica odontologica', 'ortodoncista'],
    de: ['zahnarzt', 'zahnklinik', 'zahnarztpraxis', 'kieferorthopade'],
    fr: ['dentiste', 'clinique dentaire', 'centre dentaire', 'orthodontiste']
  },
  legal: {
    en: ['lawyer', 'law firm', 'attorney', 'legal consultant', 'notary public'],
    id: ['notaris', 'advokat', 'pengacara', 'konsultan hukum', 'kantor pengacara', 'kantor notaris'],
    es: ['abogado', 'bufete de abogados', 'notaria', 'asesoria juridica'],
    de: ['rechtsanwalt', 'anwaltskanzlei', 'notar', 'anwalt'],
    fr: ['avocat', 'cabinet d avocats', 'notaire', 'conseil juridique']
  },
  cleaning: {
    en: ['cleaning service', 'house cleaning', 'office cleaning', 'maid service', 'disinfection service', 'carpet cleaning', 'window cleaning'],
    id: ['jasa bersih rumah', 'jasa pembersihan', 'jasa kebersihan', 'cuci kasur', 'cuci sofa', 'sedot tungau'],
    es: ['servicio de limpieza', 'limpieza de oficinas', 'limpieza de casas'],
    de: ['gebaudereinigung', 'reinigungsfirma', 'hausreinigung', 'bueroreinigung'],
    fr: ['entreprise de nettoyage', 'nettoyage de bureaux', 'nettoyage domicile']
  },
  salon: {
    en: ['beauty salon', 'hair salon', 'nail salon', 'eyelash extension', 'makeup artist', 'hair treatment', 'bridal salon', 'waxing salon'],
    id: ['salon kecantikan', 'klinik kecantikan', 'salon rambut', 'eyelash extension', 'perawatan rambut', 'salon kuku'],
    es: ['salon de belleza', 'peluqueria', 'centro de estetica', 'salon de unas'],
    de: ['kosmetikstudio', 'friseursalon', 'nagelstudio', 'beautysalon'],
    fr: ['salon de beaute', 'salon de coiffure', 'institut de beaute', 'bar a ongles']
  },
  creativestudio: {
    en: ['photography studio', 'photo studio', 'creative studio', 'videography', 'design studio', 'graphic designer', 'advertising agency', 'video production'],
    id: ['studio foto', 'jasa fotografi', 'studio rekaman', 'agency desain', 'videografer'],
    es: ['estudio de fotografia', 'estudio creativo', 'productora audiovisual'],
    de: ['fotostudio', 'kreativstudio', 'videoproduktion', 'designagentur'],
    fr: ['studio photo', 'studio de creation', 'production audiovisuelle']
  },
  autorental: {
    en: ['car rental', 'vehicle rental', 'motorcycle rental', 'truck rental', 'car hire'],
    id: ['rental mobil', 'sewa mobil', 'rental motor', 'sewa kendaraan', 'carter mobil'],
    es: ['alquiler de coches', 'rent a car', 'alquiler de furgonetas'],
    de: ['autovermietung', 'mietwagen', 'kfz vermietung'],
    fr: ['location de voitures', 'location utilitaire', 'loueur de voitures']
  },
  dessert: {
    en: ['bakery', 'cake shop', 'pastry shop', 'cupcake shop', 'donut shop', 'patisserie', 'sweet shop'],
    id: ['toko kue', 'toko roti', 'roti bakar', 'pastry shop'],
    es: ['pasteleria', 'panaderia', 'reposteria'],
    de: ['backerei', 'konditorei', 'feinbackerei'],
    fr: ['boulangerie', 'patisserie', 'salon de the']
  },
  realestate: {
    en: ['real estate agency', 'property agent', 'apartment rental', 'property developer', 'real estate broker'],
    id: ['agen properti', 'developer perumahan', 'sewa apartemen', 'jual rumah'],
    es: ['inmobiliaria', 'agencia inmobiliaria', 'promotora inmobiliaria'],
    de: ['immobilienmakler', 'immobilienburo', 'hausverwaltung'],
    fr: ['agence immobiliere', 'promoteur immobilier']
  },
  homeservice: {
    en: ['handyman', 'plumber', 'electrician', 'AC service', 'renovation contractor', 'roofing contractor', 'painter'],
    id: ['service AC', 'servis ac', 'tukang bangunan', 'jasa plumbing', 'sedot wc', 'tukang listrik', 'tukang cat'],
    es: ['fontanero', 'electricista', 'reparaciones del hogar', 'pintor'],
    de: ['handwerker', 'klempner', 'elektriker', 'renovierung'],
    fr: ['plombier', 'electricien', 'depannage domicile', 'peintre']
  },
  petcare: {
    en: ['pet grooming', 'veterinary clinic', 'pet clinic', 'pet shop', 'pet boarding', 'dog trainer'],
    id: ['dokter hewan', 'klinik hewan', 'grooming kucing', 'grooming anjing', 'pet shop', 'penitipan hewan'],
    es: ['veterinario', 'clinica veterinaria', 'peluqueria canina'],
    de: ['tierarzt', 'tierklinik', 'hundesalon', 'tierpension'],
    fr: ['veterinaire', 'clinique veterinaire', 'toilettage canin']
  },
  wedding: {
    en: ['wedding planner', 'wedding organizer', 'bridal shop', 'wedding photographer', 'wedding decoration', 'wedding venue'],
    id: ['wedding organizer', 'wo pernikahan', 'sewa gaun pengantin', 'catering pernikahan', 'dekorasi pernikahan'],
    es: ['organizador de bodas', 'wedding planner', 'tienda de novias'],
    de: ['hochzeitsplaner', 'brautmoden', 'hochzeitsfotograf'],
    fr: ['organisateur de mariage', 'wedding planner', 'robe de mariee']
  },
  medical: {
    en: ['medical clinic', 'doctor practice', 'specialist clinic', 'physiotherapist', 'chiropractor', 'family doctor'],
    id: ['klinik kesehatan', 'praktek dokter', 'klinik umum', 'klinik pratama', 'apotek', 'praktek dokter spesialis'],
    es: ['clinica medica', 'centro medico', 'consulta medica', 'fisioterapeuta'],
    de: ['arztpraxis', 'facharzt', 'physiotherapie', 'allgemeinarzt'],
    fr: ['cabinet medical', 'clinique', 'medecin generaliste']
  },
  spa: {
    en: ['spa', 'massage therapy', 'reflexology', 'wellness spa', 'sauna', 'beauty spa', 'body massage', 'aromatherapy'],
    id: ['pijat keluarga', 'pijat refleksi', 'spa kecantikan', 'pijat sehat', 'massage spa'],
    es: ['spa', 'centro de masajes', 'balneario', 'masajista'],
    de: ['wellness spa', 'massagepraxis', 'saunawelt', 'therme'],
    fr: ['spa bien-etre', 'salon de massage', 'thalassotherapie']
  },
  laundry: {
    en: ['laundry service', 'dry cleaning', 'coin laundry', 'carpet cleaning', 'laundromat'],
    id: ['laundry kiloan', 'jasa cuci baju', 'cuci karpet', 'laundry express', 'cuci sepatu'],
    es: ['lavanderia', 'tintoreria', 'lavanderia de autoservicio'],
    de: ['waschsalon', 'textilreinigung', 'reinigung'],
    fr: ['pressing', 'laverie automatique', 'blanchisserie']
  },
  coworking: {
    en: ['coworking space', 'shared office', 'virtual office', 'serviced office', 'business center', 'workspace'],
    id: ['coworking space', 'sewa kantor', 'sewa ruang rapat', 'virtual office', 'sewa meja kerja'],
    es: ['espacio de coworking', 'oficina compartida', 'oficina virtual'],
    de: ['coworking space', 'gemeinschaftsburo', 'virtuelles buro'],
    fr: ['espace de coworking', 'bureau partage', 'bureau virtuel']
  },
  autodetailing: {
    en: ['auto detailing', 'car detailing', 'ceramic coating', 'car polish', 'paint protection', 'window tinting'],
    id: ['salon mobil', 'poles mobil', 'coating mobil', 'detailing mobil', 'cleaning interior mobil'],
    es: ['detallado de coches', 'pulido de coches', 'proteccion ceramica'],
    de: ['fahrzeugaufbereitung', 'autopolitur', 'keramikversiegelung'],
    fr: ['detailing auto', 'nettoyage et lustrage', 'traitement ceramique']
  },
  autowash: {
    en: ['car wash', 'motorcycle wash', 'automatic car wash', 'steam wash', 'hand car wash'],
    id: ['cuci mobil', 'steam mobil', 'cuci motor', 'cuci salju', 'cuci kendaraan'],
    es: ['lavado de autos', 'autolavado', 'lavacoches'],
    de: ['waschanlage', 'autowaschanlage', 'sb-waschbox'],
    fr: ['lavage auto', 'station de lavage', 'lavage haute pression']
  },
  cafe: {
    en: ['cafe', 'coffee shop', 'espresso bar', 'roastery', 'tea house', 'specialty coffee'],
    id: ['kafe', 'kedai kopi', 'warkop', 'kedai kopi susu', 'roastery'],
    es: ['cafeteria', 'bar de cafe', 'teteria'],
    de: ['kaffeehaus', 'cafe', 'roesterei'],
    fr: ['cafe', 'salon de the', 'brulerie']
  },
  hotel: {
    en: ['boutique hotel', 'guesthouse', 'resort', 'homestay', 'motel', 'bed and breakfast'],
    id: ['hotel', 'villa', 'penginapan', 'sewa villa', 'homestay', 'guesthouse'],
    es: ['hotel boutique', 'posada', 'alojamiento rural', 'casa de huespedes'],
    de: ['boutique hotel', 'gasthaus', 'pension', 'ferienwohnung'],
    fr: ['hotel de charme', 'chambre d hotes', 'auberge', 'gite']
  },
  education: {
    en: ['tutoring center', 'course center', 'language school', 'music school', 'learning center', 'coding academy'],
    id: ['bimbel', 'les privat', 'kursus bahasa', 'les matematika', 'bimbingan belajar', 'les bahasa inggris', 'kursus musik'],
    es: ['academia de ingles', 'centro de estudios', 'clases particulares', 'escuela de musica'],
    de: ['nachhilfe', 'sprachschule', 'musikschule', 'lernstudio'],
    fr: ['cours particuliers', 'soutien scolaire', 'ecole de langues', 'ecole de musique']
  },
  florist: {
    en: ['florist', 'flower shop', 'flower delivery', 'hand bouquet', 'floral design'],
    id: ['toko bunga', 'buket bunga', 'karangan bunga', 'florist online', 'toko buket', 'papan bunga'],
    es: ['floristeria', 'tienda de flores', 'ramos de flores'],
    de: ['blumenladen', 'florist', 'blumengeschaft'],
    fr: ['fleuriste', 'boutique de fleurs', 'livraison de fleurs']
  }
};

// ── Backwards-Compatible Flat Dictionary (for matching algorithms) ────────
const NICHE_MAP = {};
for (const [slug, locales] of Object.entries(NICHE_KEYWORDS_BY_LOCALE)) {
  const combined = [];
  for (const list of Object.values(locales)) {
    combined.push(...list);
  }
  NICHE_MAP[slug] = Array.from(new Set(combined));
}

/**
 * getNicheKeywords — Returns keywords strictly for the specified locale.
 * Default locale is strictly 'en' (English) to prevent accidental foreign fallback.
 * @param {string} slug - The niche slug (e.g. 'gym', 'creativestudio')
 * @param {string} [locale='en'] - Target locale ('en', 'id', 'de', 'es', 'fr')
 * @returns {string[]}
 */
function getNicheKeywords(slug, locale = 'en') {
  const nicheObj = NICHE_KEYWORDS_BY_LOCALE[slug];
  if (!nicheObj) return [slug];

  const loc = (locale || 'en').toLowerCase().trim();
  if (nicheObj[loc] && nicheObj[loc].length > 0) {
    return nicheObj[loc];
  }
  // Fallback to English (global lingua franca)
  return nicheObj.en || [slug];
}

/**
 * matchNiche — case-insensitive fuzzy match against the niche dictionary.
 * Returns the standardized niche slug (e.g. 'gym', 'dental') or null.
 * Strictly guards against institutional entities!
 */
function matchNiche(categoryText) {
  if (!categoryText || typeof categoryText !== 'string') return null;
  if (isInstitutional(categoryText)) return null;

  const haystack = categoryText.toLowerCase().trim();
  if (!haystack) return null;

  const entries = [];
  for (const [slug, keywords] of Object.entries(NICHE_MAP)) {
    for (const kw of keywords) {
      entries.push({ slug, keyword: kw.toLowerCase() });
    }
  }
  entries.sort((a, b) => b.keyword.length - a.keyword.length);

  for (const { slug, keyword } of entries) {
    if (haystack.includes(keyword)) return slug;
  }

  return null;
}

/**
 * matchClosestNiche — Multi-signal weighted closeness matcher against 24 target niche slugs.
 * Strictly guards against institutional entities!
 */
function matchClosestNiche(details, activeSlug) {
  if (!details || typeof details !== 'object') return activeSlug || null;

  const category = typeof details?.category === 'string' ? details.category.toLowerCase().trim() : '';
  const name = typeof details?.businessName === 'string' ? details.businessName.toLowerCase().trim() : '';
  const url = typeof details?.websiteUrl === 'string' ? details.websiteUrl.toLowerCase().trim() : '';

  // INSTITUTIONAL DEFENSE: Reject stadiums, malls, hospitals, universities, transit hubs
  if (isInstitutional(category) || isInstitutional(name)) {
    return null;
  }

  const scores = {};
  for (const slug of Object.keys(NICHE_MAP)) {
    scores[slug] = 0;
  }

  for (const [slug, keywords] of Object.entries(NICHE_MAP)) {
    for (const kw of keywords) {
      const kwLower = kw.toLowerCase();
      const bonus = kwLower.length * 0.1;

      // Signal 1: Category Match (Weight = 10)
      if (category && category.includes(kwLower)) {
        scores[slug] += 10 + bonus;
      }
      // Signal 2: Business Name Match (Weight = 8)
      if (name && name.includes(kwLower)) {
        scores[slug] += 8 + bonus;
      }
      // Signal 3: Website URL Match (Weight = 5)
      if (url && url.includes(kwLower)) {
        scores[slug] += 5 + bonus;
      }
    }
  }

  // Signal 4: Active Search Target Baseline Bonus (Weight = 3)
  if (activeSlug && scores[activeSlug] !== undefined) {
    scores[activeSlug] += 3;
  }

  let bestSlug = null;
  let maxScore = 0;

  for (const [slug, score] of Object.entries(scores)) {
    if (score > maxScore) {
      maxScore = score;
      bestSlug = slug;
    }
  }

  return bestSlug || activeSlug || null;
}

module.exports = {
  NICHE_MAP,
  NICHE_KEYWORDS_BY_LOCALE,
  INSTITUTIONAL_BLACKLIST,
  isInstitutional,
  getNicheKeywords,
  matchNiche,
  matchClosestNiche
};
