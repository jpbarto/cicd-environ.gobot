#!/bin/bash

set -e

helm package helm/src/gobot -d helm
