#!/bin/bash

# Install pyenv

sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev openssl bzip2
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

echo "export PATH="~/.pyenv/bin:$PATH" " >>~/.bashrc
echo "eval "$(pyenv init -)" ">>~/.bashrc
echo "eval "$(pyenv virtualenv-init -)" ">>~/.bashrc

source ~/.bashrc

PYVER='pyenv install --list | grep "^  3." | grep -v dev | sort | tail -2 | head -1'
echo "Install python version $PYVER?"
echo "yes / no"
read reply
if $reply -eq "yes|Yes|y"
then
  pyenv install "$PYVER"
else
  echo ""
fi


