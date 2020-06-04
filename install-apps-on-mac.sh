### install tools

xcode-select --install

### install PyENV

brew update
brew install pyenv

# add shims to your shell
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# optional, but recommended:
#brew install openssl readline sqlite3 xz zlib

# install specific Python version
#pyenv install 3.8.2

### install JAVA

brew tap AdoptOpenJDK/openjdk

# install specific JAVA version
#brew cask install adoptopenjdk8
#brew cask install adoptopenjdk11

### install Taskfile

brew install go-task/tap/go-task

### install AWS CLI

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

### install ZSH autocompletion
brew install zsh-autosuggestions

# put to .zshrc
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
