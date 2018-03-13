set nocompatible
"VUNDLE BEGIN
filetype off      
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'AndrewRadev/dsf.vim'
"Plugin 'tpope/vim-commentary'
Plugin 'kshenoy/vim-signature'
"Plugin 'tpope/vim-eunuch'
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'blueshirts/darcula'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'nanotech/jellybeans.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'mileszs/ack.vim'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tpope/vim-surround'
Plugin 'wikitopian/hardmode'
"Plugin 'tpope/vim-repeat'
"Plugin 'AndrewRadev/inline_edit.vim'
"Plugin 'ozencozturk/open.vim'
"Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'nelstrom/vim-visual-star-search'
"Plugin 'elzr/vim-json'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"VUNDLE END

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Alright... let's try this out
vmap v <ESC>
set timeoutlen=500

let mapleader=","

"Basic movement
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

"go manual see https://github.com/AndrewRadev/Vimfiles/blob/master/personal/plugin/open.vim
nnoremap gm :call Open('http://google.com/search?q=' . expand("<cword>"))<cr>

"go to text objects din( din paranthesis etc
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
    let c = "("
  elseif c ==# "B"
    let c = "{"
  elseif c ==# "d"
    let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
"copies the indent from previous line
set autoindent

"tab indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"ignore case whiling searching unless query is upper case

set ignorecase smartcase

"set relativenumber
set number
"change boundaries
set cpoptions=ces$

"Allow the cursor to go in to "invalid" places
set virtualedit=all

"show tab completion options
set wildmenu

"show info about current cmd at the bottom of screen
set showcmd

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

"ctrl p ve ctrl n options 
set complete=.,w,b,t

"load filetype specific indentation
filetype indent on

"higlight mathing etc
set showmatch
set incsearch
set hlsearch

"showing current selected line
set cursorline

"disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"syntax enable will keep your current color settings
syntax enable
colorscheme darcula

"adjust status bar
set laststatus=2
set statusline=%<%f%m\ \ %{getcwd()}\ \ \ %=\ Line:%l\/%L\ Column:%c%V\ %P

"disable vim backup files
set nobackup
set nowritebackup
set noswapfile
