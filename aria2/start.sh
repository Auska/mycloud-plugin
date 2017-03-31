#!/bin/sh

INSTALL_DIR=$1
# mkdir /mnt/HD/HD_a2/Public/Aria2
mkdir /etc/aria2
# ln -sf $INSTALL_DIR/web /var/www/aria2
# ln -sf $INSTALL_DIR/sbin/aria2c /usr/bin/aria2c
# ln -sf $INSTALL_DIR/sbin/aria2.session /etc/aria2/aria2.session

USERNAME=$(grep '/home/nobody' /etc/passwd | cut -d ':' -f1)

ln -sf $INSTALL_DIR/sbin/aria2.session /etc/aria2/aria2.session

sudo -u ${USERNAME} aria2c --conf-path=$INSTALL_DIR/config/aria2.conf -D >/dev/null 2>&1 &