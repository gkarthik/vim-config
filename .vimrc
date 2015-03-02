set nocompatible              " be iMproved, required
filetype off                  " required
set hidden

set t_Co=256
syntax on
set background=dark
set number
set nowrap
set backspace=indent,eol,start
autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql
set autoindent
:%retab!
set showmatch
set copyindent
set hlsearch
set incsearch
set shiftround

set ignorecase
set smartcase
set smarttab

set title
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile

if &t_Co >= 256 || has("gui_running")
  colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
" switch syntax highlighting on, when the terminal has colors
  syntax on
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.
set pastetoggle=<F2>

filetype plugin indent on
autocmd filetype python set expandtab


filetype plugin on
set omnifunc=syntaxcomplete#Complete

" set the binding for delimitate
imap <C-c> <CR><Esc>O

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/syntastic'

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
" let g:syntastic_check_on_open=1

Plugin 'Valloric/YouCompleteMe'

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview

Plugin 'marijnh/tern_for_vim'

Plugin 'msanders/snipmate.vim'

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