xcode-select --install || true

brew update
brew install pyenv || brew upgrade pyenv
brew install pyenv-virtualenv || brew install pyenv-virtualenv

# add shims to your shell
grep -qxF "### PYENV BEGIN
### PYENV END" .zshrc || echo "\n### PYENV BEGIN\n### PYENV END" >> .zshrc

command='''if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi''' perl -0pe 's/### PYENV BEGIN\n(.|\n)*\n### PYENV END/### PYENV BEGIN\n$ENV{command}\n### PYENV END/' .zshrc

# optional, but recommended:
#brew install openssl readline sqlite3 xz zlib
# install specific Python version
pyenv install --skip-existing 3.7.7
pyenv install --skip-existing anaconda3-2020.02


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

brew install gpg | brew upgrade gnupg

brew cask install google-cloud-sdk
# export CLOUDSDK_PYTHON=/Users/martin.leuthold/.pyenv/versions/3.8.2/bin/python
### Google Cloud Tools
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

grep -qxF "### GCLOUD BEGIN
### GCLOUD END" .zshrc || echo "\n### GCLOUD BEGIN\n### GCLOUD END" >> .zshrc

command='''source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc''' perl -0pe 's/### GCLOUD BEGIN\n(.|\n)*\n### GCLOUD END/### GCLOUD BEGIN\n$ENV{command}\n### GCLOUD END/' .zshrc


gcloud components install kubectl

gcloud config set survey/disable_prompts True
gcloud config set component_manager/disable_update_check true

brew install telnet

brew install vault | brew upgrade vault

# TERRAFORM
brew install tfenv
tfenv install 0.12.28

# TERRAGRUNT
brew tap alextodicescu/tgenv
brew install tgenv
tgenv install 0.23.30

# AWS AUTOCOMPLETER
#autoload bashcompinit && bashcompinit
#complete -C '/usr/local/bin/aws_completer' aws

grep -qxF "### AWS BEGIN
### AWS END" .zshrc || echo "\n### AWS BEGIN\n### AWS END" >> .zshrc

command='''autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws''' perl -0pe 's/### AWS BEGIN\n(.|\n)*\n### AWS END/### AWS BEGIN\n$ENV{command}\n### AWS END/' .zshrc


# fix locale on MacOS for Python

grep -qxF "### PYTHON BEGIN
### PYTHON END" .zshrc || echo "\n### PYTHON BEGIN\n### PYTHON END" >> .zshrc

command='''export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8''' perl -0pe 's/### PYTHON BEGIN\n(.|\n)*\n### PYTHON END/### PYTHON BEGIN\n$ENV{command}\n### PYTHON END/' .zshrc


# TASK

grep -qxF "### TASK BEGIN
### TASK END" .zshrc || echo "\n### TASK BEGIN\n### TASK END" >> .zshrc

command='''autoload -U compinit && compinit''' perl -0pe 's/### TASK BEGIN\n(.|\n)*\n### TASK END/### TASK BEGIN\n$ENV{command}\n### TASK END/' .zshrc


git clone https://github.com/sawadashota/go-task-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/task || true
# Enable it in your .zshrc by adding it to your plugin list and reloading the completion:
#plugins=(… task)

# ZSH PLUGINS

# CONCOURSE
brew cask install fly
