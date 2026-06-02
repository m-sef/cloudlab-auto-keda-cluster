#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! "$SCRIPT_DIR/init_as_master.sh"; then
    "$SCRIPT_DIR/join_as_worker.sh"

    exit 0
fi

exit 1