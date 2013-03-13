"" vim: foldmethod=marker
"set encoding=utf-8

set nocompatible               " be iMproved
filetype off                   " required!
let mapleader = ','

"" Plugins {{{1
"" let Vundle manage Vundle
"" git://github.com/gmarik/vundle.git
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

"" required!
Bundle 'gmarik/vundle'

"" My Bundles here:
"" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'Townk/vim-autoclose'
Bundle 'bronson/vim-visual-star-search'
Bundle 'tpope/vim-repeat'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'
" Bundle 'matchit.zip'
" Bundle 'indenthtml.vim'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle 'garbas/vim-snipmate'

"" NERDTree
Bundle 'scrooloose/nerdtree'
map <c-n> :NERDTreeToggle<CR>
inoremap <c-n> <ESC>:NERDTreeToggle<CR>a

"" CtrlP
Bundle 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_save_on_update = 0
let g:ctrlp_extensions = ['line']
let g:ctrlp_open_new_file = 'h'
nmap <Leader>r :CtrlPMRUFiles<CR>

"" gundo
Bundle 'sjl/gundo.vim'
nnoremap <Leader>g :GundoToggle<CR>

"" easymotion
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>j'

"" translate
"" you can print the last translated word with ""p
Bundle 'mattn/webapi-vim'
let g:trans_has_python = 0
Bundle 'Rykka/trans.vim'
let g:trans_default_lang = 'de'
let g:trans_map_trans = '<Leader>tr'

"" Mappings {{{1
set pastetoggle=<F2>

"" map: nvo
"" map!: ic

"" I use this so that Ctrl-c also works in the command-line window like Escape.
"" Does not work
" map! <c-c> <ESC>

"" Filetype detact
map <Leader>fd :filetype detect<CR>
inoremap <Leader>fd <ESC>:filetype detect<CR>a

"" erase bad whitespace from vim-bad-whitespace
map <Leader>fc :EraseBadWhitespace<CR>
inoremap <Leader>fc <ESC>:EraseBadWhitespace<<CR>a

"" Toggle highlight search
map <Leader>b :nohl<CR>
inoremap <Leader>b <ESC>:nohl<CR>a

"" <Leader>a does interfere <c-a>
map <Leader>p :set number!<CR>
inoremap <Leader>p <ESC>:set number!<CR>a

"" Bind set list
map <Leader>l :set list!<CR>
inoremap <Leader>l <ESC>:set list!<CR>a
" map <c-i> :set list!<CR>
" inoremap <c-i> <ESC>:set list!<CR>a

"" Insert current full path of the file
inoremap <Leader>fn <ESC>:put =expand('%:p')<CR>a

"" Spellcheck
set spelllang=en_us
map <Leader>c :set spell!<CR>
inoremap <Leader>c <ESC>:set spell!<CR>a

"" Save and go to normal mode
map <Leader>s :update<CR>
inoremap <Leader>s <ESC>:update<CR>l

"" Save and exit
map <Leader>x :x<CR>
inoremap <Leader>x <ESC>:x<CR>

"" Quick quit command
nnoremap <Leader>e :quit<CR>
"" Quit current window
" nnoremap <Leader>E :qa!<CR>
"" Quit all windows

"" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
"" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"" set the executable bit
map <Leader>y :w!<CR>:!chmod +x %<CR>:q<CR>
inoremap <Leader>y <ESC>:w!<CR>:!chmod +x %<CR>:q<CR>a

"" map sort function to a key
"" vnoremap <Leader> :sort<CR>

"" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"" easier formatting of paragraphs
" vmap Q gq
" nmap Q gqap

"" How vim should look like {{{1
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors
"" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod
" highlight ColorColumn ctermbg=233
"" colorscheme delek
"" colorscheme default
" set listchars=tab:-
set listchars=tab:→\ ,eol:$,trail:.,extends:>,precedes:<,nbsp:_
syntax on

"" Behavior {{{1
"" You need to reload this file for the change to apply
filetype on
filetype plugin indent on

set nofoldenable
"" Showing line numbers and length
set number  " show line numbers
" set relativenumber
" set showbreak=…
set tw=79   " width of document (used by gd)
"set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set autochdir
if version >= 703
	set colorcolumn=+1
endif

"" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Better copy and paste
"" When you want to paste large blocks of code into vim, press F2 before you
"" paste. At the bottom you should see ``-- INSERT (paste) --``.
set clipboard=unnamed

"" Mouse and backspace. I don’t really like that and I don’t need it either.
" set mouse=a

"" Disable stupid backup and swap files - they trigger too many events
"" for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile

"" Useful settings
" set history=700
" set undolevels=700


"" Real programmers don't use TABs but spaces
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set shiftround
" set expandtab

set autoindent
set tabstop=8
" && !exists("autocommands_loaded")
if has("autocmd")
	autocmd bufwritepost .vimrc source %
	autocmd FileType perl setlocal expandtab shiftwidth=4 softtabstop=4
	autocmd FileType vim setlocal expandtab shiftwidth=4 softtabstop=4
	autocmd FileType python setlocal shiftwidth=4 tabstop=4
	autocmd FileType tex setlocal expandtab shiftwidth=2 softtabstop=2
	let autocommands_loaded = 1
endif

"" Python folding
"" mkdir -p ~/.vim/ftplugin
"" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
