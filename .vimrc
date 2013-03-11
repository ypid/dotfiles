"" vim: foldmethod=marker
"set encoding=utf-8

"" Setup Pathogen to manage your plugins
"" mkdir -p ~/.vim/autoload ~/.vim/bundle
"" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
"" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

"" Better copy and paste
"" When you want to paste large blocks of code into vim, press F2 before you
"" paste. At the bottom you should see ``-- INSERT (paste) --``.
set clipboard=unnamed

"" Mouse and backspace. I don’t really like that and I don’t need it either.
" set mouse=a

"" Mappings {{{1
let mapleader = ','

set pastetoggle=<F2>

"" Plugins {{{2
"" Settings for easymotion
let g:EasyMotion_leader_key = '<Leader>j'

"" Settings for command-t
let g:CommandTAcceptSelectionSplitMap = '<C-o>'

"" Setting for Gundo
nnoremap <Leader>g :GundoToggle<CR>

"" Personal mappings {{{2
"" map: nvo
"" map!: ic
"" Filetype detact
map <Leader>f :filetype detect<CR>
inoremap <Leader>fd <ESC>:filetype detect<CR>a

"" Bind nohl
"" Removes highlight of your last search
map <Leader>b :nohl<CR>
inoremap <Leader>b <ESC>:nohl<CR>a

"" Bind set list
map <Leader>l :set list!<CR>
inoremap <Leader>l <ESC>:set list!<CR>a

"" Insert current full path of the file
inoremap <Leader>fn <ESC>:put =expand('%:p')<CR>a

"" Spellcheck
set spelllang=en_us
map <Leader>c :set spell!<CR>
inoremap <Leader>c <ESC>:set spell!<CR>a

"" Save
map <Leader>s :update<CR>
inoremap <Leader>s <ESC>:update<CR>a

"" Save and exit
map <Leader>x :x<CR>
inoremap <Leader>x <ESC>:x<CR>

"" Quick quit command
nnoremap <Leader>e :quit<CR>
"" Quit current window
nnoremap <Leader>E :qa!<CR>
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

"" Color scheme {{{1
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors
"" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod
"" colorscheme delek
"" colorscheme default
" set listchars=tab:-
set listchars=tab:→\ ,eol:$,trail:.,extends:>,precedes:<,nbsp:_

"" Enable syntax highlighting
"" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on

"" Showing line numbers and length
set number  " show line numbers
" set relativenumber
" set showbreak=…
set tw=79   " width of document (used by gd)
"set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
if version >= 703
	set colorcolumn=+1
endif
" highlight ColorColumn ctermbg=233


"" easier formatting of paragraphs
" vmap Q gq
" nmap Q gqap


"" Useful settings
" set history=700
" set undolevels=700


"" Real programmers don't use TABs but spaces
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set shiftround
" set expandtab

set ai
set tabstop=8
set pastetoggle=<F2>
if has("autocmd") && !exists("autocommands_loaded")
	autocmd bufwritepost .vimrc source %
	autocmd FileType perl setlocal expandtab shiftwidth=4 softtabstop=4
	autocmd FileType python setlocal shiftwidth=4 tabstop=4
	autocmd FileType tex setlocal expandtab shiftwidth=2 softtabstop=2
	let autocommands_loaded = 1
endif

filetype plugin on
if has('gui_running')
    set grepprg=grep\ -nH\ $*
    filetype indent on
    let g:tex_flavor='latex'
endif

au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

"" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Disable stupid backup and swap files - they trigger too many events
"" for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile

"" Python folding
"" mkdir -p ~/.vim/ftplugin
"" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
