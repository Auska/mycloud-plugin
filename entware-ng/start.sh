#!/bin/sh
mkdir -p /opt
mount -o bind /volume1/@entware-ng/opt /opt
/opt/etc/init.d/rc.unslung start
PATH=$PATH:/opt/bin:/opt/sbin
