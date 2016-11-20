#!/bin/bash

echo -e "INFO: Adding PPAs"

# PPAs
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:vincent-c/cherrytree
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:snwh/pulp
sudo add-apt-repository -y ppa:eugenesan/ppa

sleep 3

echo -e "INFO: Fixing supporting for locale en_us utf8"
sudo locale-gen --purge --no-archive

echo -e "INFO: Installing software ..."

echo -e "INFO: Removing xscreensaver"
sudo apt-get remove -y xscreensaver \
xscreensaver-data-extra \
xscreensaver-gl-extra

sudo apt-get install -y \
sublime-text-installer \
cherrytree \
chromium-browser \
clipit \
curl \
dropbox \
faience-icon-theme \
firefox \
git \
gitg \
goldendict \
gnupg2 \
htop \
inkscape \
ipython \
keepassx \
libreoffice \
meld \
mysql-workbench \
numix-gtk-theme \
numix-icon-theme-circle \
openssh-server \
paper-gtk-theme \
paper-icon-theme \
python-gpgme \
rdesktop \
shutter \
skype \
thunderbird \
tree \
wget \
wine \
winetricks \
wireshark \
gnome-screensaver \
qemu-system \
qemu-utils \
libvirt-bin \
virt-manager \
python-spice-client-gtk \
virt-viewer


# bashrc
rm -rf ~/.bashrc
cp .bashrc ~/ 


echo -e "INFO: Configuring terminal!"
ls ~/.config/xfce4/terminal
if [ $? -ne 0 ]; then
    mkdir -p ~/.config/xfce4/terminal
fi
cat term > ~/.config/xfce4/terminal/terminalrc


echo -e "INFO: Configuring sublime!"
ls ~/.config/sublime-text-3/Packages/User/ > /dev/null 2>&1
if [ $? -ne 0 ]; then
    mkdir -p ~/.config/sublime-text-3/Packages/User/
fi

cat sl_usr.conf > ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cat sl_pkgs.conf > ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings

# goldendict
echo -e "INFO: Configuring goldendict!"
sudo rm -rf ~/.goldendict
cp -rf .goldendict ~/

echo -e "INFO: Succeed!"
echo -e "\n\n\n"
echo -e "INFO: gnome-screensaver-command --lock - for lock screen\n"
echo -e "INFO: For installing Pachage Control open subline, press 'ctrl + ~'' and paste code mensioned below: \n\n
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by) 
\n"
