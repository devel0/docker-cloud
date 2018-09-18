#!/bin/bash

source /scripts/constants
source /scripts/utils.sh

container=cloud_psql
container_image=postgres:10.0
net=cloud_psql
ip="$ip_cloud_psql_srv"
cpus="3"
memory="512m"

dk-rm-if-exists "$container"

docker run \
	-d \
	--name="$container" \
	--hostname="$container" \
	--network="$net" \
	--ip="$ip" \
	--restart="unless-stopped" \
	--volume="/nas/data/cloud_psql:/var/lib/postgresql/data" \
	--env="POSTGRES_PASSWORD=`cat /security/cloud_psql/postgres`" \
	--cpus="$cpus" \
	--memory="$memory" \
	"$container_image"
