#!/bin/bash

gsettings set org.gnome.Terminal.Legacy.Settings theme-variant "dark"
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode "tab"
gsettings set org.gnome.Terminal.Legacy.Settings mnemonics-enabled true
gsettings set org.cinnamon.desktop.screensaver lock-enabled false
gsettings set org.cinnamon.desktop.background picture-uri \
"file:///usr/share/desktop-base/lines-theme/wallpaper/gnome-background.xml"
# gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

# remove autostart after running this script once
sudo rm -f /etc/xdg/autostart/set-gnome-settings.sh.desktop
