#!/bin/bash

set -e

echo Working with RELEASE_NAME ${RELEASE_NAME}
IMAGE_NAME=gobot:${RELEASE_NAME:-'vLocal'}
echo Delivering image $IMAGE_NAME

if ! `docker buildx inspect container-builder >/dev/null 2>&1`; then
    docker buildx create \
      --name container-builder \
      --driver docker-container \
      --bootstrap --use
fi

CR_PAT=${CR_PAT:-`gh auth token`}
GHCR_USER=${GH_ACTOR:-'jpbarto'}
GHCR_TOKEN=${GITHUB_TOKEN:-$CR_PAT}
echo Logging into Docker Registry with $GHCR_USER and token $GHCR_TOKEN
echo $GHCR_TOKEN | docker login ghcr.io -u $GHCR_USER --password-stdin
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --output type=registry,name=ghcr.io/jpbarto/$IMAGE_NAME,oci-artifact=true \
  .
