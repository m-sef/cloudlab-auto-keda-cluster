#!/usr/bin/env bash

POLICY=$1

for ((i=0; i<$(nproc); i++)); do sudo cpufreq-set --cpu $i --governor $1; done

exit 0