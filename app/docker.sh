#!/bin/bash

DOCKER_RELEASE=""
COMPOSE_RELEASE="1.21.2"

curl -fsSL https://download.docker.com/linux/debian/gpg \
   | gpg --dearmor \
   > /etc/apt/trusted.gpg.d/docker.gpg
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
   > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-ce

sudo curl -L https://github.com/docker/compose/releases/download/$COMPOSE_RELEASE/docker-compose-$(uname -s)-$(uname -m) \
          -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
