#\!/usr/bin/env bash
# ===================================================================
# Stage 2b — Delete all .gif files from R2 under /images/
# ===================================================================
# Removes 112 .gif files from the R2 bucket. Local copies are NOT
# touched — this only affects R2.
#
# PRE-REQS:
#   1. Upload script (01-upload-posters.sh) has been run successfully
#   2. HTML edits have been deployed (no HTML now references any .gif)
#
# USAGE:
#   cd ~/Desktop/my-portfolio
#   bash ~/path/to/02-delete-gifs.sh
#
# DRY-RUN: set DRY_RUN=1 to print commands without executing
#   DRY_RUN=1 bash ~/path/to/02-delete-gifs.sh
# ===================================================================

set -euo pipefail

BUCKET="portfolio-videos"
DRY_RUN="${DRY_RUN:-0}"

delete() {
  local key="$1"
  if [ "$DRY_RUN" = "1" ]; then
    echo "[dry-run] wrangler r2 object delete \"$BUCKET/$key\" --remote"
  else
    echo "Deleting: $key"
    wrangler r2 object delete "$BUCKET/$key" --remote
  fi
}

delete "images/About/How Ya Doing Its Me GIF.gif"
delete "images/Branded-Content/Giphy-Ads/ABC-The-Bachelorette-S21/Puppies_GIF_Bachelorette.gif"
delete "images/Branded-Content/Giphy-Ads/ABC-The-Bachelorette-S21/giphy-ads-bachelorette-okay.gif"
delete "images/Branded-Content/Giphy-Ads/ABC-The-Bachelorette-S21/giphy-ads-bachelorette-rose.gif"
delete "images/Branded-Content/Giphy-Ads/ABC-The-Bachelorette-S21/giphy-ads-bachelorette-tongue.gif"
delete "images/Branded-Content/Giphy-Ads/ABC-The-Bachelorette-S21/giphy-ads-bachelorette.gif"
delete "images/Branded-Content/Giphy-Ads/Hits-on-Hulu/giphy-ads-HIMYM-daddys-home.gif"
delete "images/Branded-Content/Giphy-Ads/Hits-on-Hulu/giphy-ads-hulu-modern-family-treble.gif"
delete "images/Branded-Content/Giphy-Ads/Hits-on-Hulu/giphy-ads-hulu-schitts-creek-worse.gif"
delete "images/Branded-Content/Giphy-Ads/Hits-on-Hulu/giphy-ads-hulu.gif"
delete "images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu Live Tv GIF by HULU.gif"
delete "images/Branded-Content/Giphy-Ads/Pure-Leaf/PL_TTYL_v1.gif"
delete "images/Branded-Content/Giphy-Ads/Pure-Leaf/PL_congrats_v1.gif"
delete "images/Branded-Content/Giphy-Ads/Pure-Leaf/PL_friday_v1.gif"
delete "images/Branded-Content/Giphy-Ads/Pure-Leaf/PL_lets_go_v1.gif"
delete "images/Branded-Content/Giphy-Ads/Pure-Leaf/PL_letsdance_v1.gif"
delete "images/Branded-Content/Giphy-Ads/Pure-Leaf/PL_morning_goodmorning_v1.gif"
delete "images/Branded-Content/Giphy-Ads/Starbucks-Monday/Giphy_ads_Starbucks_Lets-go.gif"
delete "images/Branded-Content/Giphy-Ads/Starbucks-Monday/Giphy_ads_starbucks_Monday.gif"
delete "images/Branded-Content/Giphy-Ads/Starbucks-Monday/Giphy_ads_starbucks_confetti.gif"
delete "images/Branded-Content/Giphy-Ads/Starbucks-Monday/Giphy_ads_starbucks_go-team.gif"
delete "images/Branded-Content/Giphy-Ads/Starbucks-Monday/Giphy_ads_starbucks_mug-hug.gif"
delete "images/Branded-Content/Giphy-Ads/Starbucks-Monday/Giphy_ads_starbucks_sharing.gif"
delete "images/Branded-Content/Giphy-Ads/Starbucks-Monday/giphy-ads-starbucks.gif"
delete "images/Branded-Content/Live-Gif/Big-Brother/Big-Brother-01.gif"
delete "images/Branded-Content/Live-Gif/Big-Brother/Big-Brother-02.gif"
delete "images/Branded-Content/Live-Gif/Big-Brother/Big-Brother-03.gif"
delete "images/Branded-Content/Live-Gif/Eurovision/Eurovision-gif-01.gif"
delete "images/Branded-Content/Live-Gif/Eurovision/Eurovision-gif-02.gif"
delete "images/Branded-Content/Live-Gif/Eurovision/Eurovision-gif-03.gif"
delete "images/Branded-Content/Live-Gif/Eurovision/Eurovision-gif-04.gif"
delete "images/Branded-Content/Live-Gif/Eurovision/Eurovision-gif-05.gif"
delete "images/Branded-Content/Live-Gif/Indian-Super-League/indian-super-league-gif-01.gif"
delete "images/Branded-Content/Live-Gif/Indian-Super-League/indian-super-league-gif-02.gif"
delete "images/Branded-Content/Live-Gif/Indian-Super-League/indian-super-league-gif-03.gif"
delete "images/Branded-Content/Live-Gif/Indian-Super-League/indian-super-league-gif-04.gif"
delete "images/Branded-Content/Live-Gif/Indian-Super-League/indian-super-league-gif-05.gif"
delete "images/Branded-Content/Live-Gif/Latin-Grammys/latin-grammys-gif-01.gif"
delete "images/Branded-Content/Live-Gif/Latin-Grammys/latin-grammys-gif-02.gif"
delete "images/Branded-Content/Live-Gif/Latin-Grammys/latin-grammys-gif-03.gif"
delete "images/Branded-Content/Live-Gif/Latin-Grammys/latin-grammys-gif-04.gif"
delete "images/Branded-Content/Live-Gif/Latin-Grammys/latin-grammys-gif-05.gif"
delete "images/Branded-Content/Live-Gif/NBC-Paris-Olympics/nbc-paris-olympics-gif-01.gif"
delete "images/Branded-Content/Live-Gif/NBC-Paris-Olympics/nbc-paris-olympics-gif-02.gif"
delete "images/Branded-Content/Live-Gif/NBC-Paris-Olympics/nbc-paris-olympics-gif-03.gif"
delete "images/Branded-Content/Live-Gif/NBC-Paris-Olympics/nbc-paris-olympics-gif-04.gif"
delete "images/Branded-Content/Live-Gif/NBC-Paris-Olympics/nbc-paris-olympics-gif-05.gif"
delete "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-01.gif"
delete "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-02.gif"
delete "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-03.gif"
delete "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-04.gif"
delete "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-05.gif"
delete "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-06.gif"
delete "images/Branded-Content/Live-Gif/NFL/NFL-live-gif-07.gif"
delete "images/Branded-Content/Live-Gif/SNL/SNL-live-gif-01.gif"
delete "images/Branded-Content/Live-Gif/SNL/SNL-live-gif-02.gif"
delete "images/Branded-Content/Live-Gif/SNL/SNL-live-gif-03.gif"
delete "images/Branded-Content/Live-Gif/SNL/SNL-live-gif-04.gif"
delete "images/Branded-Content/Live-Gif/SNL/SNL-live-gif-05.gif"
delete "images/Branded-Content/Live-Gif/SNL/SNL-live-gif-06.gif"
delete "images/Branded-Content/Live-Gif/The-Oscars/Oscars-live-gif-01.gif"
delete "images/Branded-Content/Live-Gif/The-Oscars/Oscars-live-gif-02.gif"
delete "images/Branded-Content/Live-Gif/The-Oscars/Oscars-live-gif-03.gif"
delete "images/Branded-Content/Live-Gif/The-Oscars/Oscars-live-gif-04.gif"
delete "images/Branded-Content/Live-Gif/The-Oscars/Oscars-live-gif-05.gif"
delete "images/Branded-Content/Live-Gif/The-Oscars/Oscars-live-gif-06.gif"
delete "images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.gif"
delete "images/Branded-Content/Partnerships/Lego GIF by Fortnite.gif"
delete "images/Branded-Content/Partnerships/giphy-partnerships-complex.gif"
delete "images/Branded-Content/Partnerships/giphy-partnerships-hot-ones.gif"
delete "images/Branded-Content/Partnerships/giphy-partnerships-nanalan.gif"
delete "images/Digital-Content/AOK/Primitive-Technology-GIF.gif"
delete "images/Digital-Content/Giphy/Artist-Commissions/Dharma-Day-Square-GIF-File.gif"
delete "images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).gif"
delete "images/Digital-Content/Giphy/Artist-Commissions/GiphyDiwali_Diya.gif"
delete "images/Digital-Content/Giphy/Artist-Commissions/Roe-V-Wade-Abortion-GIF-by-GIPHY-Studios-2023-downsized_large.gif"
delete "images/Digital-Content/Giphy/Artist-Commissions/artist_commission_golden_week.gif"
delete "images/Digital-Content/Giphy/Artist-Commissions/artist_commission_indigenous_peoples_day.gif"
delete "images/Digital-Content/Giphy/Artist-Commissions/artist_commission_japan_new_year.gif"
delete "images/Digital-Content/Giphy/Stamps/Boa-Noite-Stamps-GIF.gif"
delete "images/Digital-Content/Giphy/Stamps/Bom-Dia-Stamps-GIF.gif"
delete "images/Digital-Content/Giphy/Stamps/Fin-De-Semana-Stamps-Sticker.gif"
delete "images/Digital-Content/Giphy/Stamps/French-Francais-Sticker.gif"
delete "images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).gif"
delete "images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker.gif"
delete "images/Digital-Content/Giphy/Stamps/German-Stamps-GIF.gif"
delete "images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).gif"
delete "images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).gif"
delete "images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker.gif"
delete "images/Digital-Content/Giphy/Stamps/Giphy_Digital_Stamps_BuonaSera.gif"
delete "images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).gif"
delete "images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).gif"
delete "images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker.gif"
delete "images/Digital-Content/Giphy/Stamps/Stamps-GIF.gif"
delete "images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).gif"
delete "images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).gif"
delete "images/Digital-Content/Giphy/Stamps/Te-Amo-Stamps-Sticker.gif"
delete "images/Digital-Content/Giphy/Stamps/studios-originals-stamps.gif"
delete "images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.gif"
delete "images/Digital-Content/Giphy/Studios-Originals/Legacy/studios-originals-legacy.gif"
delete "images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.gif"
delete "images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./HNY-bear-dj.gif"
delete "images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.gif"
delete "images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.gif"
delete "images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./studios-originals-swag.gif"
delete "images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.gif"
delete "images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.gif"
delete "images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.gif"
delete "images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.gif"
delete "images/strip/Primitive-Technology-GIF.gif"
delete "images/strip/gifs/KAMK_Situationship_GIF.gif"
delete "images/strip/gifs/Puppies_GIF_Bachelorette.gif"

echo ""
echo "Done. 112 .gif files deleted from R2 bucket: $BUCKET"
