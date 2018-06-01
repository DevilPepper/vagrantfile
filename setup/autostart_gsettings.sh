#!/bin/bash

# autostart trick found at https://help.ubuntu.com/community/UbuntuLTSP/DisableScreenLock
cat << EOF > /etc/xdg/autostart/set-gnome-settings.sh.desktop
[Desktop Entry]
Type=Application
Exec=/vagrant/script/dconf.sh '$1' '$2'
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Apply Gnome Settings
Comment=Apply Gnome Settings at next restart
EOF

service lightdm restart
