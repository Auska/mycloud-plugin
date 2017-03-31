#!/bin/sh

INSTALL_DIR=$1

mv /lib/libz.so.1 /lib/libz.so.1.orig

ln -sf $INSTALL_DIR/web /var/www/minidlna
ln -sf $INSTALL_DIR/sbin/minidlnad /usr/bin/minidlnad
ln -sf $INSTALL_DIR/lib/* /usr/lib/
ln -sf $INSTALL_DIR/config /etc/minidlna