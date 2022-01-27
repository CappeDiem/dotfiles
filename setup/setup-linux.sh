#!/bin/bash

if [ "$(uname -s)" != "Linux" ] ; then
    echo "current machine is not linux."
    exit 1
fi
if [ $EUID -ne 0 ] ; then
   echo "This script must be run as root" 
   exit 1
fi

apt-get update

apt-get install -y git wget curl neovim python3 python3-pip python3-venv \
    software-properties-common apt-transport-https \
    htop tmux unzip openssl nmap gzip rsync zsh 