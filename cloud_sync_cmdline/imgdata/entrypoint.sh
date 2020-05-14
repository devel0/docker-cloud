#!/bin/bash

if [ ! -e /root/initialized ]; then
	touch /root/initialized
fi

source /root/VARIABLES
mkdir -p /nas/.local/share/nextcloudcmd

echo "machine $CLOUD_SERVER login admin password `cat /security/cloud/admin`" > /root/curl-rc

service rsyslog start
service supervisor start

l=/var/log/wait_changes2.out.log
l2=/lastsync.log
touch $l
touch $l2
echo "LOG START $(date)"
tail -f $l $l2

$1
