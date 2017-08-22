#!/bin/sh

path_src=$1

. $path_src/common.sh

#stop daemon
kill `pidof $PRODUCT_BINARY` 2>/dev/null

#remove link
remove_links

SETTINGS_BACKUP_PATH=$path_src/../${PRODUCT_NAME}_backup
debug_log "SETTINGS_BACKUP_PATH ${SETTINGS_BACKUP_PATH}"

# backup config files and users settings
SETTINGS_CONFIG_PATH=$path_src/settings
if [ ! -d ${SETTINGS_BACKUP_PATH} ] ; then
	debug_log "Backing up $SETTINGS_CONFIG_PATH to $SETTINGS_BACKUP_PATH"
	mkdir -p ${SETTINGS_BACKUP_PATH}
	mv -f ${SETTINGS_CONFIG_PATH} ${SETTINGS_BACKUP_PATH}
fi

