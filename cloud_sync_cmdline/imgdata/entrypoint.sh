#!/bin/bash

if [ ! -e /root/initialized ]; then
	chmod 700 /security
#	echo "set ssh service"
#        sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

 #       echo "setup root pass"
#        echo "root:`cat /root/it-admin-root`" | chpasswd

	touch /root/initialized
fi

echo "machine cloud.searchathing.com login admin password `cat /security/cloud/admin`" > /root/curl-rc

service rsyslog start
service supervisor start

l=/var/log/wait_changes2.out.log
touch $l
tail -f $l

$1
