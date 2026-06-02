#!/usr/bin/env bash

if [[ "$(hostname -s)" == *"master"* ]]; then
	echo "MASTER"
	exit 0
else
	exit 1
fi