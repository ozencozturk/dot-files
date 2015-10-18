set nocompatible

"VUNDLE BEGIN
filetype off      
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'blueshirts/darcula'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-repeat'
Plugin 'AndrewRadev/inline_edit.vim'
Plugin 'ozencozturk/open.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'godlygeek/tabular'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'pangloss/vim-javascript.git'
Plugin 'elzr/vim-json'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'
"Plugin 'bling/vim-airline'
"Plugin 'Shutnik/jshint2'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"VUNDLE END


let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
nnoremap so :source ~/.vimrc<cr>

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
inoremap <C-o> <C-x><C-o>
inoremap <C-u> <C-x><C-u>
inoremap <C-f> <C-x><C-f>
inoremap <C-]> <C-x><C-]>
inoremap <C-l> <C-x><C-l>
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let mapleader=","
" NERD tree:
nnoremap gn :NERDTreeToggle<cr>
nnoremap gN :NERDTree<cr>
nnoremap <Leader>f :NERDTreeFind<cr>

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
set expandtab
"ignore case whiling searching unless query is upper case

set ignorecase smartcase


"relative to current line
"set relativenumber
set number
"change boundaries
set cpoptions=ces$

"Allow the cursor to go in to "invalid" places
set virtualedit=all

"show tab completion options
set wildmenu

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
set t_Co=256

set background=dark
let g:rehash256 = 1

"colorscheme railscasts
"colorscheme solarized
"colorscheme molokai
colorscheme darcula
" Delete left-hand side of assignment
nnoremap d= df=x

" Text object for the visible screen - select visible screen
onoremap a+ :<c-u>normal! HVL<cr>
xnoremap a+ :<c-u>normal! HVL<cr>

" Bufsurf
nnoremap <c-w>< :BufSurfBack<CR>
nnoremap <c-w>> :BufSurfForward<CR>

" Show last search in quickfix (http://travisjeffery.com/b/2011/10/m-x-occur-for-vim/)
nmap g/ :vimgrep /<C-R>//j %<CR>\|:cw<CR>
" Open path with external application
nnoremap gu :Open<cr>
xnoremap gu :Open<cr>

" Splitting and joining code blocks
nnoremap sj :SplitjoinSplit<CR>
nnoremap sk :SplitjoinJoin<CR>
" Execute normal vim join if in visual mode
xnoremap sk J

" Execute a command, leaving the cursor on the current line
function! s:InPlace(command)
  let saved_view = winsaveview()
  exe a:command
  call winrestview(saved_view)
endfunction

nnoremap ++ :call <SID>InPlace('normal! gg=G')<cr>

" Yank current file's filename
nnoremap gy :call <SID>YankFilename(1)<cr>
nnoremap gY :call <SID>YankFilename(0)<cr>
function! s:YankFilename(relative)
  let @@ = expand('%:p')

  if a:relative " then relativize it
    let @@ = fnamemodify(@@, ':~:.')
  endif

  let @* = @@
  let @+ = @@

  echo 'Yanked "'.@@.'" to clipboard'
endfunction

" Quit tab, even if it's just one
nnoremap <silent> QQ :call <SID>QQ()<cr>
function! s:QQ()
  for bufnr in tabpagebuflist()
    if bufexists(bufnr)
      let winnr = bufwinnr(bufnr)
      exe winnr.'wincmd w'
      quit
    endif
  endfor
endfunction


" Delete surrounding function call
" Relies on surround.vim
nnoremap <silent> dsf :call <SID>DeleteSurroundingFunctionCall()<cr>
function! s:DeleteSurroundingFunctionCall()
  if search('\k\+\zs[([]', 'b', line('.')) <= 0
    return
  endif

  " what's the opening bracket?
  let opener = getline('.')[col('.') - 1]

  " go back one word to get to the beginning of the function call
  normal! b

  " now we're on the function's name, see if we should move back some more
  let prefix = strpart(getline('.'), 0, col('.') - 1)
  while prefix =~ '\k\(\.\|::\|:\)$'
    if search('\k\+', 'b', line('.')) <= 0
      break
    endif
    let prefix = strpart(getline('.'), 0, col('.') - 1)
  endwhile

  exe 'normal! dt'.opener
  exe 'normal ds'.opener
  silent! call repeat#set('dsf')
endfunction


set laststatus=2
set statusline=%<%f%m\ \ %{getcwd()}\ \ \ %=\ Line:%l\/%L\ Column:%c%V\ %P

"command -nargs=* -complete=help Help vertical belowright help <args>
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
