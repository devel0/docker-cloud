#!/bin/bash

if [ ! -e /root/initialized ]; then
	touch /root/initialized
fi

source /root/VARIABLES

echo "machine $CLOUD_SERVER login admin password `cat /security/cloud/admin`" > /root/curl-rc

service rsyslog start
service supervisor start

l=/var/log/wait_changes2.out.log
touch $l
tail -f $l

$1
