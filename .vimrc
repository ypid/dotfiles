"" vim: foldmethod=marker
"set encoding=utf-8

"" Read common configuration from that file
source ~/.vimpagerrc

"" Plugins {{{1

"" My Bundles here:
"" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-repeat'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'
" Bundle 'matchit.zip'
" Bundle 'indenthtml.vim'
" Bundle 'Lokaltog/powerline'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

" Bundle 'skammer/vim-css-color'
Bundle 'HTML-AutoCloseTag'
" Bundle 'thanthese/Tortoise-Typing'

"" DetectIndent
Bundle 'ciaranm/detectindent'
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 8

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
let g:ctrlp_mruf_max = 2000
nmap <Leader>r :CtrlPMRUFiles<CR>

"" gundo
Bundle 'sjl/gundo.vim'
nnoremap <Leader>g :GundoToggle<CR>

if version >= 703
    set colorcolumn=+1
endif

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

syntax on
filetype plugin indent on

"" Real programmers don't use TABs but spaces
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set shiftround
" set expandtab

"" Set shiftwidth and softtabstop to the value of tabstop
function! SetShiftwidthAndTabstop()
    let &l:sts = &l:ts
    let &l:sw  = &l:ts
endfunction

" function! DetectIndentIfNotEmptyBuf()
"     if line('$') == 1 && getline(1) == ''
"         echo "Empty"
"     else
"         echo "Not Empty"
"         DetectIndent
"     endif
" endfunction

set autoindent
set tabstop=4
if has("autocmd") && !exists("autocommands_loaded")
    " set verbose=9
    filetype on
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost .vimpagerrc source %
    autocmd BufRead,BufNewFile .vimpagerrc set ft=vim
    au VimLeave * if filereadable($HOME."/.vim/bundle/vundle/.netrwhist")|call delete($HOME."/.vim/bundle/vundle/.netrwhist")|endif
    autocmd FileType perl setlocal expandtab tabstop=4
    autocmd FileType vim setlocal expandtab tabstop=4
    autocmd FileType python setlocal tabstop=4
    autocmd FileType tex setlocal expandtab tabstop=2
    autocmd FileType c setlocal noexpandtab tabstop=4
    " autocmd BufRead,BufNewFile * call DetectIndentIfNotEmptyBuf()
    autocmd BufRead * DetectIndent
    " autocmd BufWritePost * echo &ff
    autocmd BufRead,BufNewFile * call SetShiftwidthAndTabstop()
    let autocommands_loaded = 1
endif

"" Python folding
"" mkdir -p ~/.vim/ftplugin
"" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
