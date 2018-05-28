#!/bin/bash

curl -L https://packagecloud.io/AtomEditor/atom/gpgkey \
   | gpg --dearmor \
   > /etc/apt/trusted.gpg.d/atom.gpg
echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" \
   > /etc/apt/sources.list.d/atom.list
apt-get update
apt-get install -y --no-install-recommends atom
