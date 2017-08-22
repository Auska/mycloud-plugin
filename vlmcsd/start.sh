#!/bin/sh

INSTALL_DIR=$1

USERNAME=$(grep '/home/admin' /etc/passwd | cut -d ':' -f1)

sudo -u ${USERNAME} $INSTALL_DIR/bin/vlmcsd