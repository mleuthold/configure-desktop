xcode-select --install || true

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

brew install --cask amethyst

brew install tmux
# in iTerm2 configure: tmux attach || tmux new

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# PYENV
brew install pyenv || brew upgrade pyenv
brew install pyenv-virtualenv || brew upgrade pyenv-virtualenv

# add shims to your shell
grep -qxF "### PYENV BEGIN
### PYENV END" ~/.zshrc || echo "\n### PYENV BEGIN\n### PYENV END" >> ~/.zshrc

command='''
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
''' perl -0p -i.bak -e 's/### PYENV BEGIN\n(.|\n)*### PYENV END/### PYENV BEGIN\n$ENV{command}\n### PYENV END/' ~/.zshrc

# optional, but recommended:
#brew install openssl readline sqlite3 xz zlib

# install specific Python version
pyenv install --skip-existing 3.7.9
pyenv install --skip-existing anaconda3-2020.07

pyenv global anaconda3-2020.07

# JAVA
grep -qxF "### JAVA BEGIN
### JAVA END" ~/.zshrc || echo "\n### JAVA BEGIN\n### JAVA END" >> ~/.zshrc

command='''
jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        # java -version
 }

jdk 11
''' perl -0p -i.bak -e 's/### JAVA BEGIN\n(.|\n)*### JAVA END/### JAVA BEGIN\n$ENV{command}\n### JAVA END/' ~/.zshrc

brew tap AdoptOpenJDK/openjdk
# install specific JAVA version
#brew cask install adoptopenjdk8
brew install --cask adoptopenjdk11

brew install go-task/tap/go-task

#curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
#sudo installer -pkg AWSCLIV2.pkg -target /
brew install awscli

# ZSH
brew install zsh-autosuggestions
grep -qxF "### ZSH BEGIN
### ZSH END" ~/.zshrc || echo "\n### ZSH BEGIN\n### ZSH END" >> ~/.zshrc

command='''source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh''' perl -0p -i.bak -e 's/### ZSH BEGIN\n(.|\n)*### ZSH END/### ZSH BEGIN\n$ENV{command}\n### ZSH END/' ~/.zshrc

brew install gpg | brew upgrade gnupg

brew install --cask google-cloud-sdk
# export CLOUDSDK_PYTHON=/Users/martin.leuthold/.pyenv/versions/3.8.2/bin/python

#pyenv virtualenv 3.7.9 gcp || true

grep -qxF "### GCLOUD BEGIN
### GCLOUD END" ~/.zshrc || echo "\n### GCLOUD BEGIN\n### GCLOUD END" >> ~/.zshrc

command='''
export CLOUDSDK_PYTHON="$HOME/.pyenv/versions/3.7.9/bin/python"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
''' perl -0p -i.bak -e 's/### GCLOUD BEGIN\n(.|\n)*### GCLOUD END/### GCLOUD BEGIN\n$ENV{command}\n### GCLOUD END/' ~/.zshrc


#gcloud components install kubectl

gcloud config set survey/disable_prompts True
gcloud config set component_manager/disable_update_check True

brew install telnet

# TERRAFORM
brew install tfenv
tfenv install 0.13.5
tfenv use 0.13.5

# TERRAGRUNT
brew tap alextodicescu/tgenv
brew install tgenv
tgenv install 0.26.3

# AWS AUTOCOMPLETER
grep -qxF "### AWS BEGIN
### AWS END" ~/.zshrc || echo "\n### AWS BEGIN\n### AWS END" >> ~/.zshrc

command='''
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
''' perl -0p -i.bak -e 's/### AWS BEGIN\n(.|\n)*### AWS END/### AWS BEGIN\n$ENV{command}\n### AWS END/' ~/.zshrc


# fix locale on MacOS for Python
grep -qxF "### PYTHON BEGIN
### PYTHON END" ~/.zshrc || echo "\n### PYTHON BEGIN\n### PYTHON END" >> ~/.zshrc

command='''
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
''' perl -0p -i.bak -e 's/### PYTHON BEGIN\n(.|\n)*### PYTHON END/### PYTHON BEGIN\n$ENV{command}\n### PYTHON END/' ~/.zshrc


# TASK
grep -qxF "### TASK BEGIN
### TASK END" ~/.zshrc || echo "\n### TASK BEGIN\n### TASK END" >> ~/.zshrc

command='''autoload -U compinit && compinit''' perl -0p -i.bak -e 's/### TASK BEGIN\n(.|\n)*### TASK END/### TASK BEGIN\n$ENV{command}\n### TASK END/' ~/.zshrc

git clone https://github.com/sawadashota/go-task-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/task || true
# Enable it in your .zshrc by adding it to your plugin list and reloading the completion:
#plugins=(… task)

# ZSH PLUGINS
sed -i .bak 's/plugins=(.*)/\plugins=(git docker docker-compose task kubectl sudo)/' ~/.zshrc

# CONCOURSE
brew cask install fly

# KUBECTL
grep -qxF "### KUBECTL BEGIN
### KUBECTL END" ~/.zshrc || echo "\n### KUBECTL BEGIN\n### KUBECTL END" >> ~/.zshrc

command='''[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)''' perl -0p -i.bak -e 's/### KUBECTL BEGIN\n(.|\n)*### KUBECTL END/### KUBECTL BEGIN\n$ENV{command}\n### KUBECTL END/' ~/.zshrc

### FUN
brew install fortune
brew install cowsay
brew install figlet
brew install lolcat

brew install helm

brew tap johanhaleby/kubetail
brew install kubetail

brew install zsh-syntax-highlighting

# ALIAS
grep -qxF "### ALIAS BEGIN
### ALIAS END" ~/.zshrc || echo "\n### ALIAS BEGIN\n### ALIAS END" >> ~/.zshrc

command='''
alias yawsso="$HOME/.pyenv/versions/anaconda3-2020.07/bin/yawsso"
alias awsume=". $HOME/.pyenv/versions/anaconda3-2020.07/bin/awsume"
alias awsumepy="$HOME/.pyenv/versions/anaconda3-2020.07/bin/awsumepy"
''' perl -0p -i.bak -e 's/### ALIAS BEGIN\n(.|\n)*### ALIAS END/### ALIAS BEGIN\n$ENV{command}\n### ALIAS END/' ~/.zshrc

# BIN dir in HOME folder
mkdir -p ~/bin
grep -qxF "### BIN BEGIN
### BIN END" ~/.zshrc || echo "\n### BIN BEGIN\n### BIN END" >> ~/.zshrc

command='''export PATH=$PATH:~/bin''' perl -0p -i.bak -e 's/### BIN BEGIN\n(.|\n)*### BIN END/### BIN BEGIN\n$ENV{command}\n### BIN END/' ~/.zshrc

### SUBLIME 3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl || true

### VAULT
brew tap hashicorp/tap
brew install hashicorp/tap/vault || brew upgrade hashicorp/tap/vault

grep -qxF "### VAULT BEGIN
### VAULT END" ~/.zshrc || echo "\n### VAULT BEGIN\n### VAULT END" >> ~/.zshrc

command='''
vault_sso(){
	export VAULT_TOKEN="$(vault login -method=oidc -token-only -no-store)"
}
''' perl -0p -i.bak -e 's/### VAULT BEGIN\n(.|\n)*### VAULT END/### VAULT BEGIN\n$ENV{command}\n### VAULT END/' ~/.zshrc

brew install mysql

### PARQUET-TOOLS
brew install parquet-tools

grep -qxF "### PARQUETTOOLS BEGIN
### PARQUETTOOLS END" ~/.zshrc || echo "\n### PARQUETTOOLS BEGIN\n### PARQUETTOOLS END" >> ~/.zshrc

command='''
parquet_tools(){
	docker run --rm --workdir /data -it -v $(pwd):/data nathanhowell/parquet-tools "$@"
}
''' perl -0p -i.bak -e 's/### PARQUETTOOLS BEGIN\n(.|\n)*### PARQUETTOOLS END/### PARQUETTOOLS BEGIN\n$ENV{command}\n### PARQUETTOOLS END/' ~/.zshrc

### auto-completion for brew in ZSH
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

grep -qxF "### BREW BEGIN
### BREW END" ~/.zshrc || cat <<< "### BREW BEGIN
### BREW END
$(cat ~/.zshrc)" > test.txt

#echo "\n### BREW BEGIN\n### BREW END" >> ~/.zshrc

command='''
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
''' perl -0p -i.bak -e 's/### BREW BEGIN\n(.|\n)*### BREW END/### BREW BEGIN\n$ENV{command}\n### BREW END/' ~/.zshrc
