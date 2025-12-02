#!/bin/bash

set -e

AVAR='ignore me and again'
IMAGE_NAME=gobot:${RELEASE_NAME:-'vLocal'}

docker buildx build \
  --tag ${IMAGE_NAME} \
  .
