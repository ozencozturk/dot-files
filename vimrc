set nocompatible

"VUNDLE BEGIN
filetype off      
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
"VUNDLE END

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

" Open new tab more easily:
nnoremap ,t :tabnew<cr>
nnoremap ,T :tabedit %<cr>gT:quit<cr>
" Moving through tabs:
nnoremap <C-l> gt
nnoremap <C-h> gT

"windows navigation
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
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

"select vv
nnoremap vv _vg_

"change word indent
nnoremap <C-u> mzg~iw`z	

"tab indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
		     
"ignore case whiling searching unless query is upper case
set ignorecase smartcase

let mapleader=","

"relative to current line
"set relativenumber
set number
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

syntax on
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
