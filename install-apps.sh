#!/usr/bin/env bash

# snaps
sudo snap install chromium
sudo snap install gimp
sudo snap install intellij-idea-community --classic
sudo snap install keepassxc
sudo snap install kubectl --classic
sudo snap install sublime-text --classic
sudo snap install vlc
sudo snap install whatsdesk
sudo snap install shellcheck --edge
sudo snap install helm --classic
sudo snap install go --classic

# apt
sudo apt install 4kyoutubetomp3
sudo apt install caffeine
sudo apt install easytag
sudo apt install filezilla
sudo apt install guake
sudo apt install virtualbox
sudo apt install maven
sudo apt install terminator
sudo apt install golang-glide

# MINIKUBE
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.30.0/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube

# DOCKER
sudo snap install docker
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world

# ZSH
sudo apt install zsh
chsh -s $(which zsh)

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# add plugins for auto complete to ZSH
sed -i.bak 's/^plugins=.*/plugins=(zsh-autosuggestions zsh-syntax-highlighting kubectl/' $HOME/.zshrc

# BATS
git clone https://github.com/bats-core/bats-core.git
cd bats-core
sudo ./install.sh /usr/local
cd
