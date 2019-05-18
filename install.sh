#!/bin/sh

# Link local VIM files to user's $HOME folder
BASEPATH=$(dirname $BASH_SOURCE)
ln -si $BASEPATH/.vimrc ~/ && ln -Fsi $BASEPATH/.vim ~/
