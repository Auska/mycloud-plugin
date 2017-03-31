#!/bin/sh

INSTALL_DIR=$1

$INSTALL_DIR/portal -s >/dev/null 2>&1 &

rm -f /var/www/thunder
rm -rf $INSTALL_DIR
