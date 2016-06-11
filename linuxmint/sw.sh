#!/bin/bash

echo -e "INFO: Adding PPAs"

# PPAs
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 > /dev/null 2>&1
sudo add-apt-repository -y ppa:vincent-c/cherrytree > /dev/null 2>&1
sudo add-apt-repository -y ppa:numix/ppa > /dev/null 2>&1
sudo add-apt-repository -y ppa:noobslab/themes > /dev/null 2>&1
sudo add-apt-repository -y ppa:noobslab/icons > /dev/null 2>&1
sudo add-apt-repository -y ppa:numix/ppa > /dev/null 2>&1
sudo add-apt-repository -y ppa:snwh/pulp > /dev/null 2>&1
sudo add-apt-repository -y ppa:eugenesan/ppa > /dev/null 2>&1

sleep 5

echo -e "INFO: Making sudo"

# granting sudo
usrnm=`whoami` > /dev/null 2>&1
echo "$usrnm ALL = NOPASSWD: ALL"
echo "chown root:root /etc/sudoers.d/$usrnm"
echo "chmod 0440 /etc/sudoers.d/$usrnm"

echo -e "INFO: Fixing supporting for locale en_us utf8"
sudo locale-gen --purge --no-archive > /dev/null 2>&1

echo -e "INFO: Installing software ..."

sudo apt-get update > /dev/null 2>&1
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
numix-bluish-theme \
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
wireshark > /dev/null 2>&1


echo -e "INFO: Updating && upgrading"
sudo apt-get update > /dev/null 2>&1 && sudo apt-get -y upgrade > /dev/null 2>&1

# bashrc
rm -rf ~/.bashrc
cp .bashrc ~/ 


echo -e "INFO: Configuring terminal!"
ls ~/.config/xfce4/terminal > /dev/null 2>&1
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

echo -e "INFO: For installing Pachage Control open subline, press 'ctrl + ~'' and paste code mensioned below: \n
import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by) 
\n"


# goldendict
echo -e "INFO: Configuring goldendict!"
rm -rf ~/.goldendict
cp -rf .goldendict ~/

echo -e "INFO: Succeed!"
