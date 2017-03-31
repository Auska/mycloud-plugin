#!/bin/sh

INSTALL_DIR=$1
ln -sf $INSTALL_DIR/web /var/www/softether
ln -sf $INSTALL_DIR/softether /bin/