#!/bin/bash

set -e

IMAGE_NAME=gobot:${RELEASE_NAME:-'vLocal'}

if ! `docker buildx inspect container-builder >/dev/null 2>&1`; then
    docker buildx create \
      --name container-builder \
      --driver docker-container \
      --bootstrap --use
fi

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --load \
  --tag ${IMAGE_NAME} \
  .
