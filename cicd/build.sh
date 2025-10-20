#!/bin/bash

set -e

IMAGE_NAME=gobot:${RELEASE_NAME:-'vLocal'}

docker buildx build \
  --tag ${IMAGE_NAME} \
  .
