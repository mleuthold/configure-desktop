#!/usr/bin/env bash

# snaps
sudo snap install intellij-idea-community --classic
sudo snap install jq --edge
sudo snap install keepassxc
sudo snap install kubectl --classic
sudo snap install ruby --classic
sudo snap install shellcheck --edge
sudo snap install sublime-text --classic
sudo snap install task --classic
sudo snap install teams-for-linux
sudo snap install vlc
sudo snap install whatsdesk
sudo snap install yq

sudo snap set system refresh.retain=2
ln -s /var/lib/snapd/desktop/applications/ ~/.local/share/applications/snap || true

# apt
sudo apt install 4kyoutubetomp3
sudo apt install ansible
sudo apt install caffeine
sudo apt install easytag
sudo apt install filezilla
sudo apt install golang-glide
sudo apt install guake
sudo apt install i3lock-fancy
sudo apt install libghc-yaml-dev # yaml2json
sudo apt install maven
sudo apt install pass
sudo apt install terminator
sudo apt install virtualbox
sudo apt install wine64
sudo apt remove jq

sudo apt-get install cowsay
# /usr/share/cowsay/cows/
sudo apt-get install fortune
sudo apt-get install figlet
ruby -v
sudo gem install lolcat

### ZSH
sudo apt install zsh
chsh -s $(which zsh)

### OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true
# add plugins for auto complete to ZSH
sed -i.bak 's/^plugins=.*/plugins=(zsh-autosuggestions zsh-syntax-highlighting kubectl kubetail git sudo docker docker-compose task)/' $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true
git clone https://github.com/johanhaleby/kubetail.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/kubetail || true

### PYENV
curl https://pyenv.run | bash || true
pyenv update

# add shims to your shell
grep -Pzo "(?s)### PYENV BEGIN\n(.|\n)*### PYENV END" || echo "\n### PYENV BEGIN\n### PYENV END" >> ~/.zshrc

command='export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi' perl -0p -i.bak -e 's/### PYENV BEGIN\n(.|\n)*### PYENV END/### PYENV BEGIN\n$ENV{command}\n### PYENV END/' ~/.zshrc

# optional, but recommended:
# add Python build dependencies for Ubuntu
sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# install specific Python version
pyenv install --skip-existing 3.7.7
pyenv global 3.7.7
pyenv install --skip-existing anaconda3-2020.02

### TERRAFORM
sudo git clone https://github.com/tfutils/tfenv.git /opt/tfenv || true
sudo ln -s /opt/tfenv/bin/* /usr/local/bin || true
sudo tfenv install 0.12.29

### TERRAGRUNT
sudo git clone https://github.com/cunymatthieu/tgenv.git /opt/tgenv || true
sudo ln -s /opt/tgenv/bin/* /usr/local/bin || true
sudo tgenv install 0.23.33

### TASK
grep -Pzo "(?s)### TASK BEGIN\n(.|\n)*### TASK END" || echo "\n### TASK BEGIN\n### TASK END" >> ~/.zshrc

command='''autoload -U compinit && compinit''' perl -0p -i.bak -e 's/### TASK BEGIN\n(.|\n)*### TASK END/### TASK BEGIN\n$ENV{command}\n### TASK END/' ~/.zshrc

git clone https://github.com/sawadashota/go-task-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/task || true

### PIP
grep -Pzo "(?s)### PIP BEGIN\n(.|\n)*### PIP END" || echo "\n### PIP BEGIN\n### PIP END" >> ~/.zshrc

command='eval "`pip completion --zsh`"
compctl -K _pip_completion pip3' perl -0p -i.bak -e 's/### PIP BEGIN\n(.|\n)*### PIP END/### PIP BEGIN\n$ENV{command}\n### PIP END/' ~/.zshrc

### AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

pyenv virtualenv 3.7.7 aws-sso-pyenv
pyenv shell 3.7.7/envs/aws-sso-pyenv
pip install awsume
pip install yawsso
touch ~/.aws/credentials 

############################################

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

# GOLANG
VERSION=1.13.7
OS=linux
ARCH=amd64
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# export PATH=$PATH:/usr/local/go/bin
file=/etc/profile
grep -q '^export PATH=$PATH:/usr/local/go/bin' $file && sed -i 's/^export PATH=$PATH:\/usr\/local\/go\/bin.*/export PATH=$PATH:\/usr\/local\/go\/bin/' $file || echo 'export PATH=$PATH:/usr/local/go/bin' >> $file

### OPEN VPN 3
sudo apt install apt-transport-https
wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
sudo apt-key add openvpn-repo-pkg-key.pub
DISTRO="focal" 
sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list
sudo apt update
sudo apt install openvpn3

### GCLOUD
sudo echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
