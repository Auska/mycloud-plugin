#!/bin/sh

[ -f /tmp/debug_apkg ] && echo "APKG_DEBUG: $0 $@" >> /tmp/debug_apkg

path=$1

echo "Link file from : "$path

#link library

#link program,cgi
ln -sf $path/sbin/transmission-daemon /usr/sbin/transmission-daemon-addon
ln -sf $path/sbin/transmission-remote /usr/sbin/transmission-remote-addon
#create a folder for webpage
WEBPATH="/var/www/Transmission/"
mkdir -p $WEBPATH

#webpage,function,css,js,cgi
ln -sf $path/web/* $WEBPATH
