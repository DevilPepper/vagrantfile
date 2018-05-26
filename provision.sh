#!/bin/bash

apt-get update

# regular applications
apt-get install -y cinnamon \
                   git \
                   lightdm \
                   stow \
                   tzdata \
                   vim

# Needed for adding apt repos
apt-get install -y apt-transport-https \
                   ca-certificates \
                   curl \
                   gnupg2 \
                   software-properties-common
