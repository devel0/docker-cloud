#!/bin/bash

# replace cloud.my.com with your domain name

docker run -d \
    --name "cloud" \
    --network dnet \
    -p 80:80 \
    -v cloud-data:/var/www/html \
    --restart="unless-stopped" \
    -e REDIS_HOST=redis \
    -e POSTGRES_DB=cloud \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=$(cat ~/security/cloud-psql) \
    -e POSTGRES_HOST=cloud-psql \
    -e NEXTCLOUD_ADMIN_USER=admin \
    -e NEXTCLOUD_ADMIN_PASSWORD=$(cat ~/security/cloud) \
    -e NEXTCLOUD_TRUSTED_DOMAINS=cloud.my.com \
    -e PHP_MEMORY_LIMIT=512M \
    -e PHP_UPLOAD_LIMIT=100G \
    -e APACHE_BODY_LIMIT=107374182400 \
    nextcloud:31
