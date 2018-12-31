#!/bin/bash

echo -e "INFO: Adding PPAs"

# PPAs
sudo add-apt-repository -y ppa:slgobinath/safeeyes
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:snwh/pulp

echo -e "INFO: Installing software ..."

sudo apt-get update
sudo apt-get install -y \
silversearcher-ag \
arc-icons \
arc-theme \
safeeyes \
clipit \
faience-icon-theme \
git \
tig \
gitg \
htop \
inkscape \
ipython \
keepassx \
libreoffice \
meld \
numix-gtk-theme \
numix-icon-theme-circle \
openssh-server \
paper-icon-theme \
shutter \
tree \
wireshark


cp -rf .themes ~/.themes

echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]$\[\033[0m\]'" >> ~/.bashrc

cd ~/coding/
git clone https://github.com/chriskempson/base16-xfce4-terminal
cd base16-xfce4-terminal
./convert2themes
sudo cp themes/*.theme /usr/share/xfce4/terminal/colorschemes/

mkdir -p ~/.config/sublime-text-3/Installed\ Packages/
cd ~/.config/sublime-text-3/Installed\ Packages/
wget https://packagecontrol.io/Package%20Control.sublime-package

cd -
mkdir -p ~/.config/sublime-text-3/Packages/User/
cat sl_usr.conf > ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cat sl_pkgs.conf > ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings


