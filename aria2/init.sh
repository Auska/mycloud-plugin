#!/bin/sh

INSTALL_DIR=$1

mkdir /mnt/HD/HD_a2/Public/Aria2
mkdir /etc/aria2

chown nobody /mnt/HD/HD_a2/Public/Aria2/

ln -sf $INSTALL_DIR/web /var/www/aria2
ln -sf $INSTALL_DIR/sbin/aria2c /usr/bin/aria2c
#ln -sf $INSTALL_DIR/sbin/aria2.session /etc/aria2/aria2.session