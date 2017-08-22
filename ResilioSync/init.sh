#!/bin/sh

INSTALL_PATH=$1

. $INSTALL_PATH/common.sh

#remove link
remove_links

# Create and populate web folder
debug_log "Creating/populating web folder"
WEBPATH=/var/www/$PRODUCT_NAME
mkdir -p $WEBPATH
# Try symlinks to individual files, not to the directory
ln -s $INSTALL_PATH/webpage/*.png $WEBPATH
ln -s $INSTALL_PATH/webpage/*.html $WEBPATH

# Create program link
debug_log "Creating program link"
ln -s $INSTALL_PATH/$PRODUCT_BINARY_PATH /usr/bin/$PRODUCT_BINARY


debug_log "Exiting init"
