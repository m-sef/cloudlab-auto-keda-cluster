#!/usr/bin/env bash

sudo snap install helm --classic

# Workaround for "home directories outside of /home needs configuration." snap error
sudo snap set system homedirs=~/..

exit 0