#!/bin/sh

INSTALL_DIR=$1

killall minidlnad >/dev/null 2>&1

rm -f /var/www/minidlnad
rm -f /usr/bin/minidlnad
rm -f /usr/lib/minidlna
rm -f /etc/minidlna

rm -rf $INSTALL_DIR
