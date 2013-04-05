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

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

Bundle 'SirVer/ultisnips'

" Bundle 'skammer/vim-css-color'
Bundle 'HTML-AutoCloseTag'
" Bundle 'thanthese/Tortoise-Typing'

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
