# HTML-CHANGES.md

## Purpose

This spec lists every `src` / `href` / `og:image` URL in the portfolio HTML that needs to change so the site keeps pointing at R2 after the filename-normalization pass (Stage 3).

**Hand this file to the other Claude chat that is editing the HTML** so its build uses the normalized filenames. The R2 rename job runs against Sam's R2 bucket directly — this file covers only the matching HTML-side edits.

## Normalization rules (for context)

- spaces and `+` → `-`
- remove `(`, `)`, `[`, `]`
- `.MP4` → `.mp4` (extension only — preserves stem case)
- non-ASCII → ASCII (`Í` → `I`, etc.)
- collapse consecutive `-` into one
- preserve trailing dots (e.g. `S.W.A.G.` stays intact)
- folder rename: `Hulu + Live TV/` → `Hulu-Live-TV/` (affects URLs that route through that folder)

## How to apply

Each section below is one HTML file. Under each file, do a literal `str_replace` from **OLD** → **NEW**. The OLD/NEW strings are exact: they already contain the URL encoding (`%20`, `%C3%8D`, etc.) as it appears in the current HTML source, and the NEW strings are clean ASCII with no encoding.

Every OLD string below is unique within its file, so `str_replace` should work without extra context.

## Summary

| File | Edits |
|---|---|
| `content-pages/brands.html` | 2 |
| `content-pages/digital.html` | 1 |
| `index.html` | 2 |
| `project-pages/project-aok.html` | 2 |
| `project-pages/project-bytesyzetv.html` | 3 |
| `project-pages/project-discod.html` | 1 |
| `project-pages/project-giphy-ads.html` | 1 |
| `project-pages/project-giphy-artist-commissions.html` | 4 |
| `project-pages/project-giphy-partnerships.html` | 2 |
| `project-pages/project-giphy-stamps.html` | 8 |
| `project-pages/project-giphy-studios.html` | 3 |
| `project-pages/project-influence.html` | 1 |
| `project-pages/project-kamk.html` | 14 |
| `project-pages/project-pln.html` | 3 |
| `project-pages/project-usc.html` | 1 |
| `project-pages/project-zips.html` | 1 |
| **Total** | **49** |

---

## `content-pages/brands.html`

_2 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Giphy-Ads/Hulu%20%2B%20Live%20TV/Hulu%20Live%20Tv%20GIF%20by%20HULU.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu-Live-Tv-GIF-by-HULU.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4
```

---

## `content-pages/digital.html`

_1 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.mp4
```

---

## `index.html`

_2 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/About/How%20Ya%20Doing%20Its%20Me%20GIF.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/About/How-Ya-Doing-Its-Me-GIF.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Giphy-Ads/Hulu%20%2B%20Live%20TV/Hulu%20Live%20Tv%20GIF%20by%20HULU.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu-Live-Tv-GIF-by-HULU.mp4
```

---

## `project-pages/project-aok.html`

_2 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/USC/CHELSEA%20JOHNSON.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/USC/CHELSEA-JOHNSON.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.mp4
```

---

## `project-pages/project-bytesyzetv.html`

_3 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.mp4
```

### Edit 3

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.mp4
```

---

## `project-pages/project-discod.html`

_1 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4
```

---

## `project-pages/project-giphy-ads.html`

_1 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4
```

---

## `project-pages/project-giphy-artist-commissions.html`

_4 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Artist-Commissions/FELIZ-D%C3%8DA-DEL-PADRE-Cecilia%20Quispe.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DIA-DEL-PADRE-Cecilia-Quispe.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR%20(1).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.mp4
```

### Edit 3

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.mp4
```

### Edit 4

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.mp4
```

---

## `project-pages/project-giphy-partnerships.html`

_2 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Partnerships/Dog%20Show%20Smile%20GIF%20by%20NBC.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Partnerships/Lego%20GIF%20by%20Fortnite.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.mp4
```

---

## `project-pages/project-giphy-stamps.html`

_8 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.mp4
```

### Edit 3

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.mp4
```

### Edit 4

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.mp4
```

### Edit 5

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.mp4
```

### Edit 6

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.mp4
```

### Edit 7

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.mp4
```

### Edit 8

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/USC/CHELSEA%20JOHNSON.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/USC/CHELSEA-JOHNSON.mp4
```

---

## `project-pages/project-giphy-studios.html`

_3 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo%20Finde%20GIF%20by%20Sealed%20With%20A%20GIF.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami%20Dolphins%20Sport%20GIF%20by%20Sealed%20With%20A%20GIF.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.mp4
```

### Edit 3

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia%20Eagles%20Sport%20GIF%20by%20Sealed%20With%20A%20GIF.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.mp4
```

---

## `project-pages/project-influence.html`

_1 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Influence/Influence%20Cover%20Art%20Billing%20Poster.png
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Influence/Influence-Cover-Art-Billing-Poster.png
```

---

## `project-pages/project-kamk.html`

_14 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/USC/CHELSEA%20JOHNSON.mp4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Digital-Content/USC/CHELSEA-JOHNSON.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025%20(1).png
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025-1.png
```

### Edit 3

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.mp4
```

### Edit 4

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.mp4
```

### Edit 5

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.mp4
```

### Edit 6

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.mp4
```

### Edit 7

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.mp4
```

### Edit 8

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.mp4
```

### Edit 9

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.mp4
```

### Edit 10

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.mp4
```

### Edit 11

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.mp4
```

### Edit 12

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.mp4
```

### Edit 13

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.mp4
```

### Edit 14

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/strip/ByteSyze_Subway-Takes_Rosalia.mp4
```

---

## `project-pages/project-pln.html`

_3 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4
```

### Edit 2

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.mp4
```

### Edit 3

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.mp4
```

---

## `project-pages/project-usc.html`

_1 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4
```

---

## `project-pages/project-zips.html`

_1 edit(s)_

### Edit 1

**OLD:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4
```

**NEW:**
```
pub-3b296e40628b4f9dbbb389024b171552.r2.dev/images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4
```

---

## After edits

1. Commit the HTML changes with a message like: `chore(r2): rename-safe URLs after filename normalization pass`
2. No local-file rename is needed on your end — Sam is running the local + R2 rename scripts separately.
3. Once both your edits and his rename scripts have landed, the next deploy to Cloudflare Pages will pick up the new URLs, and the R2 objects will already be there under the new keys.

## Verification

After applying, run this in the project root to confirm no stray old-format URLs remain:

```bash
grep -rE '\.MP4|%20|%2B|%C3%' *.html content-pages/ project-pages/
```

Expected result: no matches (except any that are intentionally not being renamed — there shouldn't be any in this scope).
