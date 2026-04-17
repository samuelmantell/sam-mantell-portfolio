#!/usr/bin/env bash
# ===================================================================
# Stage 2a — Upload 6 poster .jpg files to R2
# ===================================================================
# Uploads static poster frames generated from the .mp4 twins of the
# gifs currently used in <meta property="og:image"> social preview tags.
#
# Run this BEFORE running 02-delete-gifs.sh, and BEFORE you re-deploy
# the updated HTML.
#
# USAGE:
#   cd ~/Desktop/my-portfolio
#   bash ~/path/to/01-upload-posters.sh
# ===================================================================

set -euo pipefail

BUCKET="portfolio-videos"

# The script expects the poster .jpgs to live next to it, in a subfolder
# called "posters/". If you move them, update POSTERS_DIR below.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
POSTERS_DIR="$SCRIPT_DIR/../posters"

upload() {
  local local_file="$1"
  local r2_key="$2"
  if [ ! -f "$local_file" ]; then
    echo "SKIP (missing locally): $local_file"
    return
  fi
  echo "Uploading: $r2_key"
  wrangler r2 object put "$BUCKET/$r2_key" --file="$local_file" --content-type="image/jpeg" --remote
}

upload "$POSTERS_DIR/Giphy_ads_starbucks_confetti.jpg"      "images/Branded-Content/Giphy-Ads/Starbucks-Monday/Giphy_ads_starbucks_confetti.jpg"
upload "$POSTERS_DIR/NFL-live-gif-01.jpg"                   "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-01.jpg"
upload "$POSTERS_DIR/giphy-partnerships-hot-ones.jpg"       "images/Branded-Content/Partnerships/giphy-partnerships-hot-ones.jpg"
upload "$POSTERS_DIR/artist_commission_japan_new_year.jpg"  "images/Digital-Content/Giphy/Artist-Commissions/artist_commission_japan_new_year.jpg"
upload "$POSTERS_DIR/studios-originals-stamps.jpg"          "images/Digital-Content/Giphy/Stamps/studios-originals-stamps.jpg"
upload "$POSTERS_DIR/studios-originals-swag.jpg"            "images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./studios-originals-swag.jpg"

echo ""
echo "Done. 6 poster .jpgs uploaded to R2 bucket: $BUCKET"
