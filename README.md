# my workstation configuration

## install packages
```
sudo apt-get update
sudo apt-get install -y \
flameshot \
curl \
git \
gitg \
htop \
safeeyes \
silversearcher-ag \
meld \
terminator \
tig \
tree
```


```
echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]$\[\033[0m\]'" >> ~/.bashrc
```

## gitconfig

```
cp .gitconfig ~/.gitconfig
```

## sublime
```
sudo snap install sublime-text --classic
```

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


fzf install
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## install neovim

```
sudo apt-get install -y neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ -d ~/.config/nvim/ ] || mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

nvim +PlugInstall +qall
```

## configure
git config --global core.editor "subl -n -w"
```

## terminator config

```
mkdir -p ~/.config/terminator
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


sudo apt-get update \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && sudo ./get_helm.sh \
    && rm get_helm.sh


sudo apt-get install -y bash-completion
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
sudo bash -c "kubectl completion bash >/etc/bash_completion.d/kubectl"
sudo echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc
```




Dock
https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu

# google sdk
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk



docker-compose:
```
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

docker-compose -v
```

