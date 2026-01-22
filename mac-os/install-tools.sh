# prerequisite
xcode-select --install || true
brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# install tools
brew install --cask amethyst
brew install tmux # in iTerm2 configure: tmux attach || tmux new
brew install pyenv || brew upgrade pyenv
brew install pyenv-virtualenv || brew upgrade pyenv-virtualenv
source ~/.zshrc &&
	pyenv install --skip-existing 3.7.12 &&
	pyenv virtualenv 3.7.12 cloud_sdk || true &&
	pyenv install --skip-existing 3.10.1 &&
	pyenv virtualenv 3.10.1 default || true &&
	pyenv global default
brew tap AdoptOpenJDK/openjdk &&
	brew install --cask adoptopenjdk8 &&
	brew install --cask adoptopenjdk11
brew install go-task/tap/go-task
brew install zsh-autosuggestions
brew install gpg || brew upgrade gnupg
brew install --cask google-cloud-sdk &&
	gcloud config set survey/disable_prompts True &&
	gcloud config set component_manager/disable_update_check True
brew install telnet
brew install fortune
brew install cowsay
brew install figlet
brew install lolcat
# brew install helm
brew tap johanhaleby/kubetail && brew install kubetail
brew install zsh-syntax-highlighting
brew tap hashicorp/tap &&
	(brew install hashicorp/tap/vault || brew upgrade hashicorp/tap/vault)
brew install mysql
brew install parquet-tools
# brew install apache-spark # contains Hadoop libraries v3.2
brew install wget
brew install maven
brew install jq
brew install minica # create your own self signed SSL certificate
brew install pre-commit
brew install go
brew install postgresql # for psycopg2
brew install openssl # https://github.com/psycopg/psycopg2/issues/1200
brew install yq
brew install earthly/earthly/earthly && 
	earthly bootstrap
brew install watch
brew install nvm
brew install kubernetes-cli
brew install jfrog-cli
brew tap databricks/tap
brew install databricks
brew install Azure/kubelogin/kubelogin

# docker free setup
brew install docker
brew install docker-compose
brew install docker docker-credential-helper
brew install docker-buildx 
brew install colima
# and then check in your `~/.docker/config.json` about these values
	# "credsStore": "osxkeychain",
	# "currentContext": "colima",
 #    "cliPluginsExtraDirs": [
 #              "/opt/homebrew/lib/docker/cli-plugins"
 #      ]

# TERRAFORM
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
tfswitch 1.2.8

curl -L https://raw.githubusercontent.com/warrensbox/tgswitch/release/install.sh | bash
tgswitch 0.38.9

brew install terraform-docs
# terraform-docs completion zsh > /usr/local/share/zsh/site-functions/_terraform-docs
# autoload -U compinit && compinit

# PIPX
brew install pipx &&
	pipx ensurepath

pipx install awsume &&
	awsume-configure --shell zsh --autocomplete-file ~/.zshrc --alias-file ~/.zshrc
pipx install yawsso
pipx install black pylint
pipx install dbx

# install tools without brew

# Poetry
# curl -sSL https://install.python-poetry.org | python3 -
pipx install poetry==1.2.0
mkdir -p $ZSH_CUSTOM/plugins/poetry
poetry completions zsh >$ZSH_CUSTOM/plugins/poetry/_poetry

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# AWS cli
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg" &&
	sudo installer -pkg AWSCLIV2.pkg -target /

curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/session-manager-plugin.pkg" -o "session-manager-plugin.pkg" &&
	sudo installer -pkg session-manager-plugin.pkg -target / &&
	ln -s /usr/local/sessionmanagerplugin/bin/session-manager-plugin /usr/local/bin/session-manager-plugin

# TASKFILE completion
git clone https://github.com/sawadashota/go-task-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/task || true
# Enable it in your .zshrc by adding it to your plugin list and reloading the completion:
#plugins=(… task)

# general purpose bin folder
mkdir -p ~/bin

# SUBLIME 3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl || true

# auto push new branches
git config --global --add --bool push.autoSetupRemote true
