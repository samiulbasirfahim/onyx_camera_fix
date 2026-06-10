#!/system/bin/sh

TARGET=/system/odm/lib64/camera

count=0
while [ ! -d $TARGET ]; do
    count=$((count + 1))
    if [ $count -ge 5 ]; then
        exit 1
    fi
    sleep 0.5
done

chcon -R u:object_r:same_process_hal_file:s0 $TARGET

echo "camera selinux fix applied" >/dev/kmsg
