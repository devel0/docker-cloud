#!/bin/bash

exdir=$(dirname `readlink -f "$0"`)

container=cloud-psql
container_image=postgres:11.5
net=cloud-psql
cpus="3"
memory="512m"

dk-rm-if-exists "$container"

pgpass="$(get-credential cloud-psql-postgres)"
if [ "$?" != "0" ]; then
	pgpass="$(cat /security/cloud_psql/postgres)"
fi
if [ "$pgpass" == "" ]; then
	echo "unable to find pg credential provider"
	exit 1
fi

docker run \
	-d \
	--name="$container" \
	--hostname="$container" \
	--network="$net" \
	--restart="unless-stopped" \
	--volume="$exdir/removefilelocks.sql:/removefilelocks.sql" \
	--volume="/nas/data/cloud-psql:/var/lib/postgresql/data" \
	--env="POSTGRES_PASSWORD=$pgpass" \
	--cpus="$cpus" \
	--memory="$memory" \
	"$container_image"
