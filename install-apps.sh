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
sudo snap install drawio
sudo snap install task --classic
sudo snap install teams-for-linux

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
sudo apt install pass

# TERRAFORM
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
sudo ln -s ~/.tfenv/bin/* /usr/local/bin
tfenv install 0.12.20

# TERRAGRUNT
git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
sudo ln -s ~/.tgenv/bin/* /usr/local/bin
tgenv install 0.21.11

# TERRAFORM - KAFKA PROVIDER
TERRAFORM_KAFKA_PROVIDER_VERSION=0.2.3
wget https://github.com/Mongey/terraform-provider-kafka/releases/download/v"$TERRAFORM_KAFKA_PROVIDER_VERSION"/terraform-provider-kafka_"$TERRAFORM_KAFKA_PROVIDER_VERSION"_linux_amd64.tar.gz \
   && tar -xf terraform-provider-kafka_"$TERRAFORM_KAFKA_PROVIDER_VERSION"_linux_amd64.tar.gz \
   && mkdir --parents ~/.terraform.d/plugins \
   && mv terraform-provider-kafka_v"$TERRAFORM_KAFKA_PROVIDER_VERSION" ~/.terraform.d/plugins/

# HELM
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

# MINIKUBE
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
   && sudo install minikube-linux-amd64 /usr/local/bin/minikube
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

wget https://github.com/docker/docker-credential-helpers/releases/download/v0.6.3/docker-credential-pass-v0.6.3-amd64.tar.gz \
   && tar -xf docker-credential-pass-v0.6.3-amd64.tar.gz \
   && chmod +x docker-credential-pass \
   && sudo mv docker-credential-pass /usr/local/bin/
# sed -i '0,/{/s/{/{\n\t"credsStore": "pass",/' ~/.docker/config.json

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

# CONFLUENT
CONFLUENT_VERSION=5.4.0
wget https://packages.confluent.io/archive/5.4/confluent-5.4.0-2.12.tar.gz
sudo tar -xf confluent-5.4.0-2.12.tar.gz --directory /opt
sudo chown -R root:root /opt/confluent-5.4.0
sudo ln -s /opt/confluent-5.4.0 /opt/confluent
sudo ln -s /opt/confluent/bin/* /usr/local/bin
sudo rm /usr/local/bin/windows

export CONFLUENT_HOME=/opt/confluent
export PATH=$PATH:$CONFLUENT_HOME/bin

# KAFKA
KAFKA_VERSION=2.4.0
wget http://apache.mirror.digionline.de/kafka/2.4.0/kafka_2.13-2.4.0.tgz
sudo tar -xf kafka_2.13-2.4.0.tgz --directory /opt
sudo chown -R root:root /opt/kafka_2.13-2.4.0
sudo ln -s /opt/kafka_2.13-2.4.0 /opt/kafka
sudo ln -s /opt/kafka/bin/*.sh /usr/local/bin

export KAFKA_HOME=/opt/kafka
export PATH=$PATH:$KAFKA_HOME/bin

# GOLANG
VERSION=1.13.7
OS=linux
ARCH=amd64
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# export PATH=$PATH:/usr/local/go/bin
file=/etc/profile
grep -q '^export PATH=$PATH:/usr/local/go/bin' $file && sed -i 's/^export PATH=$PATH:\/usr\/local\/go\/bin.*/export PATH=$PATH:\/usr\/local\/go\/bin/' $file || echo 'export PATH=$PATH:/usr/local/go/bin' >> $file
