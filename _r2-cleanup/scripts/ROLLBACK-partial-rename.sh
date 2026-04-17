#!/usr/bin/env bash
# ===================================================================
# ROLLBACK for the 11 renames that ran accidentally in the Claude session
# ===================================================================
# The 03-rename-local.sh script executed partially (first ~11 entries,
# alphabetically) before the pipe was cut. This reverses those 11 renames,
# returning the local filesystem to the state it was in before.
#
# Run from the project root:
#   cd ~/Desktop/my-portfolio
#   bash _r2-cleanup/scripts/ROLLBACK-partial-rename.sh
# ===================================================================
set -u
if [ ! -d images ]; then
  echo "ERROR: run this from the project root (no ./images/ dir found here)."
  exit 1
fi

rev() {
  local new="$1"
  local old="$2"
  if [ -e "$new" ] && [ ! -e "$old" ]; then
    echo "REVERT: $new -> $old"
    mv -- "$new" "$old"
  elif [ -e "$old" ]; then
    echo "SKIP (old already exists): $old"
  else
    echo "SKIP (new missing): $new"
  fi
}

# Folder
rev 'images/Branded-Content/Giphy-Ads/Hulu-Live-TV' 'images/Branded-Content/Giphy-Ads/Hulu + Live TV'

# Files (note: file renames inside the reverted folder need their parent re-translated
# back to "Hulu + Live TV" AFTER the folder has been moved back, so we do folder first)
rev 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu-Live-Tv-GIF-by-HULU.gif'  'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu Live Tv GIF by HULU.gif'
rev 'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu-Live-Tv-GIF-by-HULU.mp4'  'images/Branded-Content/Giphy-Ads/Hulu + Live TV/Hulu Live Tv GIF by HULU.mp4'
rev 'images/About/How-Ya-Doing-Its-Me-GIF.gif'                                       'images/About/How Ya Doing Its Me GIF.gif'
rev 'images/About/How-Ya-Doing-Its-Me-GIF.mp4'                                       'images/About/How Ya Doing Its Me GIF.mp4'
rev 'images/About/How-Ya-Doing-Its-Me-jpg.mov'                                       'images/About/How Ya Doing Its Me jpg.mov'
rev 'images/About/SM-pic-Medium.png'                                                 'images/About/SM pic Medium.png'
rev 'images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.gif'              'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.gif'
rev 'images/Branded-Content/Partnerships/Dog-Show-Smile-GIF-by-NBC.mp4'              'images/Branded-Content/Partnerships/Dog Show Smile GIF by NBC.mp4'
rev 'images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.gif'                   'images/Branded-Content/Partnerships/Lego GIF by Fortnite.gif'
rev 'images/Branded-Content/Partnerships/Lego-GIF-by-Fortnite.mp4'                   'images/Branded-Content/Partnerships/Lego GIF by Fortnite.mp4'

echo "Done. 11 renames reverted."
