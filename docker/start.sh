#!/bin/sh

INSTALL_DIR=$1

for model in docker docker-containerd-shim docker-runc docker-containerd docker-init dockerd docker-containerd-ctr docker-proxy
do
	ln -sf $INSTALL_DIR/bin/$model /usr/local/bin/$model
done