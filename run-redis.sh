#!/bin/bash

docker run -d \
    --name "redis" \
    --restart="unless-stopped" \
    --network dnet \
    redis:7.4