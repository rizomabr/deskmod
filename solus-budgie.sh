#!/bin/bash

# turn output on (echo)
set -x

# upgrade
sudo eopkg upgrade -y

# remove bloatware
sudo eopkg remove -y gnome-calendar gnome-mpv gnome-photos hexchat intel-microcode onboard orca thunderbird transmission

# install packages
sudo eopkg install -y atom conky deluge dropbox gimp hunspell-pt-br nautilus-dropbox paper-icon-theme steam vlc

# install third-party
sudo eopkg build -y --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg install -y mscorefonts*.eopkg;sudo rm mscorefonts*.eopkg

# install arc-solid-gtk-theme / deskmod settings
wget -O arc-solid.tar.xz https://www.archlinux.org/packages/community/any/arc-solid-gtk-theme/download/
mkdir .temp
tar -xf arc-solid.tar.xz -C .temp
sudo rm -r /usr/share/themes/Arc-Darker-solid
sudo mv -u .temp/usr/share/themes/Arc-Darker-solid /usr/share/themes/
rm -r .temp && rm arc-solid.tar.xz

# background / screensaver
sudo wget https://github.com/rizomabr/deskmod/raw/master/img/screensaver.png -O /usr/share/backgrounds/screensaver.png
sudo wget https://github.com/rizomabr/deskmod/raw/master/img/wallpaper.jpg -O /usr/share/backgrounds/wallpaper.jpg

# budgie-panel
sudo wget https://raw.githubusercontent.com/rizomabr/deskmod/master/budgie/solus.layout -O /usr/share/budgie-desktop/layouts/solus-fortitude.layout
wget https://raw.githubusercontent.com/rizomabr/deskmod/master/budgie/budgie-panel.dconf
dconf load /com/solus-project/budgie-panel/ < budgie-panel.dconf
rm ./budgie-panel.dconf
budgie-panel --replace &

# gsettings
gsettings set com.solus-project.budgie-panel builtin-theme true
gsettings set com.solus-project.budgie-panel layout 'solus-fortitude'
gsettings set com.solus-project.budgie-raven show-power-strip true
gsettings set com.solus-project.budgie-wm clear-notifications []
gsettings set com.solus-project.budgie-wm take-region-screenshot []
gsettings set com.solus-project.budgie-wm take-window-screenshot []
gsettings set com.solus-project.budgie-wm toggle-notifications []
gsettings set com.solus-project.budgie-wm toggle-raven []
gsettings set org.freedesktop.ibus.general.hotkey next-engine []
gsettings set org.freedesktop.ibus.general.hotkey trigger []
gsettings set org.freedesktop.ibus.general.hotkey next-engine-in-menu []
gsettings set org.freedesktop.ibus.general.hotkey triggers []
gsettings set org.freedesktop.ibus.panel.emoji hotkey []
gsettings set org.freedesktop.ibus.panel.emoji load-emoji-at-startup false
gsettings set org.freedesktop.ibus.panel.emoji unicode-hotkey []
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/wallpaper.jpg'
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.interface cursor-theme 'breeze-cursor'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Darker-solid'
gsettings set org.gnome.desktop.interface icon-theme 'Paper'
gsettings set org.gnome.desktop.interface menubar-accel ''
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
gsettings set org.gnome.desktop.wm.preferences theme 'Arc-Darker-solid'
gsettings set org.gnome.FileRoller.Dialogs.New default-extension '.zip'
gsettings set org.gnome.FileRoller.FileSelector show-hidden true
gsettings set org.gnome.gedit.plugins active-plugins []
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
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
gsettings set org.gnome.nautilus.desktop home-icon-name 'Computador'
gsettings set org.gnome.nautilus.desktop home-icon-visible true
gsettings set org.gnome.nautilus.desktop network-icon-name 'Rede'
gsettings set org.gnome.nautilus.desktop network-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-name 'Lixeira'
gsettings set org.gnome.nautilus.desktop trash-icon-visible true
gsettings set org.gnome.nautilus.preferences click-policy 'double'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
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
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window 'disabled'
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
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-1 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-10 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-2 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-3 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-4 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-5 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-6 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-7 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-8 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ switch-to-tab-9 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-in 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-normal 'disabled'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ zoom-out 'disabled'
gsettings set org.gtk.Settings.FileChooser date-format 'with-time'
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set x.dm.slick-greeter activate-numlock true
gsettings set x.dm.slick-greeter background '/usr/share/backgrounds/screensaver.png'
gsettings set x.dm.slick-greeter draw-grid true
gsettings set x.dm.slick-greeter icon-theme-name 'Paper'
gsettings set x.dm.slick-greeter show-a11y false
gsettings set x.dm.slick-greeter theme-name 'Arc-Darker-solid'
 
# bluetooth
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth

# conky
sudo wget https://raw.githubusercontent.com/rizomabr/deskmod/master/cfg/.conkyrc -O ${HOME}/.conkyrc
mkdir -p ${HOME}/.config/autostart/
sudo wget https://raw.githubusercontent.com/rizomabr/deskmod/master/cfg/conky.desktop -O ${HOME}/.config/autostart/conky.desktop

# gimp
gimp &
pkill gimp &
wget https://github.com/rizomabr/deskmod/raw/master/photogimp_doctormo.zip
unzip -o photogimp_doctormo.zip -d /home/$USER/.config/GIMP/2.10
rm photogimp_doctormo.zip

# libreoffice
wget https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBRV320AOC.oxt
libreoffice VeroptBRV320AOC.oxt &
rm VeroptBRV320AOC.oxt

# install proprietary drivers
dropbox start -i &
doflicky-ui & exit
