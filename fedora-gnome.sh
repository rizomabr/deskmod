#!/bin/bash

# turn output on (echo)
set -x

# update
sudo dnf update -y

# flatpak setup
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.discordapp.Discord com.dropbox.Client com.skype.Client com.valvesoftware.Steam org.videolan.VLC

# install packages
sudo dnf install -y arc-theme breeze-cursor-theme cabextract conky deluge gimp libreoffice paper-icon-theme

# install ms-fonts
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# remove bloats
sudo dnf remove -y cheese desktop-backgrounds-gnome gnome-boxes gnome-calendar gnome-clocks gnome-contacts gnome-maps gnome-photos gnome-weather totem orca

# remove useless gnome-shell-extensions
sudo dnf remove -y gnome-shell-extension-background-logo gnome-shell-extension-launch-new-instance gnome-shell-extension-places-menu gnome-shell-extension-window-list

# background / screensaver
sudo cp ./img/wallpaper.jpg /usr/share/backgrounds/wallpaper.jpg
sudo cp ./img/screensaver.png /usr/share/backgrounds/screensaver.png

# services
# systemctl stop accounts-daemon
# systemctl disable accounts-daemon
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth
# systemctl stop lvm2-monitor
# systemctl disable lvm2-monitor
# systemctl stop ModemManager
# systemctl disable ModemManager
# systemctl stop NetworkManager-wait-online
# systemctl disable NetworkManager-wait-online

# gsettings
gsettings set org.freedesktop.ibus.general.hotkey next-engine []
gsettings set org.freedesktop.ibus.general.hotkey next-engine-in-menu []
gsettings set org.freedesktop.ibus.general.hotkey trigger []
gsettings set org.freedesktop.ibus.general.hotkey triggers []
gsettings set org.freedesktop.ibus.panel.emoji hotkey []
gsettings set org.freedesktop.ibus.panel.emoji unicode-hotkey []
gsettings set org.gnome.clocks geolocation false
gsettings set org.gnome.clocks world-clocks [{'location': <(uint32 2, <('Leite Lopes, Ribeir Airport', 'SBRP', false, [(-0.36884624277037081, -0.83397648842685956)], @a(dd) [])>)>}]
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface cursor-theme 'breeze_cursors'
gsettings set org.gnome.desktop.interface icon-theme 'Paper'
gsettings set org.gnome.desktop.interface menubar-accel ''
gsettings set org.gnome.FileRoller.Dialogs.New default-extension '.zip'	
gsettings set org.gnome.FileRoller.FileSelector show-hidden true
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find-clear ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find-next ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find-previous ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ full-screen ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ move-tab-left ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ move-tab-right ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-window ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-1 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-10 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-2 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-3 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-4 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-5 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-6 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-7 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-8 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-9 ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-in ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-normal ''
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-out ''
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/wallpaper.jpg'
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/screensaver.png'
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent false
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
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up []
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu []
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog '["<Super>r"]'
gsettings set org.gnome.desktop.wm.keybindings show-desktop '["<Super>d"]'
gsettings set org.gnome.desktop.wm.keybindings switch-applications '["<Alt>Tab"]'
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
gsettings set org.gnome.desktop.wm.keybindings switch-windows '["<Alt>tab"]'
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized []
gsettings set org.gnome.desktop.wm.keybindings unmaximize []
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
gsettings set org.gnome.desktop.wm.preferences theme 'Adwaita'
gsettings set org.gnome.gedit.plugins active-plugins []
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.login-screen logo '/usr/share/pixmaps/fedora-gdm-logo.png'
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.mutter.keybindings rotate-monitor []
gsettings set org.gnome.mutter.keybindings switch-monitor '["<Super>p"]'
gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-1 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-10 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-11 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-12 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-2 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-3 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-4 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-5 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-6 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-7 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-8 []		
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-9 []		
gsettings set org.gnome.nautilus.desktop home-icon-name 'Computador'		
gsettings set org.gnome.nautilus.desktop network-icon-name 'Rede'		
gsettings set org.gnome.nautilus.desktop network-icon-visible true		
gsettings set org.gnome.nautilus.desktop trash-icon-name 'Lixeira'		
gsettings set org.gnome.nautilus.preferences click-policy 'double'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-delete-permanently true
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.settings-daemon.peripherals.keyboard numlock-state 'on'		
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys eject ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys email ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>e'		
gsettings set org.gnome.settings-daemon.plugins.media-keys logout '<Control><Alt>Delete'		
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier-zoom-in ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier-zoom-out ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys media ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys next ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys pause ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys play ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys previous ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys screencast ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys screenreader ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot-clip ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys search ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys stop ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot-clip ''		
gsettings set org.gnome.settings-daemon.plugins.media-keys www ''		
gsettings set org.gnome.shell favorite-apps []		
gsettings set org.gnome.shell.extensions.user-theme name 'Arc-Dark-solid'
gsettings set org.gnome.shell.keybindings focus-active-notification []		
gsettings set org.gnome.shell.keybindings open-application-menu []		
gsettings set org.gnome.shell.keybindings toggle-application-view []		
gsettings set org.gnome.shell.keybindings toggle-message-tray []		
gsettings set org.gnome.shell.keybindings toggle-overview []		
gsettings set org.gnome.shell.overrides dynamic-workspaces false		
gsettings set org.gtk.Settings.FileChooser date-format 'with-time'
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

# conky
cp ./cfg/.conkyrc ${HOME}/.conkyrc
mkdir -p ${HOME}/.config/autostart/
cp ./cfg/conky.desktop ${HOME}/.config/autostart/conky.desktop

# Run Dropbox
# dropbox start -i &>/dev/null &
