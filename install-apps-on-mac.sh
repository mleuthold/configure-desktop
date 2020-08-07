xcode-select --install

brew update
brew install pyenv
brew install pyenv-virtualenv

# add shims to your shell
# put this into ~/.zshrc
### PYENV
# src: https://github.com/pyenv/pyenv#installation
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

command='if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi' perl -0pe 's/### PYENV BEGIN\n(.|\n)*\n### PYENV END/###PYENV BEGIN\n$ENV{command}\n### PYENV END/' .zshrc

# optional, but recommended:
#brew install openssl readline sqlite3 xz zlib
# install specific Python version
#pyenv install 3.8.2

brew tap AdoptOpenJDK/openjdk
# install specific JAVA version
#brew cask install adoptopenjdk8
#brew cask install adoptopenjdk11

brew install go-task/tap/go-task

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

brew install zsh-autosuggestions
# put to .zshrc
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

brew install gpg

brew cask install google-cloud-sdk
# export CLOUDSDK_PYTHON=/Users/martin.leuthold/.pyenv/versions/3.8.2/bin/python
### Google Cloud Tools
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

gcloud components install kubectl

gcloud config set survey/disable_prompts True
gcloud config set component_manager/disable_update_check true

brew install telnet

brew install vault

# TERRAFORM
brew install tfenv

# TERRAGRUNT
brew tap alextodicescu/tgenv
brew install tgenv

# AWS AUTOCOMPLETER
#autoload bashcompinit && bashcompinit
#complete -C '/usr/local/bin/aws_completer' aws

# fix locale on MacOS for Python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

git clone https://github.com/sawadashota/go-task-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/task
# Enable it in your .zshrc by adding it to your plugin list and reloading the completion:
#plugins=(… task)
#autoload -U compinit && compinit

# CONCOURSE
brew cask install fly
