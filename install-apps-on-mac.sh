xcode-select --install

brew update
brew install pyenv
brew install pyenv-virtualenv

# add shims to your shell
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\n  eval "$(pyenv virtualenv-init -)"\nfi' >> ~/.zshrc
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
