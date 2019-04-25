#!/bin/bash

# turn output on (echo)
set -x

# remove sudo timeout
sudo sed -i -e "s+#includedir /etc/sudoers.d+#includedir /etc/sudoers.d\n\nDefaults  env_reset,timestamp_timeout=-1+g" /etc/sudoers

# upgrade
sudo eopkg upgrade -y

# remove bloatware
sudo eopkg remove -y eog hexchat gnome-calendar gnome-mpv thunderbird transmission

# install packages
sudo eopkg install -y deluge dropbox gimp hunspell-pt-br paper-icon-theme steam vlc

# install third-party
sudo eopkg build -y --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/im/skype/pspec.xml
sudo eopkg install -y skype*.eopkg;sudo rm *.eopkg
sudo eopkg build -y --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg install -y mscorefonts*.eopkg;sudo rm mscorefonts*.eopkg

# install arc-solid-gtk-theme / deskmod settings
wget -O arc-solid.tar.xz https://www.archlinux.org/packages/community/any/arc-solid-gtk-theme/download/
mkdir .temp
tar -xf arc-solid.tar.xz -C .temp
sudo rm -r /usr/share/themes/Arc-Dark-solid
sudo mv -u .temp/usr/share/themes/Arc-Dark-solid /usr/share/themes/
rm -r .temp && rm arc-solid.tar.xz

# extensions
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/
gnome-shell-extension-tool -d alternate-tab
gnome-shell-extension-tool -d apps-menu
gnome-shell-extension-tool -d auto-move-windows
gnome-shell-extension-tool -d dash-to-dock
gnome-shell-extension-tool -d example
gnome-shell-extension-tool -d launch-new-instance
gnome-shell-extension-tool -d native-window-placement
gnome-shell-extension-tool -d Onboard_Indicator
gnome-shell-extension-tool -d places-menu
gnome-shell-extension-tool -d screenshot-window-sizer
gnome-shell-extension-tool -d window-list
gnome-shell-extension-tool -d windowsNavigator
gnome-shell-extension-tool -d workspace-indicator
sudo rm -rf /usr/share/gnome-shell/extensions/alternate-tab@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/apps-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/auto-move-windows@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com
sudo rm -rf /usr/share/gnome-shell/extensions/example@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/launch-new-instance@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/native-window-placement@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/Onboard_Indicator@onboard.org
sudo rm -rf /usr/share/gnome-shell/extensions/places-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/window-list@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/windowsNavigator@gnome-shell-extensions.gcampax.github.com
sudo rm -rf /usr/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-installer 1160
gnome-shell-extension-installer 1228
gnome-shell-extension-tool -e dash-to-panel
gnome-shell-extension-tool -e arc-menu
gsettings --schemadir ~/.local/share/gnome-shell/extensions/arc-menu@linxgem33.com/schemas set org.gnome.shell.extensions.arc-menu menu-button-appearance 'Text'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/arc-menu@linxgem33.com/schemas set org.gnome.shell.extensions.arc-menu disable-activities-hotcorner true
gsettings --schemadir ~/.local/share/gnome-shell/extensions/arc-menu@linxgem33.com/schemas set org.gnome.shell.extensions.arc-menu menu-button-appearance 'Icon'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/arc-menu@linxgem33.com/schemas set org.gnome.shell.extensions.arc-menu menu-button-icon 'System_Icon'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel appicon-margin 0
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel appicon-padding 8
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel dot-size 0
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel focus-highlight true
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel group-apps false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel group-apps-label-font-size 13
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel location-clock 'STATUSRIGHT'
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel multi-monitors false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel panel-size 32
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel show-activities-button false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel show-favorites false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel show-show-apps-button false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel show-showdesktop-button false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas set org.gnome.shell.extensions.dash-to-panel stockgs-keep-dash true

# background / screensaver
sudo cp ./img/wallpaper.jpg /usr/share/backgrounds/wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/wallpaper.jpg'
sudo cp ./img/screensaver.png /usr/share/backgrounds/screensaver.png
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/screensaver.png'

# reset ibus hotkeys
gsettings set org.freedesktop.ibus.general.hotkey next-engine []
gsettings set org.freedesktop.ibus.general.hotkey next-engine-in-menu []
gsettings set org.freedesktop.ibus.general.hotkey trigger []
gsettings set org.freedesktop.ibus.general.hotkey triggers []
gsettings set org.freedesktop.ibus.panel.emoji hotkey []
gsettings set org.freedesktop.ibus.panel.emoji unicode-hotkey []

# desktop
gsettings set org.gnome.desktop.background show-desktop-icons true

# interface
gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark-solid'
gsettings set org.gnome.desktop.interface icon-theme 'Paper'
gsettings set org.gnome.desktop.interface menubar-accel ''

# sound
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent false

# custom wm keybindings
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
gsettings set org.gnome.desktop.wm.keybindings switch-applications []
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
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
gsettings set org.gnome.desktop.wm.preferences theme 'Plata-Noir'

# file-roller
gsettings set org.gnome.FileRoller.Dialogs.New default-extension '.zip'
gsettings set org.gnome.FileRoller.FileSelector show-hidden true

# gedit
gsettings set org.gnome.gedit.plugins active-plugins []
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true

# login screen
gsettings set org.gnome.login-screen enable-fingerprint-authentication false
gsettings set org.gnome.login-screen enable-smartcard-authentication false

# mutter
gsettings set org.gnome.mutter.keybindings rotate-monitor []
gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-1 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-2 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-3 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-4 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-5 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-6 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-7 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-8 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-9 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-10 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-11 []
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-12 []

# nautilus
gsettings set org.gnome.nautilus.desktop home-icon-name 'Computador'
gsettings set org.gnome.nautilus.desktop network-icon-name 'Rede'
gsettings set org.gnome.nautilus.desktop network-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-name 'Lixeira'
gsettings set org.gnome.nautilus.preferences click-policy 'double'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# settings-daemon
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

# shell
gsettings set org.gnome.shell favorite-apps []
gsettings set org.gnome.shell.extensions.net.gfxmonk.impatience speed-factor 0.5
gsettings set org.gnome.shell.extensions.user-theme name 'Arc-Dark-solid'
gsettings set org.gnome.shell.keybindings focus-active-notification []
gsettings set org.gnome.shell.keybindings open-application-menu []
gsettings set org.gnome.shell.keybindings toggle-application-view []
gsettings set org.gnome.shell.keybindings toggle-message-tray []
gsettings set org.gnome.shell.keybindings toggle-overview []
gsettings set org.gnome.shell.overrides dynamic-workspaces false

# terminal
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find-clear 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find-next 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find-previous 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ full-screen 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ move-tab-left 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ move-tab-right 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-window 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-1 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-2 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-3 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-4 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-5 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-6 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-7 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-8 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-9 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-10 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-in 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-normal 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-out 'disabled'

# gtk
gsettings set org.gtk.Settings.FileChooser date-format 'with-time'
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

# install proprietary drivers
dropbox start -i
doflicky-ui
