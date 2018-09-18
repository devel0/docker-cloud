#!/bin/bash

source /scripts/constants
source /scripts/utils.sh

exdir=$(executing_dir)

cd "$exdir"

cp /security/cloud_sync/root "$exdir"
docker build --network=build -t searchathing/cloud_sync "$exdir"
rm -f "$exdir"/root
if [ "$?" != "0" ]; then echo "build failed"; exit 1; fi
