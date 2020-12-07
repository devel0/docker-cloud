#!/bin/bash

dk-rm-if-exists "$container"

container=cloud
container_image=nextcloud:20
net=cloud
cpus="4"
memory="2g"

dk-rm-if-exists $container

container_data="/nas/data/$container"

docker run \
	-d \
	--name "$container" \
	--hostname "$container" \
	--network="$net" \
	--restart="unless-stopped" \
	--volume="$container_data":/var/www/html \
	--cpus="$cpus" \
        --memory="$memory" \
        "$container_image"
