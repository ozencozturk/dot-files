set nocompatible              " be iMproved, required


"put a $ while changing word
"ignore case whiling searching unless query is upper case
set ignorecase smartcase

let mapleader=","

"relative to current line
set relativenumber


" change inside paranthesis at the beginning of line
nnoremap ci( f(ci(

" delete inside paranthesis at the beginning of line
nnoremap di( f(di(

set cpoptions=ces$
" Allow the cursor to go in to "invalid" places
set virtualedit=all
"show tab completion options
set wildmenu
"load filetype specific indentation
filetype indent on

map <C-j> <C-w>j<CR>
map <C-k> <C-w>k<CR>
map <C-h> <C-w>h<CR>
map <C-l> <C-w>l<CR>

"higlight mathing ( etc
set showmatch
set incsearch
set hlsearch
set cursorline
" for copy pasting system buffer
set clipboard=unnamed
set paste
set go+=a

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'joshhartigan/vim-reddit'
Plugin 'ryanss/vim-hackernews'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'wikitopian/hardmode'
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

syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
