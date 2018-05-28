#!/bin/bash

curl -fsSL https://download.docker.com/linux/debian/gpg \
   | gpg --dearmor \
   > /etc/apt/trusted.gpg.d/docker.gpg
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
   > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-ce
