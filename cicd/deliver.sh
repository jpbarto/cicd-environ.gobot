#!/bin/bash

set -e

IMAGE_NAME=gobot:${RELEASE_NAME:-'vLocal'}

if ! `docker buildx inspect container-builder >/dev/null 2>&1`; then
    docker buildx create \
      --name container-builder \
      --driver docker-container \
      --bootstrap --use
fi

CR_PAT=${CR_PAT:-`gh auth token`}
GHCR_USER=${GH_ACTOR:-'jpbarto'}
GHCR_TOKEN=${GITHUB_TOKEN:-$CR_PAT}
echo $GHCR_TOKEN | docker login ghcr.io -u jpbarto --password-stdin
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --output type=registry,name=ghcr.io/jpbarto/$IMAGE_NAME,oci-artifact=true \
  .
