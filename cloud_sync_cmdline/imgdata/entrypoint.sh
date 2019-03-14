#!/bin/bash

if [ ! -e /root/initialized ]; then
#	echo "set ssh service"
#        sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

 #       echo "setup root pass"
#        echo "root:`cat /root/it-admin-root`" | chpasswd

	touch /root/initialized
fi

service rsyslog start

cat /var/log/syslog

tail -f /var/log/syslog

$1
