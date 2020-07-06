#!/bin/bash

echo -e "INFO: Adding PPAs"

# PPAs
sudo add-apt-repository -y ppa:slgobinath/safeeyes

echo -e "INFO: Installing software ..."

sudo apt-get update
sudo apt-get install -y \
clipit \
flameshot \
git \
gitg \
htop \
inkscape \
meld \
openssh-server \
safeeyes \
silversearcher-ag \
sublime-text \
terminator \
tig \
tree

cp -rf .themes ~/.themes

echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]$\[\033[0m\]'" >> ~/.bashrc

cd ~/coding/
git clone https://github.com/chriskempson/base16-xfce4-terminal
cd base16-xfce4-terminal
./convert2themes
sudo cp themes/*.theme /usr/share/xfce4/terminal/colorschemes/
rm -rf ~/coding/base16-xfce4-terminal

# install sublime
mkdir -p ~/.config/sublime-text-3/Installed\ Packages/
cd ~/.config/sublime-text-3/Installed\ Packages/
wget https://packagecontrol.io/Package%20Control.sublime-package

cd -
mkdir -p ~/.config/sublime-text-3/Packages/User/
cat sl_usr.conf > ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cat sl_pkgs.conf > ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings


# install neovim

sudo apt-get install neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ -d ~/.config/nvim/ ] || mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

nvim +PlugInstall +qall

cp terminator_conf.txt ~/.config/terminator/config
