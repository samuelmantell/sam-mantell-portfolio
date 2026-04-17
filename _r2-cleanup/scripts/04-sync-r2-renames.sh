#!/usr/bin/env bash
# ===================================================================
# Stage 3b — R2 filename sync
# ===================================================================
# Run AFTER 03-rename-local.sh (which leaves the new filenames on disk).
# This uploads the renamed local files back to R2 under the new keys,
# then deletes the old R2 keys.
#
# Run from the project root:
#   cd ~/Desktop/my-portfolio
#   bash _r2-cleanup/scripts/04-sync-r2-renames.sh
#
# Optional: DRY_RUN=1 prints commands but doesn't run them.
# ===================================================================

set -u
BUCKET="portfolio-videos"

if [ ! -d images ]; then
  echo "ERROR: run this from the project root (no ./images/ dir found here)."
  exit 1
fi

run() {
  if [ "${DRY_RUN:-0}" = "1" ]; then
    echo "[DRY] $*"
  else
    "$@"
  fi
}

put_and_delete() {
  local local_file="$1"  # path to the renamed local file (same as the new R2 key)
  local new_key="$2"
  local old_key="$3"
  local ctype="$4"
  if [ ! -f "$local_file" ]; then
    echo "SKIP (missing local): $local_file"
    return
  fi
  echo "PUT: $new_key"
  run wrangler r2 object put "$BUCKET/$new_key" --file="$local_file" --content-type="$ctype" --remote
  echo "DEL: $old_key"
  run wrangler r2 object delete "$BUCKET/$old_key" --remote
  echo ""
}

echo "About to sync 74 R2 object renames. Bucket: $BUCKET"
echo ""
put_and_delete images/About/How-Ya-Doing-Its-Me-GIF.gif images/About/How-Ya-Doing-Its-Me-GIF.gif 'images/About/How Ya Doing Its Me GIF.gif' image/gif
put_and_delete images/About/How-Ya-Doing-Its-Me-GIF.mp4 images/About/How-Ya-Doing-Its-Me-GIF.mp4 'images/About/How Ya Doing Its Me GIF.mp4' video/mp4
put_and_delete images/About/How-Ya-Doing-Its-Me-jpg.mov images/About/How-Ya-Doing-Its-Me-jpg.mov 'images/About/How Ya Doing Its Me jpg.mov' video/quicktime
put_and_delete images/About/SM-pic-Medium.png images/About/SM-pic-Medium.png 'images/About/SM pic Medium.png' image/png
put_and_delete 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu-Live-Tv-GIF-by-HULU.gif' 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu-Live-Tv-GIF-by-HULU.gif' 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu Live Tv GIF by HULU.gif' image/gif
put_and_delete 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu-Live-Tv-GIF-by-HULU.mp4' 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu-Live-Tv-GIF-by-HULU.mp4' 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu Live Tv GIF by HULU.mp4' video/mp4
put_and_delete images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.gif images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.gif 'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.gif' image/gif
put_and_delete images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.mp4 images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.mp4 'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.mp4' video/mp4
put_and_delete images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.gif images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.gif 'images/Branded-Content/Partnerships/Lego GIF by Fortnite.gif' image/gif
put_and_delete images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.mp4 images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.mp4 'images/Branded-Content/Partnerships/Lego GIF by Fortnite.mp4' video/mp4
put_and_delete images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4 images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4 images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4 video/mp4
put_and_delete images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.mp4 images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.mp4 images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.MP4 video/mp4
put_and_delete images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.mp4 images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.mp4 images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.MP4 video/mp4
put_and_delete images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.mp4 images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.mp4 images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.MP4 video/mp4
put_and_delete images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.mp4 images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.mp4 images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.MP4 video/mp4
put_and_delete images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.mp4 images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.mp4 images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.MP4 video/mp4
put_and_delete images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DIA-DEL-PADRE-Cecilia-Quispe.mp4 images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DIA-DEL-PADRE-Cecilia-Quispe.mp4 'images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DÍA-DEL-PADRE-Cecilia Quispe.mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.gif images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.gif 'images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.mp4 images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.mp4 'images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.mp4 images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.mp4 images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.MP4 video/mp4
put_and_delete images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.gif images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.gif 'images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.mp4 images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.mp4 'images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.gif images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.gif 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.mp4 images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.mp4 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.gif images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.gif 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.mp4 images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.mp4 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.gif images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.gif 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.mp4 images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.mp4 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.gif images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.gif 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.mp4 images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.mp4 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.gif images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.gif 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.mp4 images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.mp4 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.gif images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.gif 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).gif' image/gif
put_and_delete images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.mp4 images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.mp4 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.gif images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.gif 'images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.gif' image/gif
put_and_delete images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.mp4 images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.mp4 'images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.gif images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.gif 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.gif' image/gif
put_and_delete images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.mp4 images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.mp4 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs-Dec-HNY-V3.mp4 images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs-Dec-HNY-V3.mp4 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs Dec HNY V3.mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.gif images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.gif 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.gif' image/gif
put_and_delete images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.mp4 images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.mp4 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.mp4' video/mp4
put_and_delete images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.gif images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.gif 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.gif' image/gif
put_and_delete images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.mp4 images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.mp4 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.mp4' video/mp4
put_and_delete images/Digital-Content/USC/CHELSEA-JOHNSON.mp4 images/Digital-Content/USC/CHELSEA-JOHNSON.mp4 'images/Digital-Content/USC/CHELSEA JOHNSON.mp4' video/mp4
put_and_delete images/Original-Content/Disco_d/Discod-Official-Trailer.mp4 images/Original-Content/Disco_d/Discod-Official-Trailer.mp4 'images/Original-Content/Disco_d/Discod (Official Trailer).mp4' video/mp4
put_and_delete images/Original-Content/Disco_d/SMMS-Films-Discod-Official-Trailer.m4a images/Original-Content/Disco_d/SMMS-Films-Discod-Official-Trailer.m4a 'images/Original-Content/Disco_d/[SMMS Films] Discod (Official Trailer).m4a' audio/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.gif images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.gif 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.gif' image/gif
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.mp4 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.mp4' video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.gif images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.gif 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.gif' image/gif
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.mp4 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.mp4' video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.gif images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.gif 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.gif' image/gif
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.mp4 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.mp4' video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.gif images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.gif 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.gif' image/gif
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.mp4 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.mp4' video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable-Mention-The-Creative-Screening-Mixer-2025.png images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable-Mention-The-Creative-Screening-Mixer-2025.png 'images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable Mention - The Creative Screening Mixer - 2025.png' image/png
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025-1.png images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025-1.png 'images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025 (1).png' image/png
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.MP4 video/mp4
put_and_delete images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.mp4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.MP4 video/mp4
put_and_delete images/Original-Content/Zips/ZIPS-Teaser-Vertical-V3_3.mp4 images/Original-Content/Zips/ZIPS-Teaser-Vertical-V3_3.mp4 'images/Original-Content/Zips/ZIPS Teaser Vertical V3_3.mp4' video/mp4
put_and_delete images/Original-Content/Zips/ZIPS-title-4x5.mp4 images/Original-Content/Zips/ZIPS-title-4x5.mp4 'images/Original-Content/Zips/ZIPS title 4x5.mp4' video/mp4
put_and_delete images/strip/ByteSyze_Genius-Verified_Samara-Cyn.mp4 images/strip/ByteSyze_Genius-Verified_Samara-Cyn.mp4 images/strip/ByteSyze_Genius-Verified_Samara-Cyn.MP4 video/mp4
put_and_delete images/strip/ByteSyze_Subway-Takes_Rosalia.mp4 images/strip/ByteSyze_Subway-Takes_Rosalia.mp4 images/strip/ByteSyze_Subway-Takes_Rosalia.MP4 video/mp4
put_and_delete images/strip/ByteSyze_The-Voice_Reba-McEntire.mp4 images/strip/ByteSyze_The-Voice_Reba-McEntire.mp4 images/strip/ByteSyze_The-Voice_Reba-McEntire.MP4 video/mp4
put_and_delete images/strip/Original_KAMK_rizz.mp4 images/strip/Original_KAMK_rizz.mp4 images/strip/Original_KAMK_rizz.MP4 video/mp4
put_and_delete images/strip/TMO_PLN_Rapid-Fire.mp4 images/strip/TMO_PLN_Rapid-Fire.mp4 images/strip/TMO_PLN_Rapid-Fire.MP4 video/mp4

echo "Done."
