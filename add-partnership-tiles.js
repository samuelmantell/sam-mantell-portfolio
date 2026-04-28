/**
 * add-partnership-tiles.js
 * ─────────────────────────────────────────────────────────────
 * Adds new video tiles to the masonry grid in
 * project-giphy-partnerships.html (or any project file you point it at).
 *
 * HOW TO USE
 * 1. Drop this file in your project root (same level as index.html).
 * 2. Fill in the TILES array below — one object per MP4.
 * 3. Run:  node add-partnership-tiles.js
 * 4. Commit & push as normal.
 * ─────────────────────────────────────────────────────────────
 */

const fs   = require('fs');
const path = require('path');

// ── CONFIG ────────────────────────────────────────────────────
// Path to the HTML file you want to update (relative to this script)
const HTML_FILE = 'project-pages/project-giphy-partnerships.html';

// R2 base URL — already used on the page
const R2 = 'https://pub-3b296e40628b4f9dbbb389024b171552.r2.dev';

// R2 folder where your new MP4s live
const R2_FOLDER = 'images/Branded-Content/Partnerships';

// ── ADD YOUR NEW TILES HERE ───────────────────────────────────
// title    → appears in the label block (bold line)
// sub      → smaller line below it (publisher / show / brand)
// filename → exact filename in R2, including extension
//            (spaces are fine — the script will URL-encode them)
const TILES = [
  {
    title:    'Coffee Time',
    sub:      'Girl Night Stand',
    filename: 'Coffee-Time-GIF-by-GirlNightStand.mp4',
  },
  {
    title:    'White Lotus S2',
    sub:      'HBO',
    filename: 'Excited-Happy-New-Year-GIF-by-HBO.mp4',
  },
  {
    title:    'Portrait of a Lady on Fire',
    sub:      'NEON',
    filename: 'Sad-Portrait-Of-A-Lady-On-Fire-GIF-by-NEON.mp4',
  },
  {
    title:    'Match Me in Miami',
    sub:      'The Roku Channel',
    filename: 'Season-1-Dancing-GIF-by-The-Roku-Channel.mp4',
  },
  {
    title:    'Honest Renovations',
    sub:      'The Roku Channel',
    filename: 'Jessica-Alba-Drinking-GIF-by-The-Roku-Channel.mp4',
  },
  {
    title:    'Kinda Sus',
    sub:      'Uncle Roger',
    filename: 'Fried-Rice-Cooking-GIF-by-Nigel-Ng-(Uncle-Roger).mp4',
  },
  {
    title:    'The Great American Baking Show',
    sub:      'The Roku Channel',
    filename: 'Pumped-Up-Smile-GIF-by-The-Roku-Channel.mp4',
  },
  {
    title:    'I See You',
    sub:      'US Open',
    filename: 'I-See-You-Win-GIF-by-US-Open.mp4',
  },
  {
    title:    'Puppy Interviews',
    sub:      'BuzzFeed',
    filename: 'Sad-Oh-No-GIF-by-BuzzFeed.mp4',
  },
  {
    title:    'Vienna Blood',
    sub:      'PBS',
    filename: 'Season-3-Ok-GIF-by-PBS.mp4',
  },
  {
    title:    'No Objections',
    sub:      'James Bond 007',
    filename: 'Sean-Connery-GIF-by-James-Bond-007.mp4',
  },
  {
    title:    'Next Level Chef',
    sub:      'FOX',
    filename: 'Gordon-Ramsay-Omg-GIF-by-Next-Level-Chef.mp4',
  },
];
// ─────────────────────────────────────────────────────────────

// Build the HTML snippet for a single tile
function buildTile({ title, sub, filename }) {
  const encoded = filename.split('/').map(encodeURIComponent).join('/');
  const src = `${R2}/${R2_FOLDER}/${encoded}`;
  return `    <div class="tile"><div class="tile-inner"><video autoplay loop muted playsinline title="${title}" src="${src}"></video><div class="tile-overlay"><div class="tile-label-block"><span class="tile-title">${title}</span><span class="tile-sub">${sub}</span></div></div></div></div>`;
}

// ── MAIN ──────────────────────────────────────────────────────
const filePath = path.resolve(__dirname, HTML_FILE);

if (!fs.existsSync(filePath)) {
  console.error(`✗ File not found: ${filePath}`);
  process.exit(1);
}

let html = fs.readFileSync(filePath, 'utf8');

// Find the closing tags for the masonry grid
const MARKER = '  </div></div>';  // closing </div></div> of .masonry-grid + .grid-wrap
const insertAt = html.indexOf(MARKER);

if (insertAt === -1) {
  console.error('✗ Could not find grid closing tags. Check that the marker line exists unchanged.');
  process.exit(1);
}

const newTiles = TILES.map(buildTile).join('\n');
html = html.slice(0, insertAt) + newTiles + '\n' + html.slice(insertAt);

fs.writeFileSync(filePath, html, 'utf8');

console.log(`✓ Added ${TILES.length} tile(s) to ${HTML_FILE}`);
TILES.forEach(t => console.log(`  · ${t.title} — ${t.filename}`));
