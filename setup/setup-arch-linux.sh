#!/bin/bash

if [ "$(uname -s)" != "Linux" ] ; then
    echo "current machine is not linux."
    exit 1
fi
if [ $EUID -ne 0 ] ; then
   echo "This script must be run as root" 
   exit 1
fi

pacman -Syu

pacman -S git wget curl neovim tmux unzip openssl nmap gzip rsync rclone restic
