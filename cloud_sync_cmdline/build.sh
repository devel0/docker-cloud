#!/bin/bash

source /scripts/constants
source /scripts/utils.sh

exdir=`executing_dir`
container_image=searchathing/nextcloud-client-cmd

args=""

if [ "$1" == "--no-cache" ]; then args="$1"; fi

#--[ build image ]
docker build $args --network=build $@ -t $container_image "$exdir"
