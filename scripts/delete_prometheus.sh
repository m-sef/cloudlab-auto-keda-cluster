#!/usr/bin/env bash

# Delete the YAML file under yaml/prometheus.yaml
kubectl delete -f https://raw.githubusercontent.com/m-sef/cloudlab-keda-cluster/main/yaml/prometheus.yaml

exit 0