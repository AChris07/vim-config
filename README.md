My VIM Config
=============

This is just my VIM configuration. It will probably be a work in progress, as I find more plugins/configurations I want to tinker with.

Although I use other editors in graphical mode, I still like to have a decent VIM configuration whenever I have to quickly check/edit some code through terminal (through SSH, for example).

Feel free to check the .vimrc and/or my used plugins, I'll try to keep it as well-documented as possible. Any suggestion is appreciated!


Installation
------------

1. Copy the `.vimrc` config file and the `.vim` directory on your home:
```sh
git clone https://github.com/AChris07/vim-config.git
cp vim-config/.vimrc ~/
cp vim-config/.vim ~/
```

2. Run the script to download the latest version of the modules used:
```sh
./vim-config/modules.sh
```
