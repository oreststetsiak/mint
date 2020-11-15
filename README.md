# my workstation configuration

## install packages
```
sudo add-apt-repository -y ppa:slgobinath/safeeyes

sudo apt-get update
sudo apt-get install -y \
clipit \
flameshot \
git \
gitg \
htop \
safeeyes \
silversearcher-ag \
sublime-text \
terminator \
tig \
tree

cp -rf .themes ~/.themes

echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]$\[\033[0m\]'" >> ~/.bashrc
```


## sublime

### configuration:
```
crtl+shift+P --> Install Package Control
crtl+P --> Package Control: Install Package --> Sync Settings
crtl+P --> Sync Settings: Edit User Settings
```
and put this:
```
{
    "gist_id": "80ddbbd5c2a5e67670d4bb15a289fffb"
}

```
install plugins:
```
crtl+P --> Sync Settings: Download
```


## install neovim

```
sudo apt-get install neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ -d ~/.config/nvim/ ] || mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

nvim +PlugInstall +qall
```

## configure terminal

```
cd ~/coding/
git clone https://github.com/chriskempson/base16-xfce4-terminal
cd base16-xfce4-terminal
./convert2themes
sudo cp themes/*.theme /usr/share/xfce4/terminal/colorschemes/
rm -rf ~/coding/base16-xfce4-terminal
```

```
cat terminalrc.conf ~/.config/xfce4/terminal/terminalrc
```

## terminator config

```
cat terminator.conf > ~/.config/terminator/config
```

## k8s stuff

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/bin/
```
