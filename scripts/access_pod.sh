#!/usr/bin/env bash

NAMESPACE=$1
POD_NAME=$2

kubectl exec -n $NAMESPACE --stdin --tty $POD_NAME -- /bin/sh

exit 0

