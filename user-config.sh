#!/bin/bash

username=stuff
dotfiles="https://github.com/SupaStuff/dotfiles.git --branch=dev"
dockerfiles="https://github.com/SupaStuff/dockerfiles.git"

useradd -ms /bin/bash $username || true
usermod -aG sudo $username
usermod -aG docker $username

cat << EOF >/etc/sudoers.d/99_$username
$username ALL=(ALL) NOPASSWD:ALL
EOF

mkdir -p /etc/lightdm/lightdm.conf.d
cat << EOF > /etc/lightdm/lightdm.conf.d/50-autologin.conf
[SeatDefaults]
autologin-user=$username
EOF

su $username
cd /home/$username
[[ -d dotfiles ]] || rm .bashrc
git clone $dotfiles || true
cd dotfiles
stow * || true
git clone $dockerfiles || true
