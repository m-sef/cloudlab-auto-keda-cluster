#!/usr/bin/env bash

# Apply the YAML file under yaml/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/m-sef/cloudlab-keda-cluster/main/yaml/prometheus.yaml

exit 0
