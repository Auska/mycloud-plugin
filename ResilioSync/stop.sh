#!/bin/sh

. $1/common.sh

#stop daemon
pkill -f $PRODUCT_BINARY 2>/dev/null

#cmd on stop daemon

debug_log "Exiting stop"
