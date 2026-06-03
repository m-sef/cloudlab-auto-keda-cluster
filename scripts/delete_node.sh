#!/usr/bin/env bash

NODE=$1

kubectl drain $NODE --ignore-daemonsets --delete-emptydir-data
kubectl delete node $NODE

exit 0