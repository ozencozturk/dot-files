set nocompatible

"copies the indent from previous line
set autoindent
	
"tab indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
		     
"ignore case whiling searching unless query is upper case
set ignorecase smartcase

let mapleader=","

"relative to current line
set relativenumber

"change inside paranthesis at the beginning of line
nnoremap ci( f(ci(

"delete inside paranthesis at the beginning of line
nnoremap di( f(di(

"change boundaries
set cpoptions=ces$

"Allow the cursor to go in to "invalid" places

set virtualedit=all

"show tab completion options
set wildmenu

"ctrl p ve ctrl n options 
set complete=.,w,b,t

"load filetype specific indentation
filetype indent on

"window navigation
map <C-j> <C-w>j<CR>
map <C-k> <C-w>k<CR>
map <C-h> <C-w>h<CR>
map <C-l> <C-w>l<CR>

"higlight mathing etc
set showmatch
set incsearch
set hlsearch

"showing current selected line
set cursorline

" for copy pasting system buffer
set clipboard=unnamed
set paste
set go+=a

"disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
filetype off      


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
"Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
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

syntax on
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
