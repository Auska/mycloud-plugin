#!/bin/sh

PRODUCT_NAME=ResilioSync
PRODUCT_BINARY=rslsync
PRODUCT_BINARY_PATH=bin/$PRODUCT_BINARY
CONFIG_DIR_NAME=settings
CONFIG_FILE_NAME=sync.conf
PRODUCT_DEBUG_LOG_FILE=/tmp/debug_$PRODUCT_BINARY

debug_log()
{
	if [ -f $PRODUCT_DEBUG_LOG_FILE ] ; then
		RIGHTNOW=`date +%Y%m%d%H%M%S`
		echo "$RIGHTNOW $PRODUCT_BINARY: $0 $@" >> $PRODUCT_DEBUG_LOG_FILE
	fi
}

remove_links()
{
	debug_log "Removing links"
	# Test to ensure that /usr/bin doesn't get destroyed
	if [ -n "$PRODUCT_BINARY" ]; then
		rm -f /usr/bin/$PRODUCT_BINARY 2> /dev/null
	else
		debug_log "PRODUCT_BINARY not defined"
	fi
	# Test to ensure that /var/www doesn't get destroyed
	if [ -n "$PRODUCT_NAME" ]; then
		rm -rf /var/www/$PRODUCT_NAME > /dev/null
	else
		debug_log "PRODUCT_NAME not defined"
	fi
}

debug_log $@

# Take an educated guess as to where the large drive is mounted
FIRST_MOUNT=/mnt/HD/HD_a2
if [ ! -d $FIRST_MOUNT ] ; then
	FIRST_MOUNT=/mnt/HD/HD_b2
fi
if [ ! -d $FIRST_MOUNT ] ; then
	FIRST_MOUNT=/mnt/HD/HD_c2
fi
if [ ! -d $FIRST_MOUNT ] ; then
	FIRST_MOUNT=/mnt/HD/HD_d2
fi
DOWNLOAD_FOLDER=$FIRST_MOUNT
debug_log "DOWNLOAD_FOLDER $DOWNLOAD_FOLDER"
