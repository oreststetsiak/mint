#!/bin/bash


echo -e "INFO: Adding PPAs"

sudo apt-get install python-software-properties > /dev/null 2>&1
# PPAs
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 > /dev/null 2>&1
sudo add-apt-repository -y ppa:vincent-c/cherrytree > /dev/null 2>&1
sudo add-apt-repository -y ppa:webupd8team/haguichi > /dev/null 2>&1
sudo add-apt-repository -y ppa:landronimirc/skippy-xd-daily > /dev/null 2>&1
sudo add-apt-repository -y ppa:numix/ppa > /dev/null 2>&1
sudo add-apt-repository -y ppa:noobslab/themes > /dev/null 2>&1
sudo add-apt-repository -y ppa:noobslab/icons > /dev/null 2>&1
sudo add-apt-repository -y ppa:numix/ppa > /dev/null 2>&1
sudo add-apt-repository -y ppa:snwh/pulp > /dev/null 2>&1

sleep 5

echo -e "INFO: Making sudo"

# sudo 
usrnm=`whoami` > /dev/null 2>&1
sudo touch /etc/sudoers.d/$usrnm > /dev/null 2>&1
sudo chown $usrnm:$usrnm /etc/sudoers.d/$usrnm > /dev/null 2>&1
sudo echo "$usrnm ALL = NOPASSWD: ALL" > /etc/sudoers.d/$usrnm > /dev/null 2>&1
sudo chown root:root /etc/sudoers.d/$usrnm > /dev/null 2>&1
sudo chmod 0440 /etc/sudoers.d/$usrnm > /dev/null 2>&1
sudo more /etc/sudoers.d/$usrnm > /dev/null 2>&1

echo -e "INFO: Fixing supporting for locale en_us utf8"
# fix linux mint no support for locale en_us utf8
sudo locale-gen --purge --no-archive > /dev/null 2>&1

echo -e "INFO: Installing software ..."
# soft
sudo apt-get update
sudo apt-get install -y \
sublime-text-installer \
cherrytree \
python-gpgme \
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
skype > /dev/null 2>&1


echo -e "INFO: Updating && upgrading"
sudo apt-get update > /dev/null 2>&1 && sudo apt-get -y upgrade > /dev/null 2>&1

echo -e "INFO: Configuring terminal!"
cat term > ~/.config/xfce4/terminal/terminalrc > /dev/null 2>&1

echo -e "INFO: Configuring sublime!"

ls ~/.config/sublime-text-3/Packages/User/ > /dev/null 2>&1
if [ $? -ne 0 ]; then
    mkdir -p ~/.config/sublime-text-3/Packages/User/
fi

cat sublime.conf > ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings > /dev/null 2>&1


echo -e "INFO: Scseed!"
