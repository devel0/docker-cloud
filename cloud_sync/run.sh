#!/bin/bash

source /scripts/constants
source /scripts/utils.sh

container=cloud_sync
container_image=searchathing/cloud_sync
net=cloud_sync
ip="$ip_cloud_sync_srv"
cpus="3"
memory="3g"

dk-rm-if-exists $container

#privileged=
privileged="--privileged"

container_data="/nas/data/$container"

docker run \
	-ti \
	-d \
	--name "$container" \
	--hostname "$container" \
	--add-host="cloud.example.com:172.19.0.2" \
	--network="$net" \
	--ip="$ip" \
	$privileged \
	--restart="unless-stopped" \
	--volume="/nas:/nas" \
	--cpus="$cpus" \
        --memory="$memory" \
        "$container_image"
