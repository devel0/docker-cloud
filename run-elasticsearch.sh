#!/bin/bash

docker run -d \
    --name "elasticsearch" \
    --restart="unless-stopped" \
    -e "discovery.type=single-node" \
    -e "bootstrap.memory_lock=true" \
    -e "ES_JAVA_OPTS=-Xms256m -Xmx512m" \
    -e "ELASTIC_PASSWORD=\"$(cat /root/security/elasticsearch)\"" \
    -e "xpack.security.enabled=false" \
    -v elasticsearch:/usr/share/elasticsearch/data \
    --network dnet \
    elasticsearch:8.17.0
