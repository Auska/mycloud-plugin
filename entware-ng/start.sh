#!/bin/sh
INSTALL_DIR=$1
#mkdir -p /opt
#mount -o bind $INSTALL_DIR/opt /opt
ln -sf $INSTALL_DIR/opt /
ln -sf $INSTALL_DIR/.profile /home/root
/opt/etc/init.d/rc.unslung start
