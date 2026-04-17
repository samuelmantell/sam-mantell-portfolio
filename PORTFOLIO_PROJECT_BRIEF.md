# Sam Mantell Portfolio — Project Brief
**sammantell.com** | Creative Producer & Project Manager

---

## Who Sam Is

Sam Mantell is a Creative Producer & Project Manager with 15+ years of experience. His portfolio targets brand marketing directors, platform executives, and agency producers. He is also positioning for project management roles at AI companies.

**Client & project history:** Giphy Studios, T-Mobile, NBC, Hot Ones, Complex, Epic Games, ByteSyzeTV — and originals *Disco'd*, *Zips*, and *Kaleb & Ms. Kelsey*.

**Sam is not a developer.** Translate his plain-language requests into finished code. Make the right design call and explain it in one sentence. Don't ask him to make decisions he shouldn't need to make.

---

## Stack & Infrastructure

| Layer | Detail |
|---|---|
| Code | Plain HTML / CSS / JS — no framework |
| Local dev | VS Code + Live Server |
| Hosting | Netlify (auto-deploy via GitHub push) |
| DNS | Wix |
| Media CDN | Cloudflare R2 |
| R2 base URL | `https://pub-3b296e40628b4f9dbbb389024b171552.r2.dev` |
| R2 bucket name | `portfolio-videos` |
| Deploy command | `git add . && git commit -m "message" && git push` |

**Never use Netlify CLI direct-deploy. Never use Wrangler without `--remote` or uploads silently go to local storage.**

---

## File Structure

All source files live flat in the project root. Netlify deploys them to subdirectories.

```
root/
├── index.html                  ← homepage AND design authority
├── resume-creative.html
├── brands.html    → deploys to content-pages/brands.html
├── digital.html   → deploys to content-pages/digital.html
├── original.html  → deploys to content-pages/original.html
└── project-*.html → deploys to project-pages/project-*.html
```

**Path rules (critical):**
- Links from `brands/digital/original.html` → use `../index.html` and `../project-pages/project-X.html`
- Links from `project-*.html` → use `../index.html` and `../content-pages/brands.html` etc.
- Folder/path names with spaces break browser routing — always use hyphens

---

## Design System (Canonical — index.html is the authority)

| Token | Value | Usage |
|---|---|---|
| `--bg` | `#ECEAF4` | Page background (opal/lavender) |
| `--bg2` | `#E3E0EF` | Secondary surfaces |
| `--bg3` | `#D8D4E8` | Tertiary surfaces |
| `--text` | `#1E1C2C` | Primary text |
| `--dim` | `#524E64` | Secondary text |
| `--muted` | `#8A8698` | Muted/label text |
| `--accent` | `#7C5CBF` | Violet — ALL interactive elements, stats, highlights |
| `--glass-nav` | `rgba(236,234,244,0.62)` | Nav background |
| `#2E2150` | Dark violet | Display headings only (hero title, category labels) — intentional, not a bug |

**Never use `#1DACD6` or `#066f8f` anywhere — these are not in the design system.**

**Fonts:** Playfair Display 700 (`--fd`) for headings/display · DM Sans (`--fb`) for body
**Buttons:** No border-radius — sharp edges only
**Ambient glows:** Rose radial `rgba(185,55,100,0.48)` + violet radial `rgba(95,45,195,0.40)` — fixed behind all content via `body::before`
**Glass nav:** `backdrop-filter: blur(28px) saturate(1.6)`

**CSS root block (canonical):**
```css
:root {
  --bg:#ECEAF4; --bg2:#E3E0EF; --bg3:#D8D4E8;
  --text:#1E1C2C; --dim:#524E64; --muted:#8A8698;
  --accent:#7C5CBF; --accent-dim:rgba(124,92,191,0.18);
  --border:rgba(124,92,191,0.16); --border-pale:rgba(100,80,160,0.12);
  --glass-nav:rgba(236,234,244,0.62);
  --fd:'Playfair Display',serif; --fb:'DM Sans',sans-serif;
}
```

---

## Homepage (`index.html`) Structure

**Nav anchors:**
- `#home` → hero strip
- `#portfolio` → three-category project grid
- `#about` → about section (directly below hero)
- `#contact` → "Let's Work Together" CTA

**Hero film strip:**
- R2 base URL variable: `const R2 = "https://pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/";`
- IShowSpeed clip uses a full individual R2 path and cannot use the `R2` shorthand variable
- Dot pagination indicators on carousels, synced with arrow navigation

**About section** (`<section class="about-section" id="about">`):
- Headline: "Producer & Project Manager"
- Photo: 400×400px
- Bio at 1.3rem / max-width 900px
- Stats use `var(--accent)` at 3rem with labels at 1rem
- Stats: **15+ Years · 200K+ Assets · 20B+ Views · 6 Languages**

**Favicon:** Inline SVG — SM initials in `#7C5CBF` on `#ECEAF4` background

---

## Project Page Inventory & Layout Patterns

| Page | Layout | Notes |
|---|---|---|
| `project-discod.html` | Film — dark hero + 4-col grid + poster | Feature Documentary |
| `project-influence.html` | Film — dark hero + 4-col grid | Feature Film |
| `project-zips.html` | Film — dark hero + 4-col grid | Short Film |
| `project-kamk.html` | Series — 40/60 split, vertical video left | 11 videos in JS array, fully populated |
| `project-bytesyzetv.html` | Series — 40/60 split, vertical video left | JS video array populated |
| `project-pln.html` | Series — 40/60 split, vertical video left | 5 videos in JS array; **credits block HTML still missing** |
| `project-aok.html` | YouTube gallery — dark hero iframe carousel | iframe src set by JS |
| `project-usc.html` | YouTube gallery — dark hero iframe carousel | iframe src set by JS |
| `project-giphy-artist-commissions.html` | Masonry grid | GIF/video tiles |
| `project-giphy-stamps.html` | Masonry grid | GIF/video tiles |
| `project-giphy-studios.html` | Masonry grid | GIF/video tiles |
| `project-giphy-partnerships.html` | Masonry grid | GIF/video tiles |
| `project-giphy-ads.html` | Per-campaign carousels | Brands: ABC, Hulu, Starbucks, Pure Leaf |
| `project-giphy-livegif.html` | Per-campaign carousels | Live GIF work |
| `project-giphy-umbrella.html` | Hub — 3×2 grid linking all 6 Giphy sub-pages | Stats bar: 200K+ assets managed, 15K+ built, 20B+ views, 552M+ impressions. Back → `content-pages/digital.html` |

**All project pages include:** More Work section at bottom (3 cards)

**Note on empty `src=""` attributes:** Video `<source>` elements and YouTube iframes intentionally start empty — JavaScript populates them on load from a `vids` array. This is correct behavior, not a bug.

---

## Category Pages

| Page | Deploys to |
|---|---|
| `brands.html` | `content-pages/brands.html` |
| `digital.html` | `content-pages/digital.html` |
| `original.html` | `content-pages/original.html` |

---

## Open Issues (as of April 2026)

- `project-pln.html` — credits block CSS exists but no HTML in body. Needs credits populated (client, agency, role, talent, etc.) once Sam provides the details.

---

## Immutable Rules

### Cloudflare contamination rule
**Never download files from the live site back to local.** Cloudflare injects an email-obfuscation script into any file containing a `mailto:` link, splitting `<script>` tags and breaking JavaScript. Always work from local source files. Never re-download from the live URL.

### mailto rule
Never deliver files containing raw `mailto:` addresses. Assemble the email address via JavaScript (e.g. `['sam', '@', 'domain.com'].join('')`) to prevent Cloudflare injection.

### Editing rule
Prefer targeted `str_replace` edits over full file replacement when a working local file exists. Always read the relevant file before making any edit — never guess at existing code.

### YouTube embeds
Use the short alphanumeric video ID only — never the full URL, never anything after a `&` parameter. YouTube Error 153 on localhost is a domain restriction — resolves once live on custom domain.

### Wrangler / R2
Always append `--remote` to every Wrangler command or uploads silently go to local storage. No native `--recursive` flag — use a shell `find` loop.

### Masonry JS
- Listen for `loadeddata` and `loadedmetadata` on videos; run a retry burst for silently-loading GIFs
- Grids use `grid-auto-rows: 2px` with JS measuring rendered height
- `tile-wide` (2-column-spanning) causes layout gaps — downgrade to `tile-landscape` when this occurs

### Branding rule
Frame brand work as "produced campaigns at [Company] for clients including..." — don't claim direct client relationships Sam didn't have.

### NFL asset
Tile filename is `NFL-live-gif-01.gif` — do not rename.

---

## Task Management (Notion)

Database: **🌐 Portfolio Website — Tasks**
Collection URL: `collection://59196d8a-039e-46e1-85a2-35c46f81e72d`

**Workflow:**
1. Search tasks via `notion-search` with `data_source_url: collection://59196d8a-039e-46e1-85a2-35c46f81e72d`
2. Fetch individual ticket via `notion-fetch` using page UUID
3. Mark done via `notion-update-page` with `properties: {'Status': 'Done'}`

Reference task IDs (T[X].01 format) when completing work.

---

## Copy Philosophy

- Tight, confident, specifics-first
- No resume-style bullet lists on the portfolio site
- No role title badges or chronologies
- Named partners, ownership language, and concrete scale figures preferred over vague descriptions
- Show visual samples before implementing large structural changes — Sam confirms direction before files are built

---

## Resume

`resume-creative.html` — matches portfolio glass nav, all experience shown by default, email assembled via JavaScript, no phone number on public page.
