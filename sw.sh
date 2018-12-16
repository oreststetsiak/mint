#!/bin/bash

echo -e "INFO: Adding PPAs"

# PPAs
sudo add-apt-repository -y ppa:slgobinath/safeeyes
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:snwh/pulp

echo -e "INFO: Fixing supporting for locale en_us utf8"
sudo locale-gen --purge --no-archive

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


echo -e "INFO: Configuring sublime!"
rm -rf mkdir -p ~/.config/sublime-text*
mkdir -p ~/.config/sublime-text-3/Packages/User/

cat sl_usr.conf > ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cat sl_pkgs.conf > ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings

curl -o ~/.config/sublime-text-3/Installed%20Packages/Package%20Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package

echo -e "INFO: Succeed!"
echo -e "\n\n\n"

echo -e "INFO: For installing Pachage Control open subline, press 'ctrl + ~'' and paste code mensioned below: \n\n
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
\n"