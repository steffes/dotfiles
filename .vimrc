""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               To remember                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <ctrl+w>  backwards kill word
" gi        go to last position of insert mode
" gf        go to file/route/class with vim-rails
" <ctrl+o>  move out a level
" <ctrl+i>  move in a level

"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------
cd ~/Dropbox/dev

set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" For Haskell Programming
Plugin 'eagletmt/ghcmod-vim'
" plugin on GitHub repo
Plugin 'simplenote.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'ternjs/tern_for_vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

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

" Get pathogen up and running
call pathogen#infect()

" System default for mappings is now the "," character
let mapleader = ","

" Set ctags
map <leader>ct :!/usr/local/bin/ctags -R --exclude=.git --exclude=log *<CR>
set tags=./tags

" Use Ack
set grepprg=ack

" Ultisnips Config
let g:UltiSnipsSnippetDirectories = [ "snippets" ]
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Quick edit Ultisnips
nmap <silent> ,es :UltiSnipsEdit<CR>

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Ruby is 2 spaces
autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType scss setlocal softtabstop=4 shiftwidth=4 tabstop=4

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" set the search scan to wrap lines
set wrapscan

set ignorecase

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions-=T

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page STARTs to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hls

" Incrementally match the search
set incsearch

" Automatically read a file that has changed on disk
set autoread

" Line numbering
set nu

" Custom mappings
" HTML
map <leader>b <s-s>tstrong>
map <leader>e <s-s>tem>
map <leader>p <s-v><s-s>tp><s-j>x<s-j>x0
map <leader>a <s-s>ta href="#">f#xi
nnoremap <leader>a f>
" Ack
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" Haml
map <leader>ch 0<c-v>lr/<cr>

" File Movement
map j gj
map k gk

" Indenting in insert
inoremap <D-]> <esc>>>i
inoremap <D-[> <esc><<i

" Awesome status line
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

" easy match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Command + Enter doesnt disturb line for css
inoremap <D-CR> <C-O>o
inoremap <D-S-CR> <esc>:/}<cr>o<cr><esc>:nohls<cr>cc
" this is for delimitMate
inoremap {<CR> {<CR>}<C-o>O
" Autoclose setting
let AutoCloseExpandEnterOn = '{'

" Ctrl + Enter to block-edit element
inoremap <c-cr> <cr><esc>kl%a<cr>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

" Delete empty lines
nmap ,del :g/^$/d<cr>

" Rails
inoremap <D-lt> <%=  %><esc>hhi
inoremap <D->> <%  %><esc>hhi

" delete lines and move cursor
inoremap <c-k> <esc>kddi
inoremap <c-j> <esc><s-o><esc>ji

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>

" Misc
nmap <leader>i =i{

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------

set guifont=Consolas:h14
set background=dark
colorscheme hybrid

:nohls

autocmd VimEnter * NERDTree
