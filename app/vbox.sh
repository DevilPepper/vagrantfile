#!/bin/bash

echo "deb http://ftp.debian.org/debian stretch-backports main contrib" \
   > /etc/apt/sources.list.d/stretch-backports.list
apt update
apt install -y linux-headers-$(uname -r) \
               virtualbox-guest-dkms \
               virtualbox-guest-x11
