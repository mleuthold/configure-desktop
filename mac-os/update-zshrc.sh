##########################
# update lines of .zshrc
##########################

# ZSH PLUGINS
sed -i .bak 's/plugins=(.*)/\plugins=(git docker docker-compose task kubectl sudo poetry)/' ~/.zshrc
sed -i .bak 's/ZSH_THEME=".*"/\ZSH_THEME="ys"/' ~/.zshrc
sed -i .bak 's/DISABLE_UPDATE_PROMPT=".*"/\DISABLE_UPDATE_PROMPT="true"/' ~/.zshrc

##########################
# add/update lines at top of .zshrc
##########################

### auto-completion for brew in ZSH
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

grep -qxF "### ZSHRC TOP BEGIN
### ZSHRC TOP END" ~/.zshrc || cat <<<"### ZSHRC TOP BEGIN
### ZSHRC TOP END
$(cat ~/.zshrc)" >~/.zshrc

command='''
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit -i
  compinit -i
fi

# instead of fixing permissions, ignore them
ZSH_DISABLE_COMPFIX="true"
''' perl -0p -i.bak -e 's/### ZSHRC TOP BEGIN\n(.|\n)*### ZSHRC TOP END/### ZSHRC TOP BEGIN\n$ENV{command}\n### ZSHRC TOP END/' ~/.zshrc

##########################
# add/update lines at bottom of .zshrc
##########################
grep -qxF "### ZSHRC BOTTOM BEGIN
### ZSHRC BOTTOM END" ~/.zshrc || echo "\n### ZSHRC BOTTOM BEGIN\n### ZSHRC BOTTOM END" >>~/.zshrc

command='''
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        # java -version
 }

jdk 11

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export CLOUDSDK_PYTHON="$HOME/.pyenv/versions/cloud_sdk/bin/python"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# AWS AUTOCOMPLETER
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
export AWS_PAGER=""

# fix locale on MacOS for Python

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# PIPX
eval "$(register-python-argcomplete pipx)"

# TASKFILE
autoload -U compinit -i && compinit -i

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

export PATH=$PATH:~/bin

vault_sso(){
	export VAULT_TOKEN="$(vault login -method=oidc -token-only -no-store)"
}


parquet_tools(){
	docker run --rm --workdir /data -it -v $(pwd):/data nathanhowell/parquet-tools "$@"
}

jupyter_lab(){
	 docker run --rm -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "$HOME":/home/jovyan/work -v "$HOME/Documents/jupyter/.jupyter":/home/jovyan/.jupyter jupyter/pyspark-notebook:spark-3.1.1
}

# For a ipython notebook and pyspark integration
#if which pyspark > /dev/null; then
#  export SPARK_HOME="$(brew --prefix apache-spark)/libexec"
#  export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
#  #export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$PYTHONPATH
#fi

# make psycopg2 installable on BigSur
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

docker_free_space(){
	docker system prune --all --force --volumes
}

export PYTHONDONTWRITEBYTECODE=1

# alias yawsso="$HOME/.local/bin/yawsso"
# alias awsume=". $HOME/.local/bin/awsume"
# alias awsumepy="$HOME/.local/bin/awsumepy"
''' perl -0p -i.bak -e 's/### ZSHRC BOTTOM BEGIN\n(.|\n)*### ZSHRC BOTTOM END/### ZSHRC BOTTOM BEGIN\n$ENV{command}\n### ZSHRC BOTTOM END/' ~/.zshrc
