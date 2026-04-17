#!/usr/bin/env bash
# ===================================================================
# Stage 3c — Deploy compressed MP4s (replace local + overwrite R2)
# ===================================================================
# Replaces 22 large videos with re-encoded versions that are ~80% smaller
# on average. Keeps the CURRENT (pre-normalization) filenames so you can
# run this script BEFORE 03-rename-local.sh / 04-sync-r2-renames.sh.
#
# Run from the project root:
#   cd ~/Desktop/my-portfolio
#   bash _r2-cleanup/scripts/05-deploy-compressed.sh
#
# Optional: DRY_RUN=1 prints commands but does not run them.
#           LOCAL_ONLY=1 replaces local files only, skips R2 upload.
#           R2_ONLY=1 overwrites R2 only, skips local replace.
# ===================================================================

set -u
BUCKET="portfolio-videos"
STAGE_DIR="_r2-cleanup/compressed"

if [ ! -d images ]; then
  echo "ERROR: run this from the project root (no ./images/ dir found here)."
  exit 1
fi
if [ ! -d "$STAGE_DIR" ]; then
  echo "ERROR: staging dir not found: $STAGE_DIR"
  exit 1
fi

run() {
  if [ "${DRY_RUN:-0}" = "1" ]; then
    echo "[DRY] $*"
  else
    "$@"
  fi
}

deploy_one() {
  local rel="$1"           # e.g. images/Digital-Content/USC/CHELSEA JOHNSON.mp4
  local compressed="$STAGE_DIR/$rel"
  if [ ! -f "$compressed" ]; then
    echo "SKIP (no compressed): $rel"
    return
  fi
  if [ ! -f "$rel" ]; then
    echo "SKIP (no local target): $rel"
    return
  fi
  local orig_size new_size
  orig_size=$(stat -c%s "$rel" 2>/dev/null || echo 0)
  new_size=$(stat -c%s "$compressed")
  echo "DEPLOY: $rel  ($orig_size -> $new_size bytes)"

  if [ "${R2_ONLY:-0}" != "1" ]; then
    run cp -f "$compressed" "$rel"
  fi
  if [ "${LOCAL_ONLY:-0}" != "1" ]; then
    run wrangler r2 object put "$BUCKET/$rel" --file="$compressed" --content-type="video/mp4" --remote
  fi
  echo ""
}

# List of files to deploy (one per line, path relative to project root)
while IFS= read -r rel; do
  [ -z "$rel" ] && continue
  [[ "$rel" =~ ^# ]] && continue
  deploy_one "$rel"
done <<'FILES'
images/Branded-Content/T-Mobile/TMO_PLN_image-highlight.mp4
images/strip/ZIPS_Teaser_Vertical_V3_3.mp4
images/Original-Content/Zips/ZIPS Teaser Vertical V3_3.mp4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ENM.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-BTS.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_situationship.MP4
images/Branded-Content/T-Mobile/TMO_PLN_Xavi_BTS.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-trauma-bond.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-the-ick.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals_kamk_mewing.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-skibidi.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-DINK.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-ghosted.MP4
images/strip/Original_KAMK_rizz.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/Original_KAMK_rizz.MP4
images/Original-Content/Kaleb_and_Ms_Kelsey/originals-kamk-girl-dinner.MP4
images/strip/Trlr_Influence_2025_1x1.mp4
images/Original-Content/Influence/Trlr_Influence_2025_Update_1.mp4
images/strip/ByteSyze_Subway-Takes_Rosalia_1x1.mp4
images/Original-Content/Disco_d/Discod (Official Trailer).mp4
images/Digital-Content/USC/CHELSEA JOHNSON.mp4
images/Digital-Content/AOK/AWESOME_NAKED_GUY.mp4
FILES

echo "Done. Verify locally with: find images -size +20M -name '*.mp4' -o -size +20M -iname '*.MP4'"
