#!/usr/bin/env bash

echo "off" | sudo tee /sys/devices/system/cpu/smt/control

exit 0