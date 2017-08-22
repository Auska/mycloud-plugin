#!/bin/sh

path_src=$1
# path_des is the parent directory of the installation
path_des=$2

. $path_src/common.sh

cp -pR $path_src $path_des


SETTINGS_BACKUP_PATH=$path_des/${PRODUCT_NAME}_backup
DESTINATION_PATH=$path_des/$PRODUCT_NAME
SETTINGS_PATH=$path_des/$PRODUCT_NAME/${CONFIG_DIR_NAME}

BITTORRENT_SETTINGS=$path_des/BitTorrentSync/settings

upgrade_resilio()
{
	cp -r ${BITTORRENT_SETTINGS} ${DESTINATION_PATH}/
	cp $path_src/${CONFIG_DIR_NAME}/${CONFIG_FILE_NAME} ${SETTINGS_PATH}/${CONFIG_FILE_NAME}

	BTSYNC_PID=$(pidof btsync)
	kill ${BTSYNC_PID}

	# Wait process killed
	while kill -0 ${BTSYNC_PID} 2> /dev/null; do
			sleep 0.5
	done

	# We cannot uninstall BitTorrent Sync from here, so remove its settings (except config) to avoid conflicts
	find ${BITTORRENT_SETTINGS} ! -name 'sync.conf' -type f -exec rm -f {} +
}

if [ ! -f ${SETTINGS_PATH}/sync.dat ] && [ -d ${BITTORRENT_SETTINGS} ]; then
	upgrade_resilio

elif [ -d ${SETTINGS_BACKUP_PATH}/settings ]; then
	# restore config files if they are saved in preinst.sh (or before_apkg.sh)
	debug_log "Transferring backed up settings at $SETTINGS_BACKUP_PATH to new installation at $DESTINATION_PATH"
	mv ${DESTINATION_PATH}/settings ${DESTINATION_PATH}/new_settings
	cp -af ${SETTINGS_BACKUP_PATH}/settings ${DESTINATION_PATH}
	# Make sure that the new sync.conf overwrites the previous
	cp ${DESTINATION_PATH}/new_settings/$CONFIG_FILE_NAME ${DESTINATION_PATH}/$CONFIG_DIR_NAME/$CONFIG_FILE_NAME
	# Clean up
	rm -rf ${DESTINATION_PATH}/new_settings
	rm -rf ${SETTINGS_BACKUP_PATH}
fi

# Stream edit the (new) configuration file for this device's directories
# This way the config file can be updated in the new release, and the config
# file still can be configured for the device
CONFIG_FILE_RELPATH=$CONFIG_DIR_NAME/$CONFIG_FILE_NAME
sed -e "s,INSTALL_FOLDER,$DESTINATION_PATH," $DESTINATION_PATH/$CONFIG_FILE_RELPATH >> $DESTINATION_PATH/$CONFIG_FILE_RELPATH.tmp 2>&1
RESULT=$?
debug_log "RESULT $RESULT"
if [ $RESULT -eq 0 ] ; then
	mv $DESTINATION_PATH/$CONFIG_FILE_RELPATH.tmp $DESTINATION_PATH/$CONFIG_FILE_RELPATH
fi
debug_log "Exiting install"
