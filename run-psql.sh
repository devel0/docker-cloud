#!/bin/bash

docker run -d \
    --name cloud-psql \
    --network dnet \
	-p 5432:5432 \
    -v psql-data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD="$(cat ~/security/cloud-psql)" \
    --restart=unless-stopped \
    postgres:16
