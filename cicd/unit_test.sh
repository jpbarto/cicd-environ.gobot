#!/bin/bash

set -e

docker run --rm -d --network host --name gobot-unit-test gobot
sleep 2

RESP=`curl -s 'http://localhost:8080'`
RESULT=`echo $RESP | jq -r '.Message'`

if [ $RESULT != "Rooted" ]; then
    echo "Got unexpected response from Gobot: ${RESP}"
    exit 1
fi

docker stop gobot-unit-test
