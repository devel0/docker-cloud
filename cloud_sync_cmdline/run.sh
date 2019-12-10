#!/bin/bash

#set -x

exdir=$(dirname `readlink -f "$0"`)

source "$exdir"/VARIABLES

container=cloud-sync
container_image=searchathing/nextcloud-client-cmd
net=cloud-sync
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
	--volume="$CLOUD_LOCAL_FOLDER:/nas" \
	--volume="$CLOUD_ADMIN_PWDFILE:/security/cloud/admin:ro" \
        --cpus="$cpus" \
        --memory="$memory" \
        "$container_image"
