#!/usr/bin/env bash
# Brief: https://keda.sh/docs/2.19/deploy/

# To deploy KEDA using Helm, first add the official KEDA Helm repository:
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

# Install keda by running:
helm install keda kedacore/keda --namespace keda --create-namespace

exit 0