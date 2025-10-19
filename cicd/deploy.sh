#!/bin/bash

set -e

helm install gobot ./helm/src/gobot -n gobot --create-namespace
