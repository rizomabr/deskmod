#!/bin/bash

# turn output on (echo)
set -x

# upgrade
sudo eopkg upgrade -y

# remove bloatware
sudo eopkg remove -y eog hexchat gnome-calendar gnome-mpv thunderbird transmission

# install packages
sudo eopkg install -y dropbox gimp hunspell-pt-br paper-icon-theme steam vlc

# install arc-solid-gtk-theme / deskmod settings
wget -O arc-solid.tar.xz https://www.archlinux.org/packages/community/any/arc-solid-gtk-theme/download/
mkdir .temp
tar -xf arc-solid.tar.xz -C .temp
sudo rm -r /usr/share/themes/Arc-Dark-solid
sudo mv -u .temp/usr/share/themes/Arc-Dark-solid /usr/share/themes/
rm -r .temp && rm arc-solid.tar.xz
sudo wget https://raw.githubusercontent.com/rizomabr/deskmod/master/deskmod.layout -O /usr/share/budgie-desktop/layouts/solus-fortitude.layout
budgie-panel --reset --replace &

# ms-fonts
sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg install -y mscorefonts*.eopkg;sudo rm mscorefonts*.eopkg

# general
gsettings set com.solus-project.budgie-raven show-power-strip true
gsettings set com.solus-project.software-center check-updates false
gsettings set com.solus-project.software-center fetch-media false
gsettings set com.solus-project.software-center update-frequency 'weekly'

# desktop preferences
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark-solid'
gsettings set org.gnome.desktop.interface icon-theme 'Paper'
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

# keybindings
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu []
gsettings set org.gnome.desktop.wm.keybindings begin-move []
gsettings set org.gnome.desktop.wm.keybindings begin-resize []
gsettings set org.gnome.desktop.wm.keybindings cycle-group []
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward []
gsettings set org.gnome.desktop.wm.keybindings cycle-panels []
gsettings set org.gnome.desktop.wm.keybindings cycle-panels-backward []
gsettings set org.gnome.desktop.wm.keybindings cycle-windows []
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward []
gsettings set org.gnome.desktop.wm.keybindings minimize []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up []
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu []
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Super>r']"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-group []
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-input-source []
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-panels []
gsettings set org.gnome.desktop.wm.keybindings switch-panels-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up []
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized []
gsettings set org.gnome.desktop.wm.keybindings unmaximize []

# budgie settings
gsettings set com.solus-project.budgie-panel builtin-theme false

# nautilus
gsettings set org.gnome.nautilus.desktop home-icon-name 'Computador'
gsettings set org.gnome.nautilus.desktop home-icon-visible true
gsettings set org.gnome.nautilus.desktop network-icon-name 'Rede'
gsettings set org.gnome.nautilus.desktop network-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-name 'Lixeira'
gsettings set org.gnome.nautilus.desktop trash-icon-visible true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# slick-greeter
gsettings set x.dm.slick-greeter activate-numlock true

# install proprietary drivers
doflicky-ui
