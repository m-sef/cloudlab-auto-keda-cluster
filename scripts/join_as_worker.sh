#!/usr/bin/env bash

MASTER=master
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! "$SCRIPT_DIR/is_master.sh"; then
    until $(sudo ssh -o StrictHostKeyChecking=no $MASTER "sudo kubeadm token create --print-join-command 2>/dev/null"); do
		sleep 5
	done

    exit 0
fi