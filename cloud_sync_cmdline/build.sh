#!/bin/bash

exdir=$(dirname `readlink -f "$0"`)
container_image=searchathing/nextcloud-client-cmd

args=""

if [ "$1" == "--no-cache" ]; then args="$1"; fi

#--[ build image ]
docker build $args --network=build $@ -t $container_image "$exdir"
