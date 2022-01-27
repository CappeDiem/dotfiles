#!/bin/bash

# main
echo "doing setup for user ${USER}..."

echo "creating bin and .ssh folders..."
mkdir ${HOME}/bin || true
mkdir ${HOME}/.ssh || true
mkdir ${HOME}/.config || true

# get current script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."


echo "changing permissions..."
chmod 700 ${HOME}/.ssh


# Setup Shell Customization
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.config/zsh-syntax-highlighting

for i in $(find ${DIR}/src/dotfiles -maxdepth 1 -not -type d) ; do
  ln -sf ${i} ${HOME}/$(basename $i)
done

cp -r ${DIR}/src/nvim ${HOME}/.config/nvim

chsh -s $(which zsh) $USER

echo "NOTE: remember to manually copy your ssh-keys into ${HOME}/.ssh folder"
echo "done."