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

# bashrc
rm -rf ~/.bashrc
cp .bashrc ~/

cp -rf .themes ~/.themes

echo -e "INFO: Configuring terminal!"
ls ~/.config/xfce4/terminal
if [ $? -ne 0 ]; then
    mkdir -p ~/.config/xfce4/terminal
fi
cat term > ~/.config/xfce4/terminal/terminalrc

cd ~/coding/
git clone https://github.com/chriskempson/base16-xfce4-terminal
cd base16-xfce4-terminal
./convert2themes
sudo cp themes/*.theme /usr/share/xfce4/terminal/colorschemes/
