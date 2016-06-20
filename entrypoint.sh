#!/bin/sh

echo "mounting... ${SMB_PATH} user:${SMB_USER}"

mkdir -p /mnt/windows
mount -t cifs -o username=${SMB_USER},password=${SMB_PASS} ${SMB_PATH} /mnt/windows

echo "* 6 * * * root rsync -av ${BKUP_PATH} /mnt/windows" >> /etc/crontab

# start cron daemon
cron -f
#while true; do sleep 1000; done
