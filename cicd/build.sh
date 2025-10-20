#!/bin/bash

set -e

IMAGE_NAME=gobot:${RELEASE_NAME:-'vLocal'}

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag ${IMAGE_NAME} \
    .
