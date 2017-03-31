#!/bin/sh

INSTALL_DIR=$1
#ln -sf $INSTALL_DIR/web /var/www/thunder
$INSTALL_DIR/portal >/dev/null 2>&1 &

FIRST_MOUNT=/mnt/HD/HD_a2
[ ! -d $FIRST_MOUNT ] && FIRST_MOUNT=/mnt/HD/HD_b2
[ ! -d $FIRST_MOUNT ] && FIRST_MOUNT=/mnt/HD/HD_c2
[ ! -d $FIRST_MOUNT ] && FIRST_MOUNT=/mnt/HD/HD_d2
DOWNLOAD_FOLDER=$FIRST_MOUNT/TDDOWNLOAD

smbif -a ${DOWNLOAD_FOLDER}
chmod a+rw -R ${DOWNLOAD_FOLDER}