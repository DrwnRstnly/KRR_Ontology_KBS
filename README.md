# Sistem Berbasis Pengetahuan Clash Royale

Sistem representasi pengetahuan dan penalaran komprehensif untuk analisis deck Clash Royale, menampilkan representasi berbasis aturan Prolog dan ontologi OWL.

## Gambaran Umum

Proyek ini mengimplementasikan sistem berbasis pengetahuan yang menganalisis deck Clash Royale, mengidentifikasi klasifikasi archetype dan memberikan peringatan strategis berdasarkan komposisi deck. Sistem ini menggunakan:

- **Prolog** untuk penalaran berbasis aturan dan analisis deck
- **OWL/RDF** untuk representasi pengetahuan ontologi
- **Utilitas Python** untuk scraping data dan konversi format

## Fitur

- **Analisis Deck**: Menganalisis deck Clash Royale berisi 8 kartu untuk kekuatan dan kelemahan strategis
- **Klasifikasi Archetype**: Mengklasifikasikan deck secara otomatis ke dalam archetype (Siege, Bait, Bridge Spam, Cycle, Beatdown)
- **Peringatan Strategis**: Memberikan peringatan umum dan spesifik archetype tentang komposisi deck
- **Dukungan Multi-Format**: Data kartu tersedia dalam format Prolog, OWL/RDF (TTL), dan JSON

## Struktur Proyek

```
.
├── ontology/
│   ├── clashroyale-ontology.ttl    # Representasi ontologi Turtle/RDF
│   └── clashroyale-ontology.rdf    # Representasi ontologi RDF/XML
├── prolog/
│   ├── main.pl                      # Interface utama Prolog
│   ├── rules.pl                     # Aturan penalaran dan logika analisis deck
│   └── cards.pl                     # Database fakta kartu
├── utils/
│   ├── scraper.py                   # Web scraper untuk data kartu Clash Royale
│   ├── convert_to_pl.py             # Konverter JSON ke Prolog
│   └── convert_to_ttl.py            # Konverter JSON ke Turtle/RDF
├── deckshop_cards.json              # Data kartu dari DeckShop
├── fandom_arenas_cards.json         # Data kartu dengan informasi arena
└── fandom_cards_flat.csv            # Data kartu dalam format flat
```

## Instalasi

### Prasyarat

- **SWI-Prolog** (untuk menjalankan analisis berbasis Prolog)
- **Python 3.7+** (untuk utilitas)
- Package Python: `beautifulsoup4`, `requests`, `rdflib` (install melalui `pip install -r requirements.txt`)

### Setup

1. Clone repository ini
2. Install dependensi Python:
   ```bash
   pip install beautifulsoup4 requests rdflib
   ```
3. Pastikan SWI-Prolog terinstall dan dapat diakses dari command line

## Cara Penggunaan

### Analisis Deck (Prolog)

Jalankan deck analyzer interaktif:

```bash
cd prolog
swipl -s main.pl
```

Kemudian mulai analyzer:

```prolog
?- start.
```

Ikuti petunjuk untuk memasukkan 8 nama kartu (gunakan underscore untuk spasi, contoh: `mini_p_e_k_k_a`).

**Contoh Sesi:**
```
Welcome to the Clash Royale Deck Analyzer!
Please enter your 8 card names, one per line.
---
Enter card 1: knight
Enter card 2: archers
Enter card 3: arrows
Enter card 4: fireball
Enter card 5: musketeer
Enter card 6: mini_p_e_k_k_a
Enter card 7: giant
Enter card 8: zap
---
Deck accepted. Analyzing...
Analyzing deck: [knight,archers,arrows,fireball,musketeer,mini_p_e_k_k_a,giant,zap]
---
Deck Archetype: beatdown
Average Elixir: 3.5

--- General Warnings ---
- Weak Warning: No building - Harder to defend and control tempo.
...
```

### Query Informasi Kartu

Query informasi kartu individual:

```prolog
?- info(knight).
Card: knight
Type: troop
Rarity: common
Elixir: 3
HP: 1766
Damage: 202
Speed: medium
```

### Utilitas Data

#### Scrape Data Kartu Terbaru
```bash
python utils/scraper.py
```

#### Konversi JSON ke Prolog
```bash
python utils/convert_to_pl.py
```

#### Konversi JSON ke OWL/Turtle
```bash
python utils/convert_to_ttl.py
```

## Archetype Deck

Sistem mengklasifikasikan deck ke dalam archetype berikut:

1. **Siege**: Deck yang menampilkan X-Bow atau Mortar sebagai win condition
2. **Bait**: Deck dengan 3+ kartu bait (troop/spell HP rendah)
3. **Bridge Spam**: Deck dengan 3+ kartu pressure agresif
4. **Cycle**: Deck cepat dengan rata-rata elixir ≤ 3.0
5. **Beatdown**: Deck push berat dengan tank (HP > 3000)
6. **No Archetype**: Deck yang tidak sesuai dengan kategori di atas

## Kategori Peringatan

### Peringatan Umum

**Peringatan Kuat (Strong Warnings):**
- Tidak ada win condition
- Tidak ada pertahanan udara
- Tidak ada spell
- Terlalu banyak win condition (> 2)
- Terlalu mahal (rata-rata ≥ 4.8 elixir)
- Tidak ada opsi anti-tank

**Peringatan Lemah (Weak Warnings):**
- Tidak ada small spell
- Tidak ada building
- Hanya 1 pertahanan udara
- Tidak ada kartu reset
- Tidak ada tank/mini-tank
- Dan lainnya...

### Peringatan Spesifik Archetype

Setiap archetype memiliki peringatan yang disesuaikan. Contoh:

**Peringatan Siege:**
- Tidak ada building killer spell
- Tidak ada secondary defensive building
- Rata-rata elixir > 3.8

**Peringatan Beatdown:**
- Tidak ada ranged troops
- Terlalu murah (rata-rata < 3.5)
- Tidak ada Elixir Collector saat mahal (rata-rata ≥ 4.3)

## Struktur Ontologi

Ontologi OWL (`clashroyale-ontology.ttl`) mendefinisikan:

### Classes
- `Card` (superclass)
  - `Troop`
  - `Building`
  - `Spell`
  - `TowerTroop`
- `Rarity`: Common, Rare, Epic, Legendary, Champion
- `Arena`: Training Camp hingga Silent Sanctuary
- `TargetType`: Ground, Air, GroundAndAir, BuildingsOnly
- `DamageType`: SpellDamage, AreaDamage, Melee, Ranged

### Properties

**Object Properties:**
- `hasRarity`
- `inArena`
- `hasTargetType`
- `hasDamageType`

**Datatype Properties:**
- `elixirCost`
- `hitpoints`
- `damage`
- `dps`
- `radius`
- `range`
- `count`
- `hasSplash`

## Format Data Kartu

Kartu direpresentasikan dengan berbagai atribut:

```turtle
:knight a :Troop ;
  rdfs:label "Knight" ;
  :hasRarity :Common ;
  :inArena :training_camp ;
  :hasTargetType :Ground ;
  :elixirCost 3 ;
  :hitpoints 1766 ;
  :damage 202 ;
  :dps 168 ;
  :hasSplash false .
```

## Kontribusi

Silakan berkontribusi dengan:
- Menambahkan aturan penalaran baru
- Meningkatkan klasifikasi archetype
- Memperbarui data kartu
- Meningkatkan pesan peringatan

## Teknologi yang Digunakan

- **Prolog (SWI-Prolog)**: Sistem penalaran berbasis aturan
- **Python**: Scraping dan konversi data
- **RDF/OWL**: Representasi pengetahuan ontologi
- **BeautifulSoup4**: Web scraping
- **RDFLib**: Manipulasi RDF/OWL

## Sumber Data

Data kartu bersumber dari:
- Clash Royale Fandom Wiki
- DeckShop.pro
- RoyaleAPI.com

**Catatan**: Statistik kartu berdasarkan standar turnamen Level 11 dan dapat berubah seiring pembaruan game.
