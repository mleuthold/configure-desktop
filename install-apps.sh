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
sudo snap install go --classic
sudo snap install ansible-kz6fittycent --edge
sudo snap install ruby --classic
sudo snap install opera
sudo snap install drawio --edge
sudo snap install task --classic

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
sudo apt install libghc-yaml-dev # yaml2json
sudo apt install ansible
sudo apt install i3lock-fancy

# TERRAFORM
wget https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip
unzip terraform_0.12.9_linux_amd64.zip
sudo mv terraform /usr/local/bin/
sudo chown root:root /usr/local/bin/terraform
sudo chmod 755 /usr/local/bin/terraform

# TERRAGRUNT
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.19.24/terragrunt_linux_amd64
sudo mv terragrunt_linux_amd64 /usr/local/bin/terragrunt
sudo chown root:root /usr/local/bin/terragrunt
sudo chmod 755 /usr/local/bin/terragrunt

# HELM
curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

# MINIKUBE
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.30.0/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube
minikube config set cpus 4
minikube config set memory 10240

# DOCKER
# https://unix.stackexchange.com/questions/363048/unable-to-locate-package-docker-ce-on-a-64bit-ubuntu
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt install docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world

# DOCKER-COMPOSE
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# bash completion
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
# zsh completion


# ZSH
sudo apt install zsh
chsh -s $(which zsh)

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# add plugins for auto complete to ZSH
sed -i.bak 's/^plugins=.*/plugins=(zsh-autosuggestions zsh-syntax-highlighting kubectl kubetail git sudo docker docker-compose)/' $HOME/.zshrc

# BATS
git clone https://github.com/bats-core/bats-core.git
cd bats-core
sudo ./install.sh /usr/local
cd

# NVM NodeJS
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# into ~/.zshrc
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GRADLE
wget https://services.gradle.org/distributions/gradle-5.0-bin.zip
sudo mkdir -p /opt/gradle
sudo unzip -d /opt/gradle gradle-5.0-bin.zip
export PATH=$PATH:/opt/gradle/gradle-5.0/bin
gradle -v
