# prerequisite
xcode-select --install || true
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# install tools
brew install --cask amethyst
brew install tmux # in iTerm2 configure: tmux attach || tmux new
(brew install pyenv || brew upgrade pyenv) \
  && pyenv install --skip-existing 3.7.9 \
  && pyenv install --skip-existing anaconda3-2020.11 \
  && pyenv shell anaconda3-2020.11 \
  && conda create --yes --name ana202011_py37 python=3.7 anaconda \
  && pyenv global anaconda3-2020.11/envs/ana202011_py37
brew install pyenv-virtualenv || brew upgrade pyenv-virtualenv
brew tap AdoptOpenJDK/openjdk \
  && brew install --cask adoptopenjdk8 \
  && brew install --cask adoptopenjdk11
brew install go-task/tap/go-task
brew install zsh-autosuggestions
brew install gpg || brew upgrade gnupg
brew install --cask google-cloud-sdk \
  && gcloud config set survey/disable_prompts True \
  && gcloud config set component_manager/disable_update_check True
# export CLOUDSDK_PYTHON=/Users/martin.leuthold/.pyenv/versions/3.8.2/bin/python
# gcloud components install kubectl
# gcloud auth login
# gcloud auth configure-docker
brew install telnet
brew install --cask fly # CONCOURSE
brew install fortune
brew install cowsay
brew install figlet
brew install lolcat
brew install helm
brew tap johanhaleby/kubetail && brew install kubetail
brew install zsh-syntax-highlighting
brew tap hashicorp/tap \
  && (brew install hashicorp/tap/vault || brew upgrade hashicorp/tap/vault)
brew install mysql
brew install parquet-tools
brew install tfenv \
  && MY_TERRAFORM_VERSION="0.13.5" \
  && tfenv install "$MY_TERRAFORM_VERSION" \
  && tfenv use "$MY_TERRAFORM_VERSION"
brew tap alextodicescu/tgenv \
  && brew install tgenv \
  && MY_TERRAGRUNT_VERSION="0.26.3" \
  && tgenv install "$MY_TERRAGRUNT_VERSION"
brew install apache-spark # contains Hadoop libraries v3.2
brew install wget
brew install maven
brew install jq
brew install pipx \
  && pipx ensurepath \
pipx install awsume
pipx install yawsso

# install tools without brew

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# AWS cli
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg" \
 && sudo installer -pkg AWSCLIV2.pkg -target /

# TASKFILE completion
git clone https://github.com/sawadashota/go-task-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/task || true
# Enable it in your .zshrc by adding it to your plugin list and reloading the completion:
#plugins=(… task)

# general purpose bin folder
mkdir -p ~/bin

# SUBLIME 3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl || true
