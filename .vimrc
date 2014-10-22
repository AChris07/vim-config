" Welcome to my .vimrc! Default key for unfolding is Space. za will also work.

" Plugins {{{
" use pathogen for easier plugin implementation
call pathogen#infect()
" }}}

" Colors {{{
syntax enable " enable syntax processing
colorscheme solarized " solarized color scheme
set background=dark " use solarized dark background
" }}}

" Spaces & Tabs {{{
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set expandtab
" }}}

" UI Config {{{
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight bracket matching - ([{}])
" }}}

" Editing {{{
set pastetoggle=<F2> " Keymap pastetoggle to F10. Pastetoggle is used for 'paste' mode: Vim mode to paste outside (non-terminal) text without messing it up.
" Keymap Ctrl+V to paste in 'paste' mode
inoremap <C-v> <F2><C-r>+<F2> 
"}}}

" Search {{{
set incsearch " search as characters are entered
set hlsearch " highlight matches
" }}}

" Folding {{{
set foldenable " enables folding (hiding parts of the output)
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
" maps Space to open/close fold command
nnoremap <space> za
set foldmethod=indent " fold based on indent level
" }}}

" Movement {{{
" highlight last inserted text
nnoremap gV `[v`]
" }}}

" Leader shortcuts {{{
let mapleader="." " Set leader as score
" toggle Gundo (VIM plugin to visually show undo tree)
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" paste text in paste mode (to test)
" nnoremap <leader>pm <F10><C-S-v>+<F10>
" stream vi buffer to xxd (alias set vi in 'hex editor' mode)
nnoremap <leader>eh :%!xxd<CR>
" turn 'hex editor' mode off
nnoremap <leader>ehr :%!xxd -r<CR>
" }}}

" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

set modeline " set modeline (settings to only be applied to this file). Used to apply special folding for easier .vimrc organization
set modelines=1 " set modeline to only check the last (and first) line of this file. Default is 5.
" vim: foldmethod=marker:foldlevel=0
