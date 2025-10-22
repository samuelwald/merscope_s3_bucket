#!/bin/bash

echo "Path of folder to copy: (e.g /home/samuelwald/mnt/pharma2/merfish_analysis/preissl/swald):"
read SRC

echo "Target path (e.g radosgw:spatial_transcriptomics/your/path):"
read DEST

case "$SRC" in
  *output*)
    log_file="/home/samuelwald/rclone_logs/merfish_output"
    ;;
  *analysis*)
    log_file="/home/samuelwald/rclone_logs/merfish_analysis"
    ;;
  *raw*)
    log_file="/home/samuelwald/rclone_logs/merfish_raw"
    ;;
esac

echo "---------------------------------------------"
echo "  Start synchronization:"
echo "  Source: $SRC"
echo "  Target:   $DEST"
echo "  Log files are saved in: $log_file"
echo "---------------------------------------------"

echo "_____________________________________________"
echo "Start copy process"
echo "_____________________________________________"

rclone copy "$SRC" "$DEST" \
    --progress \
    --checksum \
    --stats=30s \
    --log-file="$log_file/$(basename "$SRC")_rclone_copy.txt" \
    --log-level=INFO \
    --ignore-existing

echo "_____________________________________________"
echo "Start check"
echo "_____________________________________________"

rclone check "$SRC" "$DEST" \
    --one-way \
    --checksum \
    --progress \
    --log-file="$log_file/$(basename "$SRC")_rclone_check.txt" \
    --log-level=INFO 

echo "_____________________________________________"
echo "Done!"
echo "_____________________________________________"
