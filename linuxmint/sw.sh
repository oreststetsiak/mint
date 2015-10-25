#!/bin/bash

sudo apt-get install python-software-properties

# PPAs
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:vincent-c/cherrytree
sudo add-apt-repository -y ppa:webupd8team/haguichi
sudo add-apt-repository -y ppa:landronimirc/skippy-xd-daily
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:snwh/pulp

sleep 5

# sudo 
usrnm=`whoami`
sudo touch /etc/sudoers.d/$usrnm
sudo chown $usrnm:$usrnm /etc/sudoers.d/$usrnm
sudo echo "$usrnm ALL = NOPASSWD: ALL" > /etc/sudoers.d/$usrnm
sudo chown root:root /etc/sudoers.d/$usrnm
sudo chmod 0440 /etc/sudoers.d/$usrnm
sudo more /etc/sudoers.d/$usrnm

# fix linux mint no support for locale en_us utf8
sudo locale-gen --purge --no-archive


# soft
sudo apt-get update
sudo apt-get install -y \
sublime-text-installer \
cherrytree \
haguichi \
haguichi-appindicator \
skippy-xd \
numix-gtk-theme \
numix-bluish-theme \
faience-icon-theme \
numix-icon-theme-circle \
paper-gtk-theme \
paper-icon-theme \
git \
curl \
wget \
firefox \
ike \
ike-qtgui \
dropbox \
clipit \
chromium-browser \
midori \
thunderbird \
pidgin \
shutter \
htop \
filezilla \
virtualbox-nonfree \
openssh-server \
umit \
goldendict \
anki \
tree \
inkscape \
gitg \
keepassx \
rdesktop \
wireshark \
ipython \
remmina \
remmina-plugin-vnc \
remmina-plugin-rdp \
remmina-common \
mysql-workbench \
wine \
winetricks \
nagstamon \
meld \
libreoffice \
skype


sudo apt-get update && sudo apt-get -y upgrade

