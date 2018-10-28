#!/bin/sh

if command -v foo >/dev/null 2>&1; then
  echo "Git is required to download the VIM modules included with this config."; exit 1;
else
  if [ ! -d "$HOME/.vim" ]; then
    echo "Make sure to link .vim in your home directory!"; exit 1;
  else
    if [ ! -d "$HOME/.vim/bundle" ]; then
      mkdir "$HOME/.vim/bundle"; exit 1;
    fi

    # Solarized colorscheme for Vim
    git clone https://github.com/altercation/vim-colors-solarized.git "$HOME/.vim/bundle/vim-colors-solarized"

    # Gundo, visualizes your Vim undo tree
    git clone https://github.com/sjl/gundo.vim.git "$HOME/.vim/bundle/gundo"

    # CtrlP, module for fuzzy search
    git clone https://github.com/kien/ctrlp.vim.git "$HOME/.vim/bundle/ctrlp.vim"

    echo "Modules downloaded and configured correctly"
    exit 0;
  fi
fi 
