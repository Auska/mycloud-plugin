#!/bin/sh

path=$1

. $path/common.sh

#stop daemon
kill `pidof $PRODUCT_BINARY` 2>/dev/null

#remove link
remove_links

#cmd on remove

#remove installed directory
rm -rf $path

debug_log "Exiting remove"
