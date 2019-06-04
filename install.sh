#!/usr/bin/env bash

echo "Setting up Vim..."
BASEPATH=$HOME/.vim-config
git clone git@github.com:AChris07/vim-config.git $BASEPATH

# Link local VIM files to user's $HOME folder
ln -si $BASEPATH/.vimrc $HOME/ && ln -Fsi $BASEPATH/.vim $HOME/
echo "Vim configured!"
