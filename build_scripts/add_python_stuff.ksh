#!/bin/bash

# Install pyenv

set_vars() {
  TMP=$HOME/scripts/tmp
  NAME=add_python_stuff
  LOG=$TMP/log.txt
}

# last command will record the progress of this script, enabling it to skip to the next section after a reboot.
last_command() {
  if [ -f "$TMP/$NAME" ]
  then
    LC=`tail -1 "$TMP/$NAME"`
  else
    touch "$TMP/$NAME"
  fi
}

update() {
sudo apt-get update 2>&1>>$LOG
sudo apt-get upgrade 2>&1>>$LOG
sudo raspi-config --expand-rootfs 2>&1>>$LOG
$HOME/scripts/sreboot.ksh
}

update_bashrc() {
echo "export PATH="~/.pyenv/bin:$PATH" " >>~/.bashrc
echo "eval "$(pyenv init -)" ">>~/.bashrc
echo "eval "$(pyenv virtualenv-init -)" ">>~/.bashrc
source ~/.bashrc
}

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev openssl bzip2
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash



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

# set python to latest version
pyenv global $PYVER
# upgrade pip
pip install --upgrade pip
# install wheel
pip install wheel



