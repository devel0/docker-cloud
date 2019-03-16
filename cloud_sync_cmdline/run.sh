#!/bin/bash

#set -x

source /scripts/constants
source /scripts/utils.sh
exdir=`executing_dir`
source "$exdir"/VARIABLES

container=nextcloud_client_cmd
container_image=searchathing/nextcloud-client-cmd
net=nextcloud_client_cmd
ip="$ip_nextcloud_client_cmd_srv"
cpus="4"
memory="256m"

dk-rm-if-exists $container $1

echo -n '---> starting...'

privileged=
#privileged="--privileged"

docker -D run \
        -d \
        -ti \
	-e TZ=`cat /etc/timezone` \
	$privileged \
	--name "$container" \
	--ip="$ip_nextcloud_client_cmd" \
        --network="$net" \
        --restart="unless-stopped" \
	--volume="$CLOUD_NAS_ROOT:/nas" \
	--volume="$CLOUD_ADMIN_PWDFILE:/security/cloud/admin:ro" \
        --cpus="$cpus" \
        --memory="$memory" \
        "$container_image"
