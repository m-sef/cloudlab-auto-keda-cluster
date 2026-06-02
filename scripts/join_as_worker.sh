#!/usr/bin/env bash

MASTER=master

if ! ./is_master.sh; then
	until ssh -o StrictHostKeyChecking=no $MASTER "kubectl get nodes >/dev/null 2>&1"; do
		sleep 5
	done

	JOIN_CMD=$(ssh -o StrictHostKeyChecking=no $MASTER "sudo kubeadm token create --print-join-command 2>/dev/null")
	sudo $JOIN_CMD

    exit 0
fi