" solarized dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" make vim more useful
set nocompatible

" VUNDLE
" required by vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic' " file checker
Plugin 'scrooloose/nerdcommenter' " commenting lines or blocks
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround' 
Plugin 'tpope/vim-fugitive' " Git interactions with VIM (blame and diff)
Plugin 'tpope/vim-markdown', { 'for': 'markdown' }
Plugin 'pangloss/vim-javascript', { 'for': 'javascript' } " Better javascript highlight
Plugin 'fatih/vim-go', { 'for': 'go' }
Plugin 'digitaltoad/vim-jade', { 'for': 'jade' }
Plugin 'groenewege/vim-less', { 'for': 'less' }
Plugin 'ap/vim-css-color', { 'for': 'css' }
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
" Themes
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree config
"" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
"" Open NERDTree when vim starts up if
"" no files are specified or opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"" Close NERDTree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" Ignore pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" CtrlP settings
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set wildignore+=*/tmp/*,*.swp,*.zip,*.pyc " Ignore files with ctrlp
" YouCompleteMe
" auto-close the preview window after the user accepts the offered completion
" string
let g:ycm_autoclose_preview_window_after_completion = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Vim-Go
" enable goimports to automatically insert import paths instead of gofmt
let g:got_fmt_command = "goimports"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" enable Emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

set clipboard=unnamed  " OS clipboard by default
set encoding=utf-8 nobomb  " use utf-8 without BOM

" Don’t add empty newlines at the end of files
set binary
set noeol

" change leader to space
let mapleader=" "
" roll 'jk' to leave insert mode
inoremap jk <Esc>

" enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" disable bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" show filename in the window titlebar
set title

" start scrolling three lines before the horizontal window border
set scrolloff=5

syntax on  " enable syntax highlight

set hlsearch  " highlight search
set incsearch  " search as characters are entered

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" instead of failing a command because of unsaved changes, instead 
" raise a dialogue asking if you wish to save changed files
set confirm

set number  " display line numbers
" use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

set autoindent
set smartindent

set cursorline  " highlight current line
set colorcolumn=80  " show ruler at 80

set autoread " automatically refresh any unchanged file

" treat all numerals as decimal, regardless of whether they're padded
" with zeros (ex: <C-a> 007 would change to 010, because vim would
" think it's an octal number)
set nrformats=

set wildmenu  " visual autocomplete for command menu

set showmatch  " highlight matching [{( )}]
set mat=2  " how many tenths of a second to blink

" turn off search highlight
nnoremap <leader>, :nohlsearch<CR>

" shows the current command (shows <leader> while it's active)
set showcmd

" you don't really need help
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set foldenable  " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10  " 10 nested fold max
" fold based on indent level
" other possible: marker, manual, expr, syntax, diff
set foldmethod=indent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" automatic commands
if has("autocmd")
	" enable file type detection
	filetype on

	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
	" treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
	" treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" in normal mode, type <Leader>tl to swap to the tab you viewed last
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Use The Silver Searcher (Ag) over Grep
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor

	let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
	let g:ctrlp_use_caching = 0
	if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif
