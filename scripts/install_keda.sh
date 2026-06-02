#!/usr/bin/env bash

helm install keda kedacore/keda --namespace keda --create-namespace

exit 0