#!/usr/bin/env bash

# Delete the YAML file under yaml/prometheus.yaml
kubectl delete -f https://raw.githubusercontent.com/m-sef/cloudlab-auto-keda-cluster/main/yaml/prometheus.yaml

exit 0