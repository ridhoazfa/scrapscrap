// ============================================================
// spatial.js — Sub-District Spatial Grid Mesh Database & Target Expander
// ScrapScrap Open Source Suite
// Maps sub-districts/neighborhoods with 5-sector cardinal fallback.
// ============================================================

const COUNTRY_ALIASES = {
  'id': 'indonesia',
  'us': 'united-states',
  'usa': 'united-states',
  'ca': 'canada',
  'mx': 'mexico',
  'br': 'brazil',
  'gb': 'united-kingdom',
  'uk': 'united-kingdom',
  'de': 'germany',
  'fr': 'france',
  'it': 'italy',
  'es': 'spain',
  'nl': 'netherlands',
  'ch': 'switzerland',
  'ie': 'ireland',
  'be': 'belgium',
  'at': 'austria',
  'se': 'sweden',
  'no': 'norway',
  'dk': 'denmark',
  'fi': 'finland',
  'pl': 'poland',
  'pt': 'portugal',
  'gr': 'greece',
  'cz': 'czech-republic',
  'hu': 'hungary',
  'ro': 'romania',
  'bg': 'bulgaria',
  'hr': 'croatia',
  'sk': 'slovakia',
  'si': 'slovenia',
  'ee': 'estonia',
  'lt': 'lithuania',
  'lu': 'luxembourg',
  'cy': 'cyprus',
  'gi': 'gibraltar',
  'lv': 'latvia',
  'li': 'liechtenstein',
  'mt': 'malta',
  'jp': 'japan',
  'hk': 'hong-kong',
  'my': 'malaysia',
  'sg': 'singapore',
  'th': 'thailand',
  'ae': 'united-arab-emirates',
  'uae': 'united-arab-emirates',
  'au': 'australia',
  'nz': 'new-zealand',
  'gh': 'ghana',
  'ke': 'kenya',
  'ng': 'nigeria',
  'za': 'south-africa',
  'rsa': 'south-africa'
};

const SPATIAL_GRID_MESH = {
  // ── Indonesia (Midtrans Merchant Target) ────────────────────
  'indonesia': {
    'Jakarta': ['Kebayoran Baru', 'Senayan', 'Menteng', 'Kelapa Gading', 'Pantai Indah Kapuk', 'Kemang', 'Tebet', 'Cilandak', 'Tanah Abang', 'Puri Indah', 'Pluit', 'Sunter'],
    'Surabaya': ['Tegalsari', 'Gubeng', 'Wonokromo', 'Sukolilo', 'Rungkut', 'Genteng', 'Mulyorejo', 'Wiyung', 'Darmo', 'Sambikerep'],
    'Bandung': ['Coblong', 'Sukajadi', 'Sumur Bandung', 'Dago', 'Lengkong', 'Buahbatu', 'Cidadap', 'Cicendo', 'Pasteur'],
    'Medan': ['Medan Kota', 'Medan Petisah', 'Medan Baru', 'Medan Helvetia', 'Medan Johor', 'Medan Selayang'],
    'Semarang': ['Semarang Tengah', 'Semarang Selatan', 'Semarang Barat', 'Semarang Timur', 'Banyumanik', 'Candi'],
    'Makassar': ['Ujung Pandang', 'Panakkukang', 'Rappocini', 'Tamalanrea', 'Biringkanaya', 'Makassar Kota'],
    'Tangerang': ['Tangerang Kota', 'BSD City', 'Alam Sutera', 'Gading Serpong', 'Karawaci', 'Cipondoh'],
    'Bekasi': ['Bekasi Barat', 'Bekasi Selatan', 'Bekasi Timur', 'Bekasi Utara', 'Jatiasih', 'Cikarang'],
    'Depok': ['Margonda', 'Cinere', 'Sawangan', 'Cimanggis', 'Beji', 'Pancoran Mas'],
    'Bogor': ['Bogor Tengah', 'Bogor Timur', 'Bogor Selatan', 'Bogor Barat', 'Padjadjaran', 'Sentul'],
    'Bali': ['Seminyak', 'Canggu', 'Kuta', 'Ubud', 'Sanur', 'Jimbaran', 'Nusa Dua'],
    'Denpasar': ['Denpasar Selatan', 'Denpasar Barat', 'Denpasar Utara', 'Denpasar Timur'],
    'Yogyakarta': ['Malioboro', 'Gondomanan', 'Depok Sleman', 'UGM Area', 'Umbulharjo'],
    'Surakarta': ['Banjarsari', 'Jebres', 'Laweyan', 'Pasar Kliwon', 'Serengan'],
    'Malang': ['Lowokwaru', 'Klojen', 'Blimbing', 'Sukun', 'Kedungkandang'],
    'Palembang': ['Ilir Timur', 'Ilir Barat', 'Seberang Ulu', 'Sako', 'Sukarami'],
    'Pekanbaru': ['Tampan', 'Marpoyan Damai', 'Payung Sekaki', 'Bukit Raya'],
    'Manado': ['Wenang', 'Malalayang', 'Sario', 'Tikala', 'Mapanget'],
    'Batam': ['Batam Kota', 'Lubuk Baja', 'Sekupang', 'Nongsa'],
    'Pontianak': ['Pontianak Selatan', 'Pontianak Kota', 'Pontianak Barat', 'Pontianak Tenggara'],
    'Banjarmasin': ['Banjarmasin Tengah', 'Banjarmasin Selatan', 'Banjarmasin Utara'],
    'Samarinda': ['Samarinda Kota', 'Samarinda Ulu', 'Sungai Kunjang'],
    'Tasikmalaya': ['Cihideung', 'Cipedes', 'Tawang'],
    'Bandar Lampung': ['Tanjung Karang', 'Kedaton', 'Teluk Betung'],
    'Cimahi': ['Cimahi Tengah', 'Cimahi Utara', 'Cimahi Selatan'],
    'Cirebon': ['Kejaksan', 'Lemahwungkur', 'Kesambi'],
    'Mataram': ['Cakranegara', 'Mataram Kota', 'Ampenan'],
    'Kupang': ['Oebobo', 'Kelapa Lima', 'Maulafa'],
    'Jayapura': ['Jayapura Utara', 'Jayapura Selatan', 'Abepura'],
    'Sorong': ['Sorong Barat', 'Sorong Timur', 'Sorong Manoi', 'Sorong Kepulauan'],
    'Ambon': ['Sirimau', 'Nusaniwe', 'Teluk Ambon'],
    'Banda Aceh': ['Baiturrahman', 'Kuta Alam', 'Syiah Kuala'],
    'Balikpapan': ['Balikpapan Kota', 'Balikpapan Selatan', 'Balikpapan Utara'],
    'Ternate': ['Ternate Tengah', 'Ternate Utara', 'Ternate Selatan'],
    'Palu': ['Palu Timur', 'Palu Barat', 'Palu Selatan'],
    'Kendari': ['Kendari Barat', 'Mandonga', 'Kadia'],
    'Gorontalo': ['Kota Selatan', 'Kota Utara', 'Dungingi'],
    'Bengkulu': ['Ratu Samban', 'Teluk Segara', 'Gading Cempaka'],
    'Tarakan': ['Tarakan Barat', 'Tarakan Tengah', 'Tarakan Timur'],
    'Palangkaraya': ['Pahandut', 'Jekan Raya', 'Bukit Batu']
  },

  // ── North America (Stripe Merchant Targets) ─────────────────
  'united-states': {
    'New York': ['Manhattan', 'Brooklyn', 'Queens', 'Bronx', 'Staten Island', 'Williamsburg', 'SoHo', 'Harlem', 'Upper East Side', 'Chelsea', 'Financial District'],
    'Los Angeles': ['Hollywood', 'Santa Monica', 'Downtown LA', 'Beverly Hills', 'Venice', 'Westwood', 'Silver Lake', 'Pasadena', 'Century City'],
    'Chicago': ['The Loop', 'River North', 'Lincoln Park', 'Wicker Park', 'Logan Square', 'West Loop', 'Gold Coast'],
    'Houston': ['Downtown Houston', 'Montrose', 'The Heights', 'Galleria', 'Midtown Houston', 'Energy Corridor'],
    'Phoenix': ['Downtown Phoenix', 'Scottsdale', 'Tempe', 'Mesa', 'Glendale'],
    'Philadelphia': ['Center City', 'University City', 'Fishtown', 'Rittenhouse Square', 'Old City'],
    'San Antonio': ['Downtown San Antonio', 'Alamo Heights', 'Stone Oak', 'Medical Center'],
    'San Diego': ['Gaslamp Quarter', 'La Jolla', 'Pacific Beach', 'North Park', 'Little Italy'],
    'Dallas': ['Downtown Dallas', 'Uptown Dallas', 'Deep Ellum', 'Oak Lawn', 'Design District'],
    'San Jose': ['Downtown San Jose', 'Willow Glen', 'Santana Row', 'Alviso'],
    'Austin': ['Downtown Austin', 'South Congress', 'East Austin', 'Domain', 'Rainey Street'],
    'San Francisco': ['Financial District', 'SOMA', 'Mission District', 'Marina', 'Pacific Heights', 'North Beach'],
    'Seattle': ['Downtown Seattle', 'Capitol Hill', 'Ballard', 'Fremont', 'South Lake Union'],
    'Miami': ['South Beach', 'Brickell', 'Wynwood', 'Coral Gables', 'Downtown Miami', 'Little Havana'],
    'Boston': ['Back Bay', 'Beacon Hill', 'Seaport District', 'Cambridge', 'South End'],
    'Atlanta': ['Midtown Atlanta', 'Buckhead', 'Downtown Atlanta', 'Inman Park', 'Old Fourth Ward'],
    'Denver': ['LoDo', 'RiNo', 'Capitol Hill', 'Cherry Creek', 'Highlands'],
    'Las Vegas': ['The Strip', 'Downtown Las Vegas', 'Summerlin', 'Henderson'],
    'Portland': ['Pearl District', 'Downtown Portland', 'Nob Hill', 'Alberta Arts District'],
    'Nashville': ['Downtown Nashville', 'Gulch', 'East Nashville', 'Midtown Nashville']
  },
  'canada': {
    'Toronto': ['Downtown Toronto', 'Yorkville', 'Liberty Village', 'North York', 'Scarborough', 'Etobicoke', 'King West'],
    'Vancouver': ['Downtown Vancouver', 'Yaletown', 'Kitsilano', 'Gastown', 'Mount Pleasant', 'West End'],
    'Montreal': ['Old Montreal', 'Plateau-Mont-Royal', 'Downtown Montreal', 'Mile End', 'Griffintown'],
    'Calgary': ['Downtown Calgary', 'Beltline', 'Kensington', 'Bridgeland'],
    'Edmonton': ['Downtown Edmonton', 'Old Strathcona', 'Oliver', 'West Edmonton'],
    'Ottawa': ['ByWard Market', 'Centretown', 'Glebe', 'Westboro']
  },
  'mexico': {
    'Mexico City': ['Polanco', 'Condesa', 'Roma Norte', 'Santa Fe', 'Coyoacan', 'Centro Historico', 'Juarez'],
    'Guadalajara': ['Zapopan', 'Providencia', 'Chapultepec', 'Centro Guadalajara'],
    'Monterrey': ['San Pedro Garza Garcia', 'Centro Monterrey', 'Valle Oriente', 'Cintermex'],
    'Puebla': ['Angelopolis', 'Centro Historico', 'Cholula'],
    'Tijuana': ['Zona Rio', 'Playas de Tijuana', 'Centro Tijuana'],
    'Cancun': ['Zona Hotelera', 'Centro Cancun', 'Puerto Cancun']
  },

  // ── South America (Stripe Merchant Target) ───────────────────
  'brazil': {
    'Sao Paulo': ['Jardins', 'Itaim Bibi', 'Pinheiros', 'Moema', 'Vila Madalena', 'Paulista', 'Faria Lima', 'Brooklin'],
    'Rio de Janeiro': ['Copacabana', 'Ipanema', 'Leblon', 'Botafogo', 'Centro Rio', 'Barra da Tijuca', 'Flamengo'],
    'Brasilia': ['Asa Sul', 'Asa Norte', 'Lago Sul', 'Lago Norte'],
    'Salvador': ['Barra', 'Pelourinho', 'Rio Vermelho', 'Pituba'],
    'Belo Horizonte': ['Savassi', 'Lourdes', 'Pampulha', 'Centro BH']
  },

  // ── Europe (Stripe Merchant Targets) ─────────────────────────
  'united-kingdom': {
    'London': ['City of London', 'Westminster', 'Camden', 'Kensington', 'Chelsea', 'Islington', 'Hackney', 'Canary Wharf', 'Soho', 'Greenwich', 'Mayfair', 'Shoreditch'],
    'Manchester': ['City Centre', 'Northern Quarter', 'Ancoats', 'Didsbury', 'Salford Quays'],
    'Birmingham': ['City Centre', 'Jewellery Quarter', 'Digbeth', 'Edgbaston'],
    'Glasgow': ['City Centre', 'West End', 'Merchant City', 'Finnieston'],
    'Edinburgh': ['Old Town', 'New Town', 'Leith', 'Stockbridge'],
    'Liverpool': ['City Centre', 'Albert Dock', 'Ropewalks', 'Baltic Triangle'],
    'Bristol': ['City Centre', 'Clifton', 'Harbourside', 'Stokes Croft'],
    'Leeds': ['City Centre', 'Headingley', 'Holbeck', 'Chapel Allerton']
  },
  'germany': {
    'Berlin': ['Mitte', 'Kreuzberg', 'Friedrichshain', 'Charlottenburg', 'Neukölln', 'Prenzlauer Berg', 'Schöneberg'],
    'Munich': ['Altstadt', 'Schwabing', 'Maxvorstadt', 'Bogenhausen', 'Sendling'],
    'Frankfurt': ['Innenstadt', 'Westend', 'Sachsenhausen', 'Bornheim', 'Nordend'],
    'Hamburg': ['HafenCity', 'Altona', 'St Pauli', 'Eimsbüttel', 'Winterhude'],
    'Cologne': ['Altstadt', 'Neustadt', 'Ehrenfeld', 'Belgisches Viertel'],
    'Stuttgart': ['Stuttgart-Mitte', 'Stuttgart-Süd', 'Stuttgart-West', 'Bad Cannstatt'],
    'Dusseldorf': ['Altstadt', 'Stadtmitte', 'Medienhafen', 'Oberkassel']
  },
  'france': {
    'Paris': ['Le Marais', 'Montmartre', 'Saint-Germain-des-Prés', 'Champs-Élysées', 'Opéra', 'Bastille', 'Latin Quarter', 'La Défense'],
    'Lyon': ['Presqu\'île', 'Part-Dieu', 'Croix-Rousse', 'Vieux Lyon', 'Confluence'],
    'Marseille': ['Vieux-Port', 'Le Panier', 'La Joliette', 'Prado'],
    'Toulouse': ['Capitole', 'Carmes', 'Saint-Cyprien', 'Compans-Caffarelli'],
    'Nice': ['Vieux Nice', 'Promenade des Anglais', 'Cimiez', 'Port de Nice'],
    'Bordeaux': ['Hyper-Centre', 'Chartrons', 'Saint-Pierre', 'Bastide']
  },
  'italy': {
    'Rome': ['Centro Storico', 'Trastevere', 'Prati', 'Testaccio', 'Monti', 'EUR'],
    'Milan': ['Navigli', 'Brera', 'Porta Nuova', 'Duomo', 'Isola', 'Quadrilatero della Moda'],
    'Naples': ['Centro Storico', 'Vomero', 'Chiaia', 'Posillipo'],
    'Turin': ['Centro', 'Crocetta', 'San Salvario', 'Quadrilatero Romano'],
    'Florence': ['Centro Storico', 'Oltrarno', 'Santa Croce', 'San Marco'],
    'Bologna': ['Centro Storico', 'Saragozza', 'San Donato', 'Bolo-Mazzini'],
    'Venice': ['San Marco', 'Cannaregio', 'Dorsoduro', 'San Polo']
  },
  'spain': {
    'Madrid': ['Salamanca', 'Malasaña', 'Chueca', 'Chamberí', 'Sol', 'Retiro', 'Chamartín'],
    'Barcelona': ['Eixample', 'Gràcia', 'El Born', 'Gothic Quarter', 'Poblenou', 'Sarrià'],
    'Valencia': ['Ciutat Vella', 'Ruzafa', 'El Carmen', 'Eixample Valencia'],
    'Seville': ['Santa Cruz', 'Triana', 'Centro Sevilla', 'Nervión'],
    'Bilbao': ['Abando', 'Casco Viejo', 'Indautxu'],
    'Malaga': ['Centro Historico', 'La Malagueta', 'Soho Malaga']
  },
  'netherlands': {
    'Amsterdam': ['Centrum', 'Jordaan', 'De Pijp', 'Oud-Zuid', 'NDSM', 'Amsterdam-Oost', 'Zuidas'],
    'Rotterdam': ['Centrum', 'Kop van Zuid', 'Delfshaven', 'Kralingen'],
    'The Hague': ['Centrum', 'Scheveningen', 'Statenkwartier', 'Archipelbuurt'],
    'Utrecht': ['Binnenstad', 'Lombok', 'Wittevrouwen', 'Oost']
  },
  'switzerland': {
    'Zurich': ['Altstadt', 'Enge', 'Seefeld', 'Wiedikon', 'Zurich West'],
    'Geneva': ['Centre-Ville', 'Eaux-Vives', 'Plainpalais', 'Carouge'],
    'Basel': ['Grossbasel', 'Kleinbasel', 'St. Alban'],
    'Lausanne': ['Centre-Ville', 'Ouchy', 'Flon']
  },
  'ireland': {
    'Dublin': ['City Centre', 'Temple Bar', 'Docklands', 'Ballsbridge', 'Ranelagh', 'Drumcondra'],
    'Cork': ['City Centre', 'Blackrock', 'Douglas', 'Ballincollig'],
    'Galway': ['City Centre', 'Salthill', 'Claddagh']
  },
  'belgium': {
    'Brussels': ['Pentagone', 'Ixelles', 'Saint-Gilles', 'European Quarter', 'Uccle'],
    'Antwerp': ['Centrum', 'Zurenborg', 'Het Zuid', 'Eilandje'],
    'Ghent': ['Centrum', 'Patershol', 'Sint-Pieters']
  },
  'austria': {
    'Vienna': ['Innere Stadt', 'Neubau', 'Leopoldstadt', 'Mariahilf', 'Alsergrund', 'Landstraße'],
    'Graz': ['Innere Stadt', 'Geidorf', 'St. Leonhard'],
    'Salzburg': ['Altstadt', 'Andräviertel', 'Nonntal'],
    'Innsbruck': ['Altstadt', 'Wilten', 'Hötting']
  },
  'sweden': {
    'Stockholm': ['Norrmalm', 'Södermalm', 'Östermalm', 'Vasastan', 'Gamla Stan', 'Kungsholmen'],
    'Gothenburg': ['Innomstaden', 'Haga', 'Majorna', 'Linnéstaden'],
    'Malmo': ['Centrum', 'Västra Hamnen', 'Möllevången']
  },
  'norway': {
    'Oslo': ['Sentrum', 'Grünerløkka', 'Frogner', 'Majorstuen', 'Aker Brygge', 'Bjørvika'],
    'Bergen': ['Sentrum', 'Nordnes', 'Møhlenpris'],
    'Trondheim': ['Midtbyen', 'Bakklandet', 'Elgeseter']
  },
  'denmark': {
    'Copenhagen': ['Indre By', 'Vesterbro', 'Nørrebro', 'Østerbro', 'Frederiksberg', 'Christianshavn'],
    'Aarhus': ['Midtbyen', 'Trøjborg', 'Frederiksbjerg'],
    'Odense': ['Odense C', 'Skibhuse', 'Albanigade']
  },
  'finland': {
    'Helsinki': ['Kluuvi', 'Punavuori', 'Kallio', 'Töölö', 'Kamppi', 'Ullanlinna'],
    'Tampere': ['Keskusta', 'Pyynikki', 'Tammela'],
    'Turku': ['Keskusta', 'Portsa', 'Kupittaa']
  },
  'poland': {
    'Warsaw': ['Śródmieście', 'Mokotów', 'Wola', 'Żoliborz', 'Praga-Północ', 'Ujazdów'],
    'Krakow': ['Stare Miasto', 'Kazimierz', 'Podgórze', 'Grzegórzki'],
    'Wroclaw': ['Stare Miasto', 'Nadodrze', 'Krzyki'],
    'Gdansk': ['Główne Miasto', 'Wrzeszcz', 'Oliwa']
  },
  'portugal': {
    'Lisbon': ['Baixa', 'Chiado', 'Alfama', 'Bairro Alto', 'Parque das Nações', 'Belém', 'Principe Real'],
    'Porto': ['Ribeira', 'Baixa Porto', 'Foz do Douro', 'Boavista'],
    'Braga': ['Centro Historico', 'São Victor', 'Maximinos']
  },
  'greece': {
    'Athens': ['Syntagma', 'Plaka', 'Monastiraki', 'Kolonaki', 'Exarcheia', 'Koukaki', 'Glyfada'],
    'Thessaloniki': ['Kentrotiki', 'Ladadika', 'Ano Poli', 'Kalamaria'],
    'Heraklion': ['Centro Historico', 'Ammoudara', 'Knossos']
  },
  'czech-republic': {
    'Prague': ['Staré Město', 'Nové Město', 'Malá Strana', 'Vinohrady', 'Karlín', 'Žižkov', 'Smíchov'],
    'Brno': ['Brno-střed', 'Veveří', 'Žabovřesky'],
    'Ostrava': ['Moravská Ostrava', 'Poruba', 'Vítkovice']
  },
  'hungary': {
    'Budapest': ['Belváros', 'Lipótváros', 'Terézváros', 'Erzsébetváros', 'Várkerület', 'Újlipótváros'],
    'Debrecen': ['Belváros', 'Nagyerdő'],
    'Szeged': ['Belváros', 'Újszeged']
  },
  'romania': {
    'Bucharest': ['Centru Vechi', 'Dorobanți', 'Floreasca', 'Cotroceni', 'Piperă', 'Unirii'],
    'Cluj-Napoca': ['Centru', 'Gheorgheni', 'Mănăștur'],
    'Timisoara': ['Cetate', 'Iosefin', 'Elisabetin']
  },
  'bulgaria': {
    'Sofia': ['Center', 'Lozenets', 'Vitosha', 'Mladost', 'Oborishte'],
    'Plovdiv': ['Center', 'Kapana', 'Trakia'],
    'Varna': ['Center', 'Seaside Park', 'Asparuhovo']
  },
  'croatia': {
    'Zagreb': ['Donji Grad', 'Gornji Grad', 'Maksimir', 'Trešnjevka', 'Novi Zagreb'],
    'Split': ['Grad', 'Varoš', 'Bačvice', 'Spinut'],
    'Dubrovnik': ['Old Town', 'Lapad', 'Ploče'],
    'Rijeka': ['Centrum', 'Trsat', 'Kantrida']
  },
  'slovakia': {
    'Bratislava': ['Staré Mesto', 'Ružinov', 'Petržalka', 'Nové Mesto'],
    'Kosice': ['Staré Mesto', 'Sever', 'Západ']
  },
  'slovenia': {
    'Ljubljana': ['Center', 'Bežigrad', 'Šiška', 'Vič', 'Trnovo'],
    'Maribor': ['Center', 'Tabor', 'Koroška Vrata']
  },
  'estonia': {
    'Tallinn': ['Kesklinn', 'Vanalinn', 'Kalamaja', 'Kadriorg', 'Mustamäe', 'Pirita'],
    'Tartu': ['Kesklinn', 'Supilinn', 'Annelinn']
  },
  'lithuania': {
    'Vilnius': ['Senamiestis', 'Naujamiestis', 'Šnipiškės', 'Žirmūnai', 'Užupis'],
    'Kaunas': ['Senamiestis', 'Centras', 'Žaliakalnis']
  },
  'luxembourg': {
    'Luxembourg City': ['Ville Haute', 'Gare', 'Kirchberg', 'Limpertsberg', 'Grund', 'Clausen']
  },
  'cyprus': {
    'Nicosia': ['Old City', 'Engomi', 'Strovolos', 'Aglandjia'],
    'Limassol': ['City Centre', 'Germasogeia', 'Agios Tychonas'],
    'Paphos': ['Kato Paphos', 'Ktima', 'Universal']
  },
  'gibraltar': {
    'Gibraltar': ['Main Street', 'Ocean Village', 'Queensway Quay', 'Upper Town', 'South District']
  },
  'latvia': {
    'Riga': ['Vecrīga', 'Centrs', 'Pārdaugava', 'Teika', 'Mežaparks'],
    'Daugavpils': ['Centrs', 'Jaunbūve']
  },
  'liechtenstein': {
    'Vaduz': ['Stadtmitte', 'Ebenholz', 'Mühleholz']
  },
  'malta': {
    'Valletta': ['City Centre', 'St. Elmo', 'Barrakka'],
    'St. Julian\'s': ['Paceville', 'Spinola Bay', 'Ta\' Xbiex'],
    'Sliema': ['Tower Road', 'Tigné Point', 'Balluta Bay'],
    'Birkirkara': ['Ta\' Paris', 'Fleur-de-Lys']
  },

  // ── Asia & Middle East (Stripe Merchant Targets) ────────────
  'japan': {
    'Tokyo': ['Shinjuku', 'Shibuya', 'Ginza', 'Roppongi', 'Ikebukuro', 'Akihabara', 'Chiyoda', 'Minato', 'Shinagawa', 'Ebisu'],
    'Osaka': ['Umeda', 'Namba', 'Shinsaibashi', 'Dotonbori', 'Tennoji', 'Honmachi'],
    'Kyoto': ['Gion', 'Kawaramachi', 'Arashiyama', 'Higashiyama', 'Kyoto Station Area'],
    'Yokohama': ['Minato Mirai', 'Kannai', 'Motomachi', 'Chinatown Yokohama'],
    'Fukuoka': ['Hakata', 'Tenjin', 'Nakasu', 'Daimyo']
  },
  'hong-kong': {
    'Hong Kong': ['Central', 'Causeway Bay', 'Tsim Sha Tsui', 'Mong Kok', 'Wan Chai', 'Shatin', 'Admiralty', 'Sheung Wan']
  },
  'singapore': {
    'Singapore': ['Orchard', 'Tanjong Pagar', 'Bugis', 'Jurong East', 'Tampines', 'Woodlands', 'Novena', 'Marina Bay', 'Chinatown', 'Holland Village']
  },
  'malaysia': {
    'Kuala Lumpur': ['Bukit Bintang', 'KLCC', 'Bangsar', 'Mont Kiara', 'Cheras', 'Damansara', 'TTDI'],
    'Penang': ['George Town', 'Bayan Lepas', 'Batu Ferringhi', 'Gurney Drive'],
    'Johor Bahru': ['JB City Centre', 'Iskandar Puteri', 'Mount Austin', 'Tebrau']
  },
  'thailand': {
    'Bangkok': ['Sukhumvit', 'Silom', 'Siam', 'Thonglor', 'Sathorn', 'Ekkamai', 'Ari', 'Ratchada'],
    'Chiang Mai': ['Nimman', 'Old City Chiang Mai', 'Riverside Chiang Mai'],
    'Phuket': ['Patong', 'Phuket Town', 'Kata', 'Karon', 'Bang Tao']
  },
  'united-arab-emirates': {
    'Dubai': ['Downtown Dubai', 'Dubai Marina', 'JBR', 'Business Bay', 'Deira', 'Bur Dubai', 'Jumeirah', 'Palm Jumeirah', 'Al Barsha', 'DIFC'],
    'Abu Dhabi': ['Corniche', 'Al Reem Island', 'Yas Island', 'Al Khalidiya', 'Saadiyat Island'],
    'Sharjah': ['Al Majaz', 'Al Nahda Sharjah', 'Al Taawun']
  },

  // ── Oceania (Stripe Merchant Targets) ────────────────────────
  'australia': {
    'Sydney': ['Sydney CBD', 'Surry Hills', 'Bondi', 'Paddington', 'Chatswood', 'Parramatta', 'Manly', 'Newtown', 'Darlinghurst', 'North Sydney'],
    'Melbourne': ['Melbourne CBD', 'Southbank', 'Fitzroy', 'St Kilda', 'Carlton', 'Richmond', 'South Yarra', 'Docklands', 'Brunswick'],
    'Brisbane': ['Brisbane CBD', 'Fortitude Valley', 'South Brisbane', 'New Farm', 'West End Brisbane', 'Paddington Brisbane'],
    'Perth': ['Perth CBD', 'Subiaco', 'Fremantle', 'Leederville', 'Northbridge'],
    'Adelaide': ['Adelaide CBD', 'North Adelaide', 'Norwood', 'Glenelg']
  },
  'new-zealand': {
    'Auckland': ['Auckland CBD', 'Ponsonby', 'Newmarket', 'Parnell', 'Mount Eden', 'Takapuna', 'Grey Lynn'],
    'Wellington': ['Wellington CBD', 'Te Aro', 'Mount Victoria', 'Thorndon'],
    'Christchurch': ['Christchurch Central', 'Riccarton', 'Merivale', 'Cashmere']
  },

  // ── Africa (Stripe Merchant Targets) ─────────────────────────
  'ghana': {
    'Accra': ['Osu', 'Cantonments', 'Airport Residential Area', 'East Legon', 'Dzorwulu', 'Labone', 'Ridge', 'Adabraka'],
    'Kumasi': ['Adum', 'Ahodwo', 'Nhyiaeso', 'Asokwa', 'Bantama'],
    'Takoradi': ['Market Circle', 'Beach Road', 'Anaji'],
    'Tamale': ['Tamale Central', 'Lamashegu', 'Vittin'],
    'Tema': ['Community 1', 'Community 2', 'Community 6', 'Community 10'],
    'Cape Coast': ['Cape Coast Central', 'Kotokuraba', 'Pedu'],
    'Sekondi': ['Sekondi Central', 'Essikado', 'Ketan'],
    'Obuasi': ['Tutuka', 'Brahabebome', 'Anyinam'],
    'Madina': ['Madina Central', 'Zongo Junction', 'Social Welfare'],
    'Koforidua': ['Koforidua Central', 'Adweso', 'Effiduase']
  },
  'kenya': {
    'Nairobi': ['Westlands', 'Kilimani', 'Karen', 'Upper Hill', 'Nairobi CBD', 'Gigiri', 'Lavington', 'Parklands', 'Kileleshwa', 'Hurlingham'],
    'Mombasa': ['Nyali', 'Mombasa Island', 'Bamburi', 'Kizingo', 'Shanzu'],
    'Kisumu': ['Milimani Kisumu', 'Kisumu CBD', 'Kondele'],
    'Nakuru': ['Milimani Nakuru', 'Nakuru CBD', 'Section 58'],
    'Eldoret': ['Elgon View', 'Eldoret CBD', 'Pioneer'],
    'Thika': ['Thika CBD', 'Section 9', 'Ngoingwa'],
    'Malindi': ['Malindi Town', 'Casuarina', 'Shella'],
    'Kitale': ['Kitale CBD', 'Milimani Kitale'],
    'Garissa': ['Garissa Central', 'Bullas'],
    'Kakamega': ['Kakamega CBD', 'Milimani Kakamega']
  },
  'nigeria': {
    'Lagos': ['Ikeja', 'Victoria Island', 'Lekki Phase 1', 'Ikoyi', 'Yaba', 'Surulere', 'Maryland', 'Lekki', 'Ajah', 'Gbagada', 'Magodo', 'Marina'],
    'Abuja': ['Maitama', 'Wuse II', 'Garki', 'Asokoro', 'Jabi', 'Gwarinpa', 'Utako', 'Guzape'],
    'Port Harcourt': ['Old GRA', 'New GRA', 'Trans Amadi', 'D-Line', 'Peter Odili Road'],
    'Kano': ['Nasarawa Kano', 'Fagge', 'Dala', 'Kano City'],
    'Ibadan': ['Bodija', 'Dugbe', 'Ring Road Ibadan', 'Jericho Ibadan', 'Agodi'],
    'Benin City': ['GRA Benin', 'Ring Road Benin', 'Ugbowo'],
    'Kaduna': ['Kaduna North', 'Kaduna South', 'Barnawa', 'Malali'],
    'Enugu': ['Independence Layout', 'New Haven Enugu', 'GRA Enugu', 'Ogui'],
    'Owerri': ['Aladinma', 'Ikenegbu', 'New Owerri', 'World Bank Owerri'],
    'Onitsha': ['Onitsha Main', 'Fegge', 'GRA Onitsha', 'Woliwo']
  },
  'south-africa': {
    'Johannesburg': ['Sandton', 'Rosebank', 'Randburg', 'Midrand', 'Braamfontein', 'Fourways', 'Melville', 'Bryanston', 'Parkhurst'],
    'Cape Town': ['City Bowl', 'Camps Bay', 'Sea Point', 'Claremont', 'Green Point', 'V&A Waterfront', 'Gardens', 'Constantia'],
    'Durban': ['Umhlanga', 'Durban North', 'Morningside Durban', 'Glenwood', 'Westville', 'Florida Road'],
    'Pretoria': ['Pretoria Central', 'Menlyn', 'Brooklyn Pretoria', 'Hatfield', 'Centurion', 'Waterkloof'],
    'Gqeberha': ['Summerstrand', 'Walmer', 'Central Gqeberha', 'Mill Park'],
    'Bloemfontein': ['Westdene', 'Dan Pienaar', 'Brandwag', 'Bloemfontein Central'],
    'East London': ['Nahoon', 'Beacon Bay', 'Bunkers Hill', 'Vincent'],
    'Polokwane': ['Bendor', 'Sterpark', 'Polokwane Central'],
    'Nelspruit': ['Sonheuwel', 'West Acres', 'Steiltes'],
    'Sandton': ['Sandown', 'Morningside Sandton', 'Inanda', 'Riverclub']
  }
};

/**
 * Normalizes country input (name, alias, or ISO code) to standard key.
 * @param {string} country 
 * @returns {string}
 */
function normalizeCountryKey(country) {
  if (!country) return '';
  const key = String(country).trim().toLowerCase().replace(/\s+/g, '-');
  return COUNTRY_ALIASES[key] || key;
}

/**
 * Resolves country key for a city if country is unspecified.
 * @param {string} cityName
 * @returns {string|null}
 */
function findCountryForCity(cityName) {
  if (!cityName || typeof cityName !== 'string') return null;
  const nameLower = cityName.trim().toLowerCase();
  for (const [country, cities] of Object.entries(SPATIAL_GRID_MESH)) {
    for (const city of Object.keys(cities)) {
      if (city.toLowerCase() === nameLower) return country;
    }
  }
  return null;
}

/**
 * Generate fallback 5-sector cardinal spatial districts for any city.
 * @param {string} cityName 
 * @returns {string[]}
 */
function generateCardinalSectors(cityName) {
  return [
    `${cityName} Central`,
    `${cityName} North`,
    `${cityName} South`,
    `${cityName} East`,
    `${cityName} West`
  ];
}

/**
 * Retrieves sub-districts or cardinal sectors for a city in a country.
 * @param {string} countryName 
 * @param {string} cityName 
 * @param {boolean} [allowFallback=true] 
 * @returns {string[]}
 */
function getSubDistricts(countryName, cityName, allowFallback = true) {
  let normCountry = normalizeCountryKey(countryName);
  if (!normCountry || !SPATIAL_GRID_MESH[normCountry]) {
    const discoveredCountry = findCountryForCity(cityName);
    if (discoveredCountry) normCountry = discoveredCountry;
  }
  const countryMesh = SPATIAL_GRID_MESH[normCountry];
  
  if (countryMesh) {
    if (countryMesh[cityName] && countryMesh[cityName].length > 0) {
      return countryMesh[cityName];
    }
    const cityLower = cityName.toLowerCase();
    const matchedCityKey = Object.keys(countryMesh).find(k => k.toLowerCase() === cityLower);
    if (matchedCityKey && countryMesh[matchedCityKey].length > 0) {
      return countryMesh[matchedCityKey];
    }
  }

  if (allowFallback) {
    return generateCardinalSectors(cityName);
  }
  return [cityName];
}

/**
 * Alias helper function for getSubDistricts.
 * Returns sub-districts / neighborhood spatial grid mesh or 5-sector cardinal fallback.
 * @param {string} countryCode 
 * @param {string} city 
 * @returns {string[]}
 */
function getDistrictsForCity(countryCode, city) {
  return getSubDistricts(countryCode, city, true);
}

/**
 * Expands a macro city name into spatial sub-grid target query strings.
 * Formats sub-district string with city prefix if not already included.
 * @param {string} countryName 
 * @param {string} cityName 
 * @returns {string[]} E.g. ["Jakarta Kebayoran Baru", "Jakarta Senayan", ...]
 */
function expandCityQuery(countryName, cityName) {
  const subDistricts = getSubDistricts(countryName, cityName, true);
  return subDistricts.map(sd => {
    if (sd.toLowerCase().includes(cityName.toLowerCase())) {
      return sd;
    }
    return `${cityName} ${sd}`;
  });
}

/**
 * Calculates spatial grid coverage statistics across all configured mesh countries.
 * @returns {object} { totalCountries, totalCities, totalMappedCities, totalSubDistricts, totalDistricts }
 */
function getSpatialMeshStats() {
  const totalCountries = Object.keys(SPATIAL_GRID_MESH).length;
  let totalMappedCities = 0;
  let totalSubDistricts = 0;

  for (const country of Object.values(SPATIAL_GRID_MESH)) {
    const cities = Object.keys(country);
    totalMappedCities += cities.length;
    for (const dists of Object.values(country)) {
      totalSubDistricts += dists.length;
    }
  }

  return {
    totalCountries,
    totalCities: totalMappedCities,
    totalMappedCities,
    totalSubDistricts,
    totalDistricts: totalSubDistricts
  };
}

module.exports = {
  SPATIAL_GRID_MESH,
  COUNTRY_ALIASES,
  normalizeCountryKey,
  findCountryForCity,
  generateCardinalSectors,
  getSubDistricts,
  getDistrictsForCity,
  expandCityQuery,
  getSpatialMeshStats
};
