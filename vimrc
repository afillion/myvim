set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Doc, dont delete
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" Linter
Plugin 'scrooloose/syntastic'

" snippet
Plugin 'Geam/snipMate'

Plugin 'scrooloose/nerdtree'

Plugin 'luochen1990/rainbow'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on						" syntaxic coloration
set encoding=utf-8      		" utf8 or gtfo
let mapleader = ' '				" leader key used by some plugins
filetype plugin indent on		" activate filetype detection,
set number						" line number

" Visual settings
set t_Co=256                     " force vim to use 256 colors
set background=dark

" autocompletion {{{
set wildmenu                     " show more than one suggestion for completion
set wildmode=list:longest        " shell-like completion (up to ambiguity point)
set wildignore=*.o,*.out,*.obj,*.pyc,.git,.hgignore,.svn,.cvsignore

set autoread                     " watch if the file is modified outside of vim
set hidden                       " allow switching edited buffers without saving
" }}}

" Put all backup and swap in one place {{{
set backupdir=~/.vim/tmp,/tmp
set directory=~/.vim/tmp,/tmp
" }}}

if exists('+colorcolumn')
    set colorcolumn=80
    "else
    "  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" http://tedlogan.com/techblog3.html
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    augroup vimrcEx " {
        au!

        " For all text files set 'textwidth' to 80 characters.
        autocmd FileType text setlocal textwidth=80

        " Jump to the last known cursor position when editing a file
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

        " FileType {{{
        " http://tedlogan.com/techblog3.html
        autocmd FileType sh setlocal ts=4 sts=4 sw=4 et ai " sh
        autocmd FileType c setlocal ts=4 sts=4 sw=4 noet ai " c
        autocmd FileType cpp setlocal ts=4 sts=4 sw=4 et ai " cpp
        autocmd FileType make setlocal ts=4 sts=4 sw=4 noet ai " Makefile
        autocmd FileType vim setlocal ts=4 sts=4 sw=4 et ai " Vim
        autocmd FileType text setlocal ts=2 sts=2 sw=2 et ai " Text
        autocmd FileType markdown setlocal ts=4 sts=4 sw=4 et ai " Markdown
        autocmd FileType html setlocal ts=2 sts=2 sw=2 et ai " (x)HTML
        autocmd FileType php,java setlocal ts=2 sts=2 sw=2 et ai nocindent " PHP & Java
        autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et ai nocindent " JavaScript
        autocmd FileType python setlocal ts=4 sts=4 sw=4 et ai " Python
        autocmd FileType ocaml setlocal ts=2 sts=2 sw=2 et ai " Ocaml
        autocmd FileType lisp setlocal ts=2 sts=2 sw=2 et ai " Lisp
        autocmd FileType go setlocal ts=2 sts=2 sw=2 et ai " go
        autocmd BufNewFile,BufRead *.h set ft=c
        autocmd BufNewFile,BufRead *.json set ft=javascript
        autocmd BufNewFile,BufRead *.webapp set ft=javascript
        autocmd BufNewFile,BufRead *.tpp set ft=cpp
        " }}}

    augroup END " }

    " Suppression of space at end of line {{{
    augroup delete_space
        autocmd!
        autocmd BufWrite * silent! %s/[\r \t]\+$//
    augroup END
    " }}}

else
    set autoindent                 " always set autoindent (ai) on
endif " has("autocmd")

nnoremap <leader>r :set relativenumber !<cr>

" Syntastic {{{
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='★'
let g:syntastic_style_error_symbol='>'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='>'
let g:syntastic_c_include_dirs=[ '.', './includes', '../includes', './libft/includes' , '../libft/includes' ]
let g:syntastic_cpp_compiler_options = ' -std=c++11'
" }}}

" NERDTree {{{
nnoremap <C-n> :NERDTreeToggle<CR>
" }}}

" Rainbow {{{
let g:rainbow_active = 1
" }}}
