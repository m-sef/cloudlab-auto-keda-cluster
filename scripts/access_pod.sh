#!/usr/bin/env bash

POD_NAME=$1

kubectl exec --stdin --tty $POD_NAME -- /bin/bash

exit 0