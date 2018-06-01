#!/bin/bash

username=$1
TZ=$2

ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

useradd -ms /bin/bash $username || true
usermod -aG sudo $username
usermod -aG docker $username

cat << EOF > /etc/sudoers.d/99_$username
$username ALL=(ALL) NOPASSWD:ALL
EOF

mkdir -p /etc/lightdm/lightdm.conf.d
cat << EOF > /etc/lightdm/lightdm.conf.d/50-autologin.conf
[SeatDefaults]
autologin-user=$username
EOF
