#!/bin/bash

dotfiles=$1
dockerfiles=$2

gsettings set org.gnome.Terminal.Legacy.Settings theme-variant "dark"
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode "tab"
gsettings set org.gnome.Terminal.Legacy.Settings mnemonics-enabled true
gsettings set org.cinnamon.desktop.screensaver lock-enabled false
gsettings set org.cinnamon.desktop.background picture-uri \
"file:///usr/share/desktop-base/lines-theme/wallpaper/gnome-background.xml"
# gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

cd $HOME
[[ -d dotfiles ]] || rm .bashrc
git clone $dotfiles || true
cd dotfiles
stow * || true
cd ..
git clone $dockerfiles || true
mkdir stuff code || true
mv Documents Downloads Music Pictures Template Videos stuff || true

# remove autostart after running this script once
sudo rm -f /etc/xdg/autostart/set-gnome-settings.sh.desktop
