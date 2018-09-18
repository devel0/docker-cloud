#!/bin/bash

source /scripts/constants
source /scripts/utils.sh

container=cloud
container_image=nextcloud:13.0.1
net=cloud
ip="$ip_cloud_srv"
cpus="4"
memory="2g"

dk-rm-if-exists $container

container_data="/nas/data/$container"

docker run \
	-d \
	--name "$container" \
	--hostname "$container" \
	--network="$net" \
	--ip="$ip" \
	--restart="unless-stopped" \
	--volume="$container_data":/var/www/html \
	--cpus="$cpus" \
        --memory="$memory" \
        "$container_image"
