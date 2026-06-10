#!/system/bin/sh

while [ ! -d /system/odm/lib64/camera ]; do
  sleep 0.5
done

chcon -R u:object_r:same_process_hal_file:s0 /system/odm/lib64/camera/

echo "camera selinux fix applied" > /dev/kmsg
