#!/bin/bash

set -e

AVAR='ignore me and again, last time'
IMAGE_NAME=gobot:${RELEASE_NAME:-'vLocal'}

docker buildx build \
  --tag ${IMAGE_NAME} \
  .
