
### install PyENV

brew update
brew install pyenv

# add shims to your shell
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# optional, but recommended:
#brew install openssl readline sqlite3 xz zlib

# install specific Python version
#pyenv install 3.8.2
