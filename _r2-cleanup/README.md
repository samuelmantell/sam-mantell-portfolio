# R2 cleanup — Stage 3 package

This folder contains everything for the final stage of the R2 cleanup: compressing the biggest MP4s, normalizing filenames, and updating the HTML that points at them.

## What's here

```
_r2-cleanup/
├── README.md                      ← this file
├── compressed/                    ← 22 re-encoded MP4s, same folder layout as /images/
│   └── images/...
├── scripts/
│   ├── 01-upload-posters.sh       ← [already run, Stage 2a]
│   ├── 02-delete-gifs.sh          ← [already run, Stage 2b]
│   ├── 03-rename-local.sh         ← rename 1 folder + 74 files on disk
│   ├── 04-sync-r2-renames.sh      ← mirror those renames on R2
│   └── 05-deploy-compressed.sh    ← push compressed MP4s to local + R2
└── specs/
    └── HTML-CHANGES.md            ← hand this to the other Claude chat
```

## Compression results

Re-encoded at `libx264 -preset fast -crf 26` (veryfast for the 3 longest clips). Total: **~895 MB → ~204 MB (77% reduction)**. Best wins:

| File | Before | After | Savings |
|---|---|---|---|
| TMO_PLN_image-highlight.mp4 | 78 MB | 3.8 MB | 95% |
| ZIPS Teaser Vertical V3_3.mp4 | 74 MB | 5.5 MB | 93% |
| ByteSyze_Subway-Takes_Rosalia_1x1.mp4 | 29 MB | 1.5 MB | 95% |
| originals-kamk-ghosted.MP4 | 40 MB | 6.7 MB | 84% |
| originals-kamk-trauma-bond.MP4 | 44 MB | 6.8 MB | 85% |
| (16 more, ~80% average) | | | |

All 22 files passed ffprobe validation after encode.

## Order of operations

**IMPORTANT:** the other Claude chat has to apply `HTML-CHANGES.md` before you run the rename scripts, otherwise the HTML and the renamed files will be out of sync for a deploy. Compression deploy is independent and can go first.

```
Step 1 — hand HTML-CHANGES.md to the other chat
        └─ it str_replaces 49 R2 URLs across 16 HTML files, commits.

Step 2 — run 05-deploy-compressed.sh
        └─ replaces local files in-place + overwrites matching R2 keys.
           Uses the CURRENT (pre-rename) filenames, so this runs before 03.

Step 3 — run 03-rename-local.sh
        └─ renames 1 folder and 74 files on disk to the normalized form.

Step 4 — run 04-sync-r2-renames.sh
        └─ uploads the renamed local files back to R2 under the new keys,
           then deletes the old keys.

Step 5 — commit + `git push` (triggers Cloudflare Pages deploy).
```

## Running the scripts

All scripts expect to be run from the project root (`~/Desktop/my-portfolio`). They print a DRY_RUN-friendly trace and refuse to run if `./images/` isn't present.

```bash
cd ~/Desktop/my-portfolio

# Step 2 — compressed MP4 deploy (local + R2)
bash _r2-cleanup/scripts/05-deploy-compressed.sh
# Options:
#   DRY_RUN=1  — prints commands but doesn't execute
#   LOCAL_ONLY=1 — skip R2 upload (replaces local files only)
#   R2_ONLY=1   — skip local replace (overwrites R2 only)

# Step 3 — normalize local filenames
bash _r2-cleanup/scripts/03-rename-local.sh

# Step 4 — mirror renames to R2
bash _r2-cleanup/scripts/04-sync-r2-renames.sh
# Options:
#   DRY_RUN=1
```

## Normalization rules (applied to filenames)

- spaces and `+` → `-`
- remove `(`, `)`, `[`, `]`
- `.MP4` → `.mp4` (extension only — stem case preserved)
- non-ASCII → ASCII fold (`Í` → `I`, etc.)
- collapse consecutive `-` into one
- preserve trailing dots (e.g. `S.W.A.G.` stays intact)
- one folder rename: `Hulu + Live TV/` → `Hulu-Live-TV/`

## HTML change spec (`specs/HTML-CHANGES.md`)

Hand this file to the other Claude chat. It lists every old → new R2 URL across:

| File | Edits |
|---|---|
| index.html | 2 |
| content-pages/brands.html | 2 |
| content-pages/digital.html | 1 |
| project-pages/project-aok.html | 2 |
| project-pages/project-bytesyzetv.html | 3 |
| project-pages/project-discod.html | 1 |
| project-pages/project-giphy-ads.html | 1 |
| project-pages/project-giphy-artist-commissions.html | 4 |
| project-pages/project-giphy-partnerships.html | 2 |
| project-pages/project-giphy-stamps.html | 8 |
| project-pages/project-giphy-studios.html | 3 |
| project-pages/project-influence.html | 1 |
| project-pages/project-kamk.html | 14 |
| project-pages/project-pln.html | 3 |
| project-pages/project-usc.html | 1 |
| project-pages/project-zips.html | 1 |
| **Total** | **49** |

Each edit is a literal `str_replace` — the OLD strings are URL-encoded as they appear in the HTML source, and the NEW strings are clean ASCII.

## Verification

After Step 5 is live, Cloudflare Pages should deploy and the site should render with:
- smaller MP4 files (faster first paint on the homepage strip)
- no `%20`, `%2B`, or `.MP4` anywhere in the HTML
- the `Hulu + Live TV` folder gone, replaced by `Hulu-Live-TV`

Confirm with:

```bash
grep -rE '\.MP4|%20|%2B|%C3%' index.html content-pages/ project-pages/
# expect: no output
find images -name '* *' -o -name '*+*' -o -name '*(*' -o -iname '*.MP4' ! -name '*.mp4'
# expect: no output
```

## Rollback

If something goes wrong, the only destructive operations are:
1. Overwriting local files in Step 2 — no local copies are kept; recover from git history with `git checkout -- images/path/to/file.mp4`.
2. Deleting old R2 keys in Step 4 — if you realize you need the old key back, re-upload from your local copy with `wrangler r2 object put portfolio-videos/<old-key> --file=<local> --remote`.

Pre-cleanup sizes for each file are preserved in `scripts/04-sync-r2-renames.sh` as comments for reference.
