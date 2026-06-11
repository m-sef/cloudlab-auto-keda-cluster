#!/usr/bin/env bash

CONTAINER_ID=$1

docker exec -it $CONTAINER_ID /bin/sh

exit 0

