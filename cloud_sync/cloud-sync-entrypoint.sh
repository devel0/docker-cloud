#!/bin/bash

umask 0007

if [ ! -e /root/initialized ]; then
#        echo "set ssh service"
 #       sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

        touch /root/initialized
else
	echo "===========> RUNNING HEADLESS ( please wait... )"
	xvfb-run xfce4-session &
fi

#service ssh start
