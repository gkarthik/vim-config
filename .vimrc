set nocompatible							" be iMproved, required
filetype off									" required
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
Plugin 'WolfgangMehner/vim-plugins'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
" let g:syntastic_check_on_open=1

"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview
Plugin 'vim-scripts/taglist.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Python Autocomplete
Plugin 'davidhalter/jedi-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" All of your Plugins must be added before the following line
call vundle#end()						 " required
filetype plugin indent on		 " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList				- lists configured plugins
" :PluginInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean			- confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set hidden
syntax on
syntax enable
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
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.
set pastetoggle=<F2>
autocmd filetype python set expandtab
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" set the binding for delimitate
imap <C-c> <CR><Esc>O

autocmd VimEnter * NERDTree | wincmd p
set showtabline=2

"Close if NERDTREE last buffer
"https://yous.be/2014/11/30/automatically-quit-vim-if-actual-files-are-closed/
function! CheckLeftBuffers()
	if tabpagenr('$') == 1
		let i = 1
		while i <= winnr('$')
			if getbufvar(winbufnr(i), '&buftype') == 'help' ||
					\ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
					\ exists('t:NERDTreeBufName') &&
					\		bufname(winbufnr(i)) == t:NERDTreeBufName ||
					\ bufname(winbufnr(i)) == '__Tag_List__'
				let i += 1
			else
				break
			endif
		endwhile
		if i == winnr('$') + 1
			qall
		endif
		unlet i
	endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

"set t_Co=256
se t_Co=16
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
