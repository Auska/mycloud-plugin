#!/usr/local/bin/sh

INSTALL_DIR=$1

ln -sf $INSTALL_DIR/obfs-server /usr/local/bin/obfs-server
ln -sf $INSTALL_DIR/obfs-local /usr/local/bin/obfs-local
ln -sf $INSTALL_DIR/ss-server /usr/local/bin/ss-server
ln -sf $INSTALL_DIR/ss-local /usr/local/bin/ss-local
ln -sf $INSTALL_DIR/ss-manager /usr/local/bin/ss-manager
ln -sf $INSTALL_DIR/ss-redir /usr/local/bin/ss-redir
ln -sf $INSTALL_DIR/ss-tunnel /usr/local/bin/ss-tunnel
