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

# apt
sudo apt install 4kyoutubetomp3
sudo apt install caffeine
sudo apt install easytag
sudo apt install filezilla
sudo apt install guake
sudo apt install virtualbox

# MINIKUBE
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.30.0/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube

# DOCKER
sudo snap install docker
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world