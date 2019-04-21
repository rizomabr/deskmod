#!/bin/bash

# turn output on (echo)
set -x

# update
sudo apt update && sudo apt upgrade -y

# install packages
sudo apt install -y breeze-cursor-theme deluge dropbox mint-meta-codecs nemo-dropbox skypeforlinux steam tlp tlp-rdw

# remove bloatware
sudo apt purge --auto-remove -y gnome-calendar hexchat mintwelcome onboard pix thunderbird timeshift transmission tomboy

# install paper-icon-theme
sudo add-apt-repository ppa:snwh/ppa
sudo apt-get update
sudo apt install paper-icon-theme

# turn bluetooth off by default
gsettings set org.blueberry obex-enabled false
gsettings set org.blueberry tray-enabled false

# change background
gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/linuxmint/default_background.jpg'
gsettings set org.cinnamon.desktop.background picture-options 'centered'

# show date on panel's clock
gsettings set org.cinnamon.desktop.interface clock-show-date true

# cursor theme
gsettings set org.cinnamon.desktop.interface cursor-theme 'DMZ-White'

# gtk / icons / cursor theming
gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Darker-Grey'
gsettings set org.cinnamon.desktop.interface icon-theme 'Paper'
gsettings set org.cinnamon.desktop.interface cursor-theme 'breeze_cursors'

# keybindings
gsettings set org.cinnamon.desktop.keybindings looking-glass-keybinding []
gsettings set org.cinnamon.desktop.keybindings magnifier-zoom-in []
gsettings set org.cinnamon.desktop.keybindings magnifier-zoom-out []
gsettings set org.cinnamon.desktop.keybindings show-desklets []
gsettings set org.cinnamon.desktop.keybindings.wm activate-window-menu []
gsettings set org.cinnamon.desktop.keybindings.wm begin-move []
gsettings set org.cinnamon.desktop.keybindings.wm begin-resize []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-monitor-down []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-monitor-left []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-monitor-right []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-monitor-up []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-workspace-down []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-workspace-left []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-workspace-right []
gsettings set org.cinnamon.desktop.keybindings.wm move-to-workspace-up []
gsettings set org.cinnamon.desktop.keybindings.wm panel-run-dialog ['<Super>r']
gsettings set org.cinnamon.desktop.keybindings.wm push-snap-down []
gsettings set org.cinnamon.desktop.keybindings.wm push-snap-left []
gsettings set org.cinnamon.desktop.keybindings.wm push-snap-right []
gsettings set org.cinnamon.desktop.keybindings.wm push-snap-up []
gsettings set org.cinnamon.desktop.keybindings.wm switch-group []
gsettings set org.cinnamon.desktop.keybindings.wm switch-panels []
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-down []
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-left []
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-right []
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-up []
gsettings set org.cinnamon.desktop.keybindings.wm toggle-maximized []
gsettings set org.cinnamon.desktop.keybindings.wm toggle-recording []
gsettings set org.cinnamon.desktop.keybindings.wm unmaximize []

# cinnamon panel
gsettings set com.linuxmint.mintmenu applet-icon '/usr/share/icons/hicolor/scalable/apps/cinnamon-symbolic.svg'
gsettings set org.cinnamon enabled-applets ['panel1:left:0:menu@cinnamon.org:33', 'panel1:left:1:window-list@cinnamon.org:35', 'panel1:right:1:betterlock:36', 'panel1:right:8:calendar@cinnamon.org:37', 'panel1:right:3:network@cinnamon.org:38', 'panel1:right:7:notifications@cinnamon.org:39', 'panel1:right:6:power@cinnamon.org:41', 'panel1:right:4:removable-drives@cinnamon.org:42', 'panel1:right:2:sound@cinnamon.org:43', 'panel1:right:0:systray@cinnamon.org:45']

# workspaces
gsettings set org.cinnamon.desktop.wm.preferences num-workspaces 1

# numlock
gsettings set org.cinnamon.settings-daemon.peripherals.keyboard numlock-state 'on'

# applets
wget https://cinnamon-spices.linuxmint.com/files/desklets/bbcwx@oak-wood.co.uk.zip
unzip betterlock.zip -d ~/.local/share/cinnamon/desklets
wget https://cinnamon-spices.linuxmint.com/files/applets/betterlock.zip
unzip betterlock.zip -d ~/.local/share/cinnamon/applets
