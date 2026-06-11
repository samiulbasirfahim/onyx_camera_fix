#!/system/bin/sh

BLOB_DIR="$MODPATH/odm/lib64/camera"

for f in "$BLOB_DIR"/*.bin; do
    chcon u:object_r:same_process_hal_file:s0 "$f"
done

ui_print "- Camera blob SELinux labels applied"
