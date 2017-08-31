#!/bin/sh

for model in docker docker-containerd-shim docker-runc docker-containerd docker-init dockerd docker-containerd-ctr docker-proxy
do
	rm -f /usr/local/bin/$model
done