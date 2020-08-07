xcode-select --install || true

brew update
brew install pyenv || brew upgrade pyenv
brew install pyenv-virtualenv || brew install pyenv-virtualenv

# add shims to your shell
grep -qxF "### PYENV BEGIN
### PYENV END" ~/.zshrc || echo "\n### PYENV BEGIN\n### PYENV END" >> ~/.zshrc

command='if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  abc
fi' perl -0p -i.bak -e 's/### PYENV BEGIN\n(.|\n)*### PYENV END/### PYENV BEGIN\n$ENV{command}\n### PYENV END/' ~/.zshrc

# optional, but recommended:
#brew install openssl readline sqlite3 xz zlib
# install specific Python version
pyenv install --skip-existing 3.7.7
pyenv install --skip-existing anaconda3-2020.02

# JAVA
grep -qxF "### JAVA BEGIN
### JAVA END" ~/.zshrc || echo "\n### JAVA BEGIN\n### JAVA END" >> ~/.zshrc

command='''jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        # java -version
 }

jdk 1.8''' perl -0p -i.bak -e 's/### JAVA BEGIN\n(.|\n)*### JAVA END/### JAVA BEGIN\n$ENV{command}\n### JAVA END/' ~/.zshrc

brew tap AdoptOpenJDK/openjdk
# install specific JAVA version
brew cask install adoptopenjdk8
brew cask install adoptopenjdk11

brew install go-task/tap/go-task

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# ZSH
brew install zsh-autosuggestions
grep -qxF "### ZSH BEGIN
### ZSH END" ~/.zshrc || echo "\n### ZSH BEGIN\n### ZSH END" >> ~/.zshrc

command='''source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh''' perl -0p -i.bak -e 's/### ZSH BEGIN\n(.|\n)*### ZSH END/### ZSH BEGIN\n$ENV{command}\n### ZSH END/' ~/.zshrc

brew install gpg | brew upgrade gnupg

brew cask install google-cloud-sdk
# export CLOUDSDK_PYTHON=/Users/martin.leuthold/.pyenv/versions/3.8.2/bin/python

pyenv virtualenv 3.7.7 gcp || true

grep -qxF "### GCLOUD BEGIN
### GCLOUD END" ~/.zshrc || echo "\n### GCLOUD BEGIN\n### GCLOUD END" >> ~/.zshrc

command='''export CLOUDSDK_PYTHON=~/.pyenv/versions/3.7.7/envs/gcp/bin/python
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc''' perl -0p -i.bak -e 's/### GCLOUD BEGIN\n(.|\n)*### GCLOUD END/### GCLOUD BEGIN\n$ENV{command}\n### GCLOUD END/' ~/.zshrc


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
grep -qxF "### AWS BEGIN
### AWS END" ~/.zshrc || echo "\n### AWS BEGIN\n### AWS END" >> ~/.zshrc

command='''autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws''' perl -0p -i.bak -e 's/### AWS BEGIN\n(.|\n)*### AWS END/### AWS BEGIN\n$ENV{command}\n### AWS END/' ~/.zshrc


# fix locale on MacOS for Python
grep -qxF "### PYTHON BEGIN
### PYTHON END" ~/.zshrc || echo "\n### PYTHON BEGIN\n### PYTHON END" >> ~/.zshrc

command='''export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8''' perl -0p -i.bak -e 's/### PYTHON BEGIN\n(.|\n)*### PYTHON END/### PYTHON BEGIN\n$ENV{command}\n### PYTHON END/' ~/.zshrc


# TASK
grep -qxF "### TASK BEGIN
### TASK END" ~/.zshrc || echo "\n### TASK BEGIN\n### TASK END" >> ~/.zshrc

command='''autoload -U compinit && compinit''' perl -0p -i.bak -e 's/### TASK BEGIN\n(.|\n)*### TASK END/### TASK BEGIN\n$ENV{command}\n### TASK END/' ~/.zshrc

git clone https://github.com/sawadashota/go-task-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/task || true
# Enable it in your .zshrc by adding it to your plugin list and reloading the completion:
#plugins=(… task)

# ZSH PLUGINS
sed -i .bak 's/plugins=(.*)/\plugins=(git docker docker-compose task abc)/' .zshrc

# CONCOURSE
brew cask install fly

# KUBECTL
grep -qxF "### KUBECTL BEGIN
### KUBECTL END" ~/.zshrc || echo "\n### KUBECTL BEGIN\n### KUBECTL END" >> ~/.zshrc

command='''[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)''' perl -0p -i.bak -e 's/### KUBECTL BEGIN\n(.|\n)*### KUBECTL END/### KUBECTL BEGIN\n$ENV{command}\n### KUBECTL END/' ~/.zshrc
