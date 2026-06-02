#!/usr/bin/env bash

MASTER=master
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! "$SCRIPT_DIR/is_master.sh"; then
	until ssh -o StrictHostKeyChecking=no $MASTER "kubectl get nodes >/dev/null 2>&1"; do
		sleep 5
	done

	JOIN_CMD=$(ssh -o StrictHostKeyChecking=no $MASTER "sudo kubeadm token create --print-join-command 2>/dev/null")
	sudo $JOIN_CMD

    exit 0
fi