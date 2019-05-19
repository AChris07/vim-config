call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/BufOnly.vim'                          " Deletes all buffers but the current one
Plug 'SirVer/ultisnips'                                 " Snippets lister and manager
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf'                                     " fzf for Vim use only (not going with shell installation)
Plug 'ervandew/supertab'                                " Replace all insertion completion with <Tab>
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' } " Tree directory
Plug 'airblade/vim-gitgutter'                           " Git Gutter to know changes from HEAD
Plug 'majutsushi/tagbar'                                " Shows tags of current file to get general file structure
Plug 'tommcdo/vim-exchange'                             " Text exchange with `cx{motion}`
Plug 'skwp/greplace.vim'                                " Global Search & Replace
Plug 'jiangmiao/auto-pairs'                             " Insert/delete brackets, parens, quotes in pair
Plug 'tpope/vim-sensible'                               " Vim starting setup. Necessary?
Plug 'tpope/vim-commentary'                             " Easy commenting out
Plug 'tpope/vim-repeat'                                 " Maps . to plugins for easy repeating
Plug 'tpope/vim-surround'                               " Mappings for easy wrapping up quotes/parenthess
Plug 'tpope/vim-vinegar'                                " Netrw enhancer. Is this needed if we have Nerdtree?
Plug 'tpope/vim-fugitive'                               " Git wrapper
Plug 'tpope/vim-unimpaired'                             " More mappings for cursor movement
" Plug 'tpope/vim-abolish'                                " Easier working with wording variants
Plug 'tpope/vim-eunuch'                                 " Extra UNIX commands inside Vim
Plug 'tpope/vim-jdaddy'                                 " Mappings for working with JSON  
Plug 'tpope/vim-rhubarb'                                " Integration with Hub
Plug 'godlygeek/tabular'                                " Text aligning
Plug 'vim-syntastic/syntastic'                          " Syntax checking and linting engine
Plug 'sheerun/vim-polyglot'                             " Linting rules for several languages 
Plug 'editorconfig/editorconfig-vim'                    " Editorconfig support
Plug 'vim-airline/vim-airline'                          " Utils toolbar with info
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'                                  " Emmet support
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --ts-completer --java-completer' }
Plug 'AndrewRadev/splitjoin.vim'                        " Split and join multiline support
Plug 'mileszs/ack.vim'                                  " Ack support
Plug 'joshdick/vim-action-ack'                          " Mappings for easy Ack access
Plug 'rakr/vim-one'                                     " Colorscheme one
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'md' }
Plug 'sjl/gundo.vim'                                    " Gundo - Undo tree

call plug#end()
