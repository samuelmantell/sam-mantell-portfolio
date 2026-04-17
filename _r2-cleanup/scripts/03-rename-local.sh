#!/usr/bin/env bash
# ===================================================================
# Stage 3a — Local filename normalization (folders + files)
# ===================================================================
# Run from the project root:
#   cd ~/Desktop/my-portfolio
#   bash _r2-cleanup/scripts/03-rename-local.sh
#
# This:
#   1. Renames 1 folder with a space/+ in its name
#   2. Renames 74 files to normalize spaces/+/()/non-ASCII/.MP4 extensions
#
# Run AFTER the other Claude chat has applied HTML-CHANGES.md (so index/content/
# project pages are already pointing at the new filenames).
# ===================================================================

set -u

if [ ! -d images ]; then
  echo "ERROR: run this from the project root (no ./images/ dir found here)."
  exit 1
fi

# ---- Folder renames (run first; files inside get rewritten parents) ----
if [ -d 'images/Branded-Content/Giphy-Ads/Hulu + Live TV' ]; then
  echo "MV (dir): images/Branded-Content/Giphy-Ads/Hulu + Live TV -> images/Branded-Content/Giphy-Ads/Hulu-Live-TV"
  mv -- 'images/Branded-Content/Giphy-Ads/Hulu + Live TV' images/Branded-Content/Giphy-Ads/Hulu-Live-TV
else
  echo "SKIP (dir missing): images/Branded-Content/Giphy-Ads/Hulu + Live TV"
fi

# ---- File renames ----
if [ -f 'images/About/How Ya Doing Its Me GIF.gif' ]; then
  echo "MV: images/About/How Ya Doing Its Me GIF.gif -> images/About/How-Ya-Doing-Its-Me-GIF.gif"
  mv -- 'images/About/How Ya Doing Its Me GIF.gif' images/About/How-Ya-Doing-Its-Me-GIF.gif
else
  echo "SKIP (missing): images/About/How Ya Doing Its Me GIF.gif"
fi
if [ -f 'images/About/How Ya Doing Its Me GIF.mp4' ]; then
  echo "MV: images/About/How Ya Doing Its Me GIF.mp4 -> images/About/How-Ya-Doing-Its-Me-GIF.mp4"
  mv -- 'images/About/How Ya Doing Its Me GIF.mp4' images/About/How-Ya-Doing-Its-Me-GIF.mp4
else
  echo "SKIP (missing): images/About/How Ya Doing Its Me GIF.mp4"
fi
if [ -f 'images/About/How Ya Doing Its Me jpg.mov' ]; then
  echo "MV: images/About/How Ya Doing Its Me jpg.mov -> images/About/How-Ya-Doing-Its-Me-jpg.mov"
  mv -- 'images/About/How Ya Doing Its Me jpg.mov' images/About/How-Ya-Doing-Its-Me-jpg.mov
else
  echo "SKIP (missing): images/About/How Ya Doing Its Me jpg.mov"
fi
if [ -f 'images/About/SM pic Medium.png' ]; then
  echo "MV: images/About/SM pic Medium.png -> images/About/SM-pic-Medium.png"
  mv -- 'images/About/SM pic Medium.png' images/About/SM-pic-Medium.png
else
  echo "SKIP (missing): images/About/SM pic Medium.png"
fi
if [ -f 'images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.gif' ]; then
  echo "MV: images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.gif -> images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu-Live-Tv-GIF-by-HULU.gif"
  mv -- 'images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.gif' images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu-Live-Tv-GIF-by-HULU.gif
else
  echo "SKIP (missing): images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.gif"
fi
if [ -f 'images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.mp4' ]; then
  echo "MV: images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.mp4 -> images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu-Live-Tv-GIF-by-HULU.mp4"
  mv -- 'images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.mp4' images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu-Live-Tv-GIF-by-HULU.mp4
else
  echo "SKIP (missing): images/Branded-Content/Giphy-Ads/Hulu-Live-TV/Hulu Live Tv GIF by HULU.mp4"
fi
if [ -f 'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.gif' ]; then
  echo "MV: images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.gif -> images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.gif"
  mv -- 'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.gif' images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.gif
else
  echo "SKIP (missing): images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.gif"
fi
if [ -f 'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.mp4' ]; then
  echo "MV: images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.mp4 -> images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.mp4"
  mv -- 'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.mp4' images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.mp4
else
  echo "SKIP (missing): images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.mp4"
fi
if [ -f 'images/Branded-Content/Partnerships/Lego GIF by Fortnite.gif' ]; then
  echo "MV: images/Branded-Content/Partnerships/Lego GIF by Fortnite.gif -> images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.gif"
  mv -- 'images/Branded-Content/Partnerships/Lego GIF by Fortnite.gif' images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.gif
else
  echo "SKIP (missing): images/Branded-Content/Partnerships/Lego GIF by Fortnite.gif"
fi
if [ -f 'images/Branded-Content/Partnerships/Lego GIF by Fortnite.mp4' ]; then
  echo "MV: images/Branded-Content/Partnerships/Lego GIF by Fortnite.mp4 -> images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.mp4"
  mv -- 'images/Branded-Content/Partnerships/Lego GIF by Fortnite.mp4' images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.mp4
else
  echo "SKIP (missing): images/Branded-Content/Partnerships/Lego GIF by Fortnite.mp4"
fi
if [ -f images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4 ]; then
  echo "MV: images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4 -> images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4"
  mv -- images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4 images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.mp4
else
  echo "SKIP (missing): images/Branded-Content/T-Mobile/TMO_PLN_Rapid-Fire.MP4"
fi
if [ -f images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.MP4 ]; then
  echo "MV: images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.MP4 -> images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.mp4"
  mv -- images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.MP4 images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.mp4
else
  echo "SKIP (missing): images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.MP4"
fi
if [ -f images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.MP4 ]; then
  echo "MV: images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.MP4 -> images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.mp4"
  mv -- images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.MP4 images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.mp4
else
  echo "SKIP (missing): images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS_SL.MP4"
fi
if [ -f images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.MP4 ]; then
  echo "MV: images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.MP4 -> images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.mp4"
  mv -- images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.MP4 images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.mp4
else
  echo "SKIP (missing): images/Digital-Content/ByteSyzeTV/ByteSyze_Genius-Verified_Samara-Cyn.MP4"
fi
if [ -f images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.MP4 ]; then
  echo "MV: images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.MP4 -> images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.mp4"
  mv -- images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.MP4 images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.mp4
else
  echo "SKIP (missing): images/Digital-Content/ByteSyzeTV/ByteSyze_Subway-Takes_Rosalia.MP4"
fi
if [ -f images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.MP4 ]; then
  echo "MV: images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.MP4 -> images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.mp4"
  mv -- images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.MP4 images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.mp4
else
  echo "SKIP (missing): images/Digital-Content/ByteSyzeTV/ByteSyze_The-Voice_Reba-McEntire.MP4"
fi
if [ -f 'images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DÍA-DEL-PADRE-Cecilia Quispe.mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DÍA-DEL-PADRE-Cecilia Quispe.mp4 -> images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DIA-DEL-PADRE-Cecilia-Quispe.mp4"
  mv -- 'images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DÍA-DEL-PADRE-Cecilia Quispe.mp4' images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DIA-DEL-PADRE-Cecilia-Quispe.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Artist-Commissions/FELIZ-DÍA-DEL-PADRE-Cecilia Quispe.mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).gif -> images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.gif"
  mv -- 'images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).gif' images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).mp4 -> images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.mp4"
  mv -- 'images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).mp4' images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR-1.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Artist-Commissions/FRIA_Damer_MIDSOMMAR (1).mp4"
fi
if [ -f images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.MP4 ]; then
  echo "MV: images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.MP4 -> images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.mp4"
  mv -- images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.MP4 images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Artist-Commissions/TakePride_MP4_V2.MP4"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).gif -> images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.gif"
  mv -- 'images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).gif' images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).mp4 -> images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.mp4"
  mv -- 'images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).mp4' images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-1.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/French-Stamps-Sticker-(1).mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).gif -> images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.gif"
  mv -- 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).gif' images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).mp4 -> images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.mp4"
  mv -- 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).mp4' images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-1.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(1).mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).gif -> images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.gif"
  mv -- 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).gif' images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).mp4 -> images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.mp4"
  mv -- 'images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).mp4' images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-2.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/German-Stamps-Sticker-(2).mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).gif -> images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.gif"
  mv -- 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).gif' images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).mp4 -> images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.mp4"
  mv -- 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).mp4' images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-1.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(1).mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).gif -> images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.gif"
  mv -- 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).gif' images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).mp4 -> images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.mp4"
  mv -- 'images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).mp4' images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-2.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Italian-Stamps-Sticker-(2).mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).gif -> images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.gif"
  mv -- 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).gif' images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).mp4 -> images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.mp4"
  mv -- 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).mp4' images/Digital-Content/Giphy/Stamps/Stamps-Sticker-1.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(1).mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).gif -> images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.gif"
  mv -- 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).gif' images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).gif"
fi
if [ -f 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).mp4 -> images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.mp4"
  mv -- 'images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).mp4' images/Digital-Content/Giphy/Stamps/Stamps-Sticker-2.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Stamps/Stamps-Sticker-(2).mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.gif -> images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.gif"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.gif' images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.gif"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.mp4 -> images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.mp4"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.mp4' images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry-Fire-GIF.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/Legacy/Angry Fire GIF.mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.gif -> images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.gif"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.gif' images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.gif"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.mp4 -> images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.mp4"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.mp4' images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo-Finde-GIF-by-Sealed-With-A-GIF.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Domingo Finde GIF by Sealed With A GIF.mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs Dec HNY V3.mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs Dec HNY V3.mp4 -> images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs-Dec-HNY-V3.mp4"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs Dec HNY V3.mp4' images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs-Dec-HNY-V3.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./LOs Dec HNY V3.mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.gif -> images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.gif"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.gif' images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.gif"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.mp4 -> images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.mp4"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.mp4' images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami-Dolphins-Sport-GIF-by-Sealed-With-A-GIF.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Miami Dolphins Sport GIF by Sealed With A GIF.mp4"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.gif' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.gif -> images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.gif"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.gif' images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.gif
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.gif"
fi
if [ -f 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.mp4' ]; then
  echo "MV: images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.mp4 -> images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.mp4"
  mv -- 'images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.mp4' images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia-Eagles-Sport-GIF-by-Sealed-With-A-GIF.mp4
else
  echo "SKIP (missing): images/Digital-Content/Giphy/Studios-Originals/S.W.A.G./Philadelphia Eagles Sport GIF by Sealed With A GIF.mp4"
fi
if [ -f 'images/Digital-Content/USC/CHELSEA JOHNSON.mp4' ]; then
  echo "MV: images/Digital-Content/USC/CHELSEA JOHNSON.mp4 -> images/Digital-Content/USC/CHELSEA-JOHNSON.mp4"
  mv -- 'images/Digital-Content/USC/CHELSEA JOHNSON.mp4' images/Digital-Content/USC/CHELSEA-JOHNSON.mp4
else
  echo "SKIP (missing): images/Digital-Content/USC/CHELSEA JOHNSON.mp4"
fi
if [ -f 'images/Original-Content/Disco_d/Discod (Official Trailer).mp4' ]; then
  echo "MV: images/Original-Content/Disco_d/Discod (Official Trailer).mp4 -> images/Original-Content/Disco_d/Discod-Official-Trailer.mp4"
  mv -- 'images/Original-Content/Disco_d/Discod (Official Trailer).mp4' images/Original-Content/Disco_d/Discod-Official-Trailer.mp4
else
  echo "SKIP (missing): images/Original-Content/Disco_d/Discod (Official Trailer).mp4"
fi
if [ -f 'images/Original-Content/Disco_d/[SMMS Films] Discod (Official Trailer).m4a' ]; then
  echo "MV: images/Original-Content/Disco_d/[SMMS Films] Discod (Official Trailer).m4a -> images/Original-Content/Disco_d/SMMS-Films-Discod-Official-Trailer.m4a"
  mv -- 'images/Original-Content/Disco_d/[SMMS Films] Discod (Official Trailer).m4a' images/Original-Content/Disco_d/SMMS-Films-Discod-Official-Trailer.m4a
else
  echo "SKIP (missing): images/Original-Content/Disco_d/[SMMS Films] Discod (Official Trailer).m4a"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.gif' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.gif -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.gif"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.gif' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.gif
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.gif"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.mp4' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.mp4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.mp4"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.mp4' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM-gif.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/ENM gif.mp4"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.gif' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.gif -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.gif"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.gif' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.gif
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.gif"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.mp4' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.mp4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.mp4"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.mp4' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl-Dinner-GIF.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Girl Dinner GIF.mp4"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.gif' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.gif -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.gif"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.gif' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.gif
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.gif"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.mp4' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.mp4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.mp4"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.mp4' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship-GIF.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/Situationship GIF.mp4"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.gif' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.gif -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.gif"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.gif' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.gif
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.gif"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.mp4' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.mp4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.mp4"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.mp4' images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi-gif.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/GIFS/skibidi gif.mp4"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable Mention - The Creative Screening Mixer - 2025.png' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable Mention - The Creative Screening Mixer - 2025.png -> images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable-Mention-The-Creative-Screening-Mixer-2025.png"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable Mention - The Creative Screening Mixer - 2025.png' images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable-Mention-The-Creative-Screening-Mixer-2025.png
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Honorable Mention - The Creative Screening Mixer - 2025.png"
fi
if [ -f 'images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025 (1).png' ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025 (1).png -> images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025-1.png"
  mv -- 'images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025 (1).png' images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025-1.png
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/Laurels/Winner-IndianaShortFilmFestival-2025 (1).png"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.MP4"
fi
if [ -f images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.MP4 ]; then
  echo "MV: images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.MP4 -> images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.mp4"
  mv -- images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.MP4 images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.mp4
else
  echo "SKIP (missing): images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.MP4"
fi
if [ -f 'images/Original-Content/Zips/ZIPS Teaser Vertical V3_3.mp4' ]; then
  echo "MV: images/Original-Content/Zips/ZIPS Teaser Vertical V3_3.mp4 -> images/Original-Content/Zips/ZIPS-Teaser-Vertical-V3_3.mp4"
  mv -- 'images/Original-Content/Zips/ZIPS Teaser Vertical V3_3.mp4' images/Original-Content/Zips/ZIPS-Teaser-Vertical-V3_3.mp4
else
  echo "SKIP (missing): images/Original-Content/Zips/ZIPS Teaser Vertical V3_3.mp4"
fi
if [ -f 'images/Original-Content/Zips/ZIPS title 4x5.mp4' ]; then
  echo "MV: images/Original-Content/Zips/ZIPS title 4x5.mp4 -> images/Original-Content/Zips/ZIPS-title-4x5.mp4"
  mv -- 'images/Original-Content/Zips/ZIPS title 4x5.mp4' images/Original-Content/Zips/ZIPS-title-4x5.mp4
else
  echo "SKIP (missing): images/Original-Content/Zips/ZIPS title 4x5.mp4"
fi
if [ -f images/strip/ByteSyze_Genius-Verified_Samara-Cyn.MP4 ]; then
  echo "MV: images/strip/ByteSyze_Genius-Verified_Samara-Cyn.MP4 -> images/strip/ByteSyze_Genius-Verified_Samara-Cyn.mp4"
  mv -- images/strip/ByteSyze_Genius-Verified_Samara-Cyn.MP4 images/strip/ByteSyze_Genius-Verified_Samara-Cyn.mp4
else
  echo "SKIP (missing): images/strip/ByteSyze_Genius-Verified_Samara-Cyn.MP4"
fi
if [ -f images/strip/ByteSyze_Subway-Takes_Rosalia.MP4 ]; then
  echo "MV: images/strip/ByteSyze_Subway-Takes_Rosalia.MP4 -> images/strip/ByteSyze_Subway-Takes_Rosalia.mp4"
  mv -- images/strip/ByteSyze_Subway-Takes_Rosalia.MP4 images/strip/ByteSyze_Subway-Takes_Rosalia.mp4
else
  echo "SKIP (missing): images/strip/ByteSyze_Subway-Takes_Rosalia.MP4"
fi
if [ -f images/strip/ByteSyze_The-Voice_Reba-McEntire.MP4 ]; then
  echo "MV: images/strip/ByteSyze_The-Voice_Reba-McEntire.MP4 -> images/strip/ByteSyze_The-Voice_Reba-McEntire.mp4"
  mv -- images/strip/ByteSyze_The-Voice_Reba-McEntire.MP4 images/strip/ByteSyze_The-Voice_Reba-McEntire.mp4
else
  echo "SKIP (missing): images/strip/ByteSyze_The-Voice_Reba-McEntire.MP4"
fi
if [ -f images/strip/Original_KAMK_rizz.MP4 ]; then
  echo "MV: images/strip/Original_KAMK_rizz.MP4 -> images/strip/Original_KAMK_rizz.mp4"
  mv -- images/strip/Original_KAMK_rizz.MP4 images/strip/Original_KAMK_rizz.mp4
else
  echo "SKIP (missing): images/strip/Original_KAMK_rizz.MP4"
fi
if [ -f images/strip/TMO_PLN_Rapid-Fire.MP4 ]; then
  echo "MV: images/strip/TMO_PLN_Rapid-Fire.MP4 -> images/strip/TMO_PLN_Rapid-Fire.mp4"
  mv -- images/strip/TMO_PLN_Rapid-Fire.MP4 images/strip/TMO_PLN_Rapid-Fire.mp4
else
  echo "SKIP (missing): images/strip/TMO_PLN_Rapid-Fire.MP4"
fi

echo ""
echo "Done. Verify with:"
echo "  find images -name \"* *\" -o -name \"*+*\" -o -name \"*(*\" -o -name \"*.MP4\""
echo "(expect no output)"
