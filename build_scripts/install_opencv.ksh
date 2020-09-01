#!/bin/bash

# Remove some unwanted stuff to free up disk space
sudo apt-get purge wolfram-engine
sudo apt-get purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove

sudo apt-get update && sudo apt-get upgrade



