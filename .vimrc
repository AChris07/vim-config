" Welcome to my .vimrc! Default key for unfolding is Space. za will also work.
set nocompatible                              " We want the latest Vim settings

" Support ALE and CoC, enabling before Plugins load
let g:ale_disable_lsp = 1

" Plugins {{{
so ~/.vim/plugs.vim
" }}}

" Colors {{{
syntax enable                                 " Enable syntax processing

  " Enable true color {{{
  if (has("termguicolors"))
      " Force true color on since vim can't detect it inside Tmux
      let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

      " Enable true color. Without the lines above, results in no color when
      " launched inside Tmux.
      set termguicolors
  endif
  " }}}

colorscheme one                               " Vim-one color scheme
set background=dark                           " Use dark background
let g:one_allow_italics=1                     " Enables italics
let g:airline_theme='one'                     " Sets theme for Vim Airline
call one#highlight('vertSplit', 'ffffff', '', 'none')
" }}}

" UI Config {{{
set tabstop=2                                 " Tab width
set softtabstop=2                             " Width of indent in insert mode
set shiftwidth=2                              " Width of indent in normal mode
set expandtab                                 " Use spaces instead of tabs
set autoindent                                " New line keeps current indentation

set autoread                                  " Reload when changed on Disk
set number                                    " Show line numbers
set showcmd                                   " Show command in bottom bar
set cursorline                                " Highlight current line
filetype indent on                            " Load filetype-specific indent files
set wildmenu                                  " Visual autocomplete for command menu
set showmatch                                 " Highlight bracket matching - ([{}])

set lazyredraw                                " Redraw only when we need to
set ttyfast                                   " Sends more characters per redraw
set noerrorbells visualbell t_vb=             " No bells when pressing wrong key.
set updatetime=500                            " Default is 4000ms. Reducing for better user experience
set pumheight=10                              " Set max height for pop-up menu

" Hide '~' at End of Buffer
highlight EndOfBuffer ctermfg=bg guifg=bg
" }}}

" GUI {{{
set guifont=Fira\ Code\ Retina:h14
set linespace=12
" }}}

" Mouse {{{
set mouse=a
" }}}

" Editing {{{
" set pastetoggle=<F2> " Keymap pastetoggle to F10. Pastetoggle is used for 'paste' mode: Vim mode to paste outside (non-terminal) text without messing it up.
" Keymap Ctrl+V to paste in 'paste' mode
" inoremap <C-v> <F2><C-r>+<F2>
"}}}

" Search {{{
set hlsearch                                  " Highlight matches
set incsearch                                 " Incrementally highlight as we type
nnoremap <esc><esc> :noh<CR>                  " Double ESC clears last search highlighting
" }}}

" Folding {{{
set foldenable " enables folding (hiding parts of the output)
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
" maps Space to open/close fold command
nnoremap <space> za
set foldmethod=indent " fold based on indent level
" }}}

" Split Management {{{
set splitbelow
set splitright

" Easier mapping for split movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Easier mapping for movement between wrapped lines
nnoremap k gk
nnoremap j gj
" }}}

" Mappings {{{
let mapleader=","                             " Set leader as comma

" Back to normal mode from insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" Shortcut to edit vimrc/zshrc and source vimrc changes
nmap <leader>ve :tabedit $MYVIMRC<CR>
nmap <leader>pe :tabedit ~/.vim/plugs.vim<CR>
nmap <leader>ze :tabedit ~/.zshrc<CR>

" Highlight last inserted text
nnoremap gV `[v`]

" Write to a file faster
nmap <Leader>w :w<CR>

" Quits a window faster
nmap <Leader>q :q<CR>

" Quickly access the clipboard registry
noremap <Leader>p "*

if has("nvim")
  set clipboard+=unnamedplus
endif

" Toggle Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Toggle NERDTree
nnoremap <leader>tr :NERDTreeToggle<CR>

" Stream vi buffer to xxd (alias set vi in 'hex editor' mode)
nnoremap <leader>he :%!xxd<CR>
" Turn 'hex editor' mode off
nnoremap <leader>nhe :%!xxd -r<CR>

" We want to open files relative to the current file
" TODO: Look into how does this work
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" }}}

" Plugins {{{
" FZF
nnoremap <leader>fz :Files<CR>

" We want to use ripgrep
set grepprg=rg\ --hidden

" Ack
let g:ackprg = 'rg --vimgrep'

" NerdTree
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$']

map <Leader>fr :NERDTreeFind <CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Open snippets on a vertical split
let g:UltiSnipsEditSplit='vertical'

" Create snippets in VIM root
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" ALE
let g:ale_disable_lsp = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_linters = {
\   'javascript': ['standard'],
\   'javascriptreact': ['standard'],
\   'typescript': ['tslint'],
\   'typescriptreact': ['tslint'],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'javascript': ['standard'],
\   'javascriptreact': ['standard'],
\   'typescript': ['prettier', 'tslint'],
\   'typescriptreact': ['prettier', 'tslint'],
\   'json': ['prettier'],
\   'rust': ['rustfmt'],
\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_python_auto_pipenv = 1

" CoC
let g:coc_global_extensions = ['coc-json', 'coc-git']

nmap <silent> g] <Plug>(ale_next_wrap)
nmap <silent> g[ <Plug>(ale_prev_wrap)

nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

nmap <Leader>re <Plug>(coc-rename)
nmap <Leader>fi <Plug>(coc-fix-current)
nmap <Leader>ca <Plug>(coc-codeaction)
nmap <Leader>cl <Plug>(coc-codelens-action)
nmap <Leader>doc <Plug>(ale_documentation)

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Show all diagnostics.
nmap <silent> <Leader>ld :<C-u>CocList diagnostics<cr>
" Manage extensions.
nmap <silent> <Leader>le  :<C-u>CocList extensions<cr>
" Show commands.
nmap <silent> <Leader>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nmap <silent> <Leader>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nmap <silent> <Leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <Leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <Leader>k  :<C-u>CocPrev<CR>

" JSDoc
nmap <Leader>jsd :JsDoc<CR>
nmap <Leader>jsf :JsDocFormat<CR>

" Vim-airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
set noshowmode
set laststatus=2

"Adds comma as thousand separator to the line number, to make them human readable
function! CustomLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'CustomLineNumber', 'accents': 'bold'})

let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

" Emmet-vim
" Make `.js` files expand `className` instead of `class`
let g:user_emmet_settings = {
\  'javascript': {
\    'attribute_name': {'for': 'htmlFor', 'class': 'className'},
\  },
\}

" Vim-markdown-preview
let vim_markdown_preview_toggle = 1
let vim_markdown_preview_github = 1
let vim_markdown_preview_hotkey = '<C-m>'
let vim_markdown_preview_browser = 'Google Chrome'
" }}}

" Auto-commands {{{
autocmd BufNewFile,BufRead Dockerfile* set filetype=Dockerfile
autocmd BufNewFile,BufRead *nginx.conf* setf nginx
autocmd BufNewFile,BufRead *.snippets set list
autocmd FileType gitcommit,markdown,text setlocal spell
autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight the symbol and its references when holding the cursor.

" Automatically source the .vimrc file on save
augroup autosourcing
        autocmd!
        autocmd BufWritePost .vimrc,init.vim source % | AirlineRefresh
augroup end
" }}}

" Backups {{{
set directory=$HOME/.vim/swap//,$HOME/tmp//,/var/tmp,/tmp
set backup
set backupdir=$HOME/.vim/tmp//,$HOME/tmp//,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set writebackup
" }}}

set modeline " set modeline (settings to only be applied to this file). Used to apply special folding for easier .vimrc organization
set modelines=1 " set modeline to only check the last (and first) line of this file. Default is 5.
" vim: foldmethod=marker:foldlevel=0

" -------------------- Notes and Tips --------------------
"  XML
" - `:%s/\(<[^>]*>\)/\1\r/g` to insert newline after every tag

" Command mode
" - `:pwd` Prints current directory
" - `:cwd [dir]` Changes current directory.
" - `:bufdo bd!` closes all buffer
" - `:tabn` or `:tabe` opens a new tab
" - `:ls` list all buffers
" - `:bd` destroy current buffer
" - `:bd [index]` destroy buffer on index
" - `sbuffer [index]` opens a split window with that loaded buffer
" - `:q` closes window, but buffer is still there
" - `:/ + ctrl + R + "` paste what was last yanked in command mode
" - `:marks` Lists all marks.
" - `:bp` Return to previous buffer.
" - `:wa` Write all files.

" Normal mode
" - 'zz' Center the line where the cursor is located.
" - `gt` Switche between tabs.
" - `ctrl + ^` Return to previous buffer.
" - `ctrl + u` Scroll half a screen upwards.
" - `ctrl + d` Scroll half a screen downwards.
" - `va{` Select the parentensis too.
" - `ctrl + w + o` Make current buffer fullscreen (from split).
" - `J` Join the current line with the next one.
" - `ctrl + o` Jump back.
" - `ctrl + i` Jump forward.
" - `.` Repeat last operation.
" - `?` Search above the current line.
" - `m[lower_letter]` Create a mark on the current buffer (i.e: `mm`).
" - `m[capital_letter]` Create a mark on any file (i.e: `mM`).
" - `'[letter]` Return to a mark.
" - ``[letter]` Return to a mark, to the exact column.
" - ``0` Return to your last file through a mark.
" - `q[key]` Start recording a macro (i.e: `qq`)
" - `q` Stop recording.
" - `co` Open the code fold.

" Vinegar
" - `-` Go to current directory
" - `%` Create a new file
" - `d` Create a new directory
" - `D` Delete a file or directory

" CtrlP
" - `:tag [name]` Go to tag.
" - `:tn` Navigate to next tag.
" - `:tp` navigate to previous tag.
" - `:ts` Select between tags.
" - `ctrl + ]` Navigate to ctag on the selected cursor.

" Ag
" - `:Ag 'foo'` Search in the whole project.

" Gsearch
" 1. Select all lines to change.
" 2. `>s/oldstring/newstring`.
" 3. `Greplace`.
" 4. `a` to accept all replacements.
" 5. `wa` write to all files.

" - Tpope Surrounidngs
" - `cs'"` Change surrounding `'` for `"`.
" - `ds'` Delete surrounding `'`.
" - `dst` Delete the surrounding tag, like HTML tag.
" - `cst` Change surrounding tag for the new input one. Supports class attribute.
" - `S` in `visual mode` and then write tag.

" PHP namespace
" - `,n` Add a `use` statement.
" - `,fn` Expand a class' FQNS.
" - `,su` in `visual mode` to sort from shorter to longer.

" PSR-2
" - `fabpot/php-cs-fixer` through composer global install
" - `,pf` to format using psr-2


" Default OS X `Keyboard repeat` values
" - Key repeat: 7
" - Delay until repeat: 3
"
" f<char> to look forward
" F<char> to look back
" ; to look in same direction
" , to look in opposite direction
"
" When on insert mode `jk` to Escape and immediately `l` to go to the
" previous spot. That is `jkl`

" Cycling
" We use Tab and S-Tab for cycling between completion list
" We use C-j to expand an Ultisnip snippet
" We use C-j and C-k to move between Ultisnips tabstops

" Project search & replace
" :args *.txt
" :vimgrep /Vimcasts\.\zscom/g ##
" :cdo %s/Vimcasts\.\zscom/org/ge
" :cdo update
