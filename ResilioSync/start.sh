#!/bin/sh

USERNAME=$(grep '/home/admin' /etc/passwd | cut -d ':' -f1)
INSTALL_PATH=$1

. $INSTALL_PATH/common.sh

#ensure fixup unaligned access
if [[ "$(uname -m)" = "armv5tel" ]] ; then
   echo 2 > /proc/cpu/alignment
fi

#start daemon
debug_log "Starting $INSTALL_PATH/$PRODUCT_BINARY_PATH"

chown -R ${USERNAME} $INSTALL_PATH
chmod 666 /dev/random
chmod 666 /dev/urandom

sudo -u ${USERNAME} sh -c "umask 000;$INSTALL_PATH/$PRODUCT_BINARY_PATH --config $INSTALL_PATH/$CONFIG_DIR_NAME/sync.conf"

RESULT=$?
debug_log "Start result $RESULT"

#cmd on start daemon

debug_log "Exiting start"
