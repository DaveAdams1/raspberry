#!/bin/bash

sudo adduser dave

sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi dave

sudo apt install openssh-server
