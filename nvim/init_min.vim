" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:

set nocompatible        " Must be first line.
scriptencoding utf-8

" Tim Pope sensible.vim - Defaults everyone can agree on (pasted here) {{{
unlet! g:loaded_sensible

" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.2

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif
" }}}

" Basic functions {{{

function! EnsureDirExists (dir)
    if !isdirectory(a:dir)
        if exists("*mkdir")
            call mkdir(a:dir,'p')
        else
            echo "Please create directory: " . a:dir
        endif
    endif
endfunction

" }}}

" General {{{

set formatoptions+=or               " Automatically continue comment lines.
set wrap linebreak                  " Wrap long lines between words.
set textwidth=0
set linebreak
set expandtab
set shiftwidth=4                    " Use indents of 4 spaces.
set tabstop=4                       " An indentation every four columns.
set softtabstop=4                   " Let backspace delete indent.

set mousehide                       " Hide the mouse cursor while typing
set mouse=a                         " Enable mouse wheel scrolling

if has ('x') && has ('gui')         " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')                  " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif

set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set splitbelow                      " Open new splits below (for Gdiff)
set fileignorecase                  " Comes in very handy when your are used to ZSH.
set ignorecase                      " Comes in very handy when your are used to ZSH.

" set tags=./tags;/                   " Look in all upper Directorys for tags files
" Did not work. http://stackoverflow.com/a/741486

set iskeyword+=-
set iskeyword-=:
set commentstring=#%s

set number
set showmatch                       " Show matching brackets/parenthesis
set hlsearch                        " Highlight search terms
set smartcase                       " Case sensitive when uc present
set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.  set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too
set scrolljump=0                    " Lines to scroll when cursor leaves screen
set scrolloff=3                     " Minimum lines to keep above and below cursor
set foldenable                      " Auto fold code
set foldopen+=search
set foldmethod=marker
set listchars=tab:›\ ,trail:•,extends:#,nbsp:~
set tabpagemax=15                   " Only show 15 tabs
set noshowmode                      " This is covered by airline.
set cursorline

set spell
syntax spell toplevel

" Setting up the directories {{{

call EnsureDirExists($HOME . '/.cache/vim/swap')
set directory=~/.cache/vim/swap/
set writebackup

" call EnsureDirExists($HOME . '/.vimbackup')
" set backup                  " Backups are nice ...
" set backupskip=/tmp/*,crypt,sec,mnt
" set backupdir=~/.vimbackup,/var/tmp,/tmp,.

call EnsureDirExists($HOME . '/.cache/vim/view')
set viewdir=~/.cache/vim/view/

if has('persistent_undo')
    call EnsureDirExists($HOME . '/.cache/vim/undo')
    set undofile
    set undodir=~/.cache/vim/undo/
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set viminfo+=n~/.cache/vim/viminfo

let g:skipview_files = [
    \ '*sec*',
    \ '*crypt*'
    \ ]

" }}}

" IncludeExprForSmartGF {{{
function! IncludeExprForSmartGF(fname)
    " When attempting to open a relative file and it does not yet exist,
    " create it.
    " This function hooks into normal mode commands like gf and create creates
    " the file if it does not yet exist. It is only executed if the file
    " cannot be found by Vim itself.

    " Improved version of https://stackoverflow.com/questions/6158294/create-and-open-for-editing-nonexistent-file-under-the-cursor/6159415#6159415
    " TODO: POST to Stackoverflow.
    let fname = a:fname

    " call system("echo " . fname . " >> /tmp/log")
    " let fname = substitute(fname,'^.*','/tmp/sd','')

    if match(fname, '^/') == -1
        if !filereadable(fname)
            call EnsureDirExists(fnamemodify(fname, ":p:h"))
            call system("touch " . fname)
        endif
    endif

    return fname
endfunction

set includeexpr=IncludeExprForSmartGF(v:fname)

" }}}

" }}}

" Settings if used standalone {{{

if !exists('g:config_section_enable')
    highlight clear SpellBad
    highlight SpellBad cterm=underline ctermbg=None
    highlight SpellCap cterm=underline ctermbg=None
    highlight DiffChange ctermbg=Yellow
endif

" }}}

" GUI Settings {{{

" GVIM- (here instead of .gvimrc)
if !exists('g:config_section_enable') || count(g:config_section_enable, 'gui_config')
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 15,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 12
        elseif has("gui_win32")
            set guifont=Andale_Mono:h12,Menlo:h12,Consolas:h12,Courier_New:h12
        endif
    endif
endif

" }}}

" Key (re)Mappings {{{

" Mappings which only work with plugins enabled should be placed in the
" Plugin section.

" Overwrite default Vim mappings {{{

" Move cursor by display lines when wrapping.
" Source: https://www.youtube.com/watch?v=Yiw2f3m73Fo
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" Visual shifting by reentering visual mode automatically again.
vnoremap < <gv
vnoremap > >gv

" Use space to toggle folds open/closed.
" Source: https://www.youtube.com/watch?v=Yiw2f3m73Fo
noremap <space> za

" }}}

" Map leader mappings {{{

let mapleader = ','

" Save and go to normal mode.
noremap <Leader>s :update<CR>
inoremap <Leader>s <ESC>:update<CR>l

" Save and exit.
noremap <Leader>x :x<CR>
inoremap <Leader>x <ESC>:x<CR>

" Quick quit command.
noremap <Leader>e :quit<CR>

" Quit all windows.
noremap <Leader>E :quit!<CR>

" Filetype detect.
noremap <Leader>fd :filetype detect<CR>
inoremap <Leader>fd <c-o>:filetype detect<CR>

" Open my .vimrc.
noremap <Leader>ff :tabnew $MYVIMRC<CR>
noremap <Leader>fm :tabnew $HOME/.config/nvim/init_min.vim<CR>

" Insert current full path of the file.
inoremap <Leader>fp <ESC>:put =expand('%:p')<CR>kJA

" Insert current file name.
" inoremap <Leader>fn <ESC>"%p<CR>g;
" Just use Ctrl-r%

" Toggle highlight search.
noremap <silent> <Leader>B :set invhlsearch<CR>
inoremap <silent> <Leader>B <c-o>:set invhlsearch<CR>
noremap <silent> <Leader>b :nohlsearch<CR>
inoremap <silent> <Leader>b <c-o>:nohlsearch<CR>

" let hlstate=0
" let lastsearchstring = @/
" noremap <Leader>b :call Togglehlsearch()<CR>

" let hlstate=0
" nnoremap  :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" Toggle set list.
noremap <Leader>l :set list!<CR>
inoremap <Leader>l <c-o>:set list!<CR>

" Spellcheck { set spellfile=~/.vim/spell/en.utf-8.add set dictionary+=/usr/share/dict/words
" English is the default. German is legacy and is to be enabled
" only as needed.
"
if has('win32') || has('win64')
    set spelllang=en_us
else
    set spelllang=en_us,de_de
endif
noremap <Leader>cd :set spell!<CR>
inoremap <Leader>cd <c-o>:set spell!<CR>

" }}}

" Easier moving between tabs.
noremap ψ :tabprevious<CR>
inoremap ψ <c-o>:tabprevious<CR>
" Shift+Layer3Mod+h
noremap λ :tabnext<CR>
inoremap λ <c-o>:tabnext<CR>
" Shift+Layer3Mod+l

" Date and time handling.
function! TranslateDateVisual()
    sil! norm! gv"ty
    echo system('date -d @'. @t)
endfunction

function! InsertDateVisual()
    sil! norm! gv"ty
    exec "normal! cw".system('date -d @'. @t)
endfunction

" Translate the current word (Unix time stamp) to a human readable time.
noremap <Leader>td :echo system('date -d @'.expand('<cword>'))<CR>
vmap <Leader>td :call TranslateDateVisual()<CR>


" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
    let l:modeline = printf("vim: set ts=%d sw=%d tw=%d %set :",
                \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    call append(line("$"), l:modeline)
    normal '.
    call NERDComment('n', 'Toggle')
endfunction
nnoremap <silent> <Leader>am :call AppendModeline()<CR>

" Copy the whole puffer to primary system clipboard, without the
" newline at the end …
" I am using this to write my texts in Vim and copy them in all sorts
" of text boxes.
nnoremap χ :normal gg"+yG2<c-o><CR>
" Shift+Layer3Mod+c

noremap <silent> <Leader>tp :split<CR>:resize 6<CR>

function! AppendFoldMarker(fold)
    if (a:fold == "open")
        silent! substitute#[^*][^/]\zs\s\?$# /* {{{ */#
    else
        silent! substitute#[^*][^/]\zs\s\?$# /* }}} */#
    endif
    echo
    nohlsearch
endfunction

nnoremap <Leader>fa :call AppendFoldMarker('open')<cr>
inoremap <Leader>fa <ESC>:call AppendFoldMarker('open')<cr>
nnoremap <Leader>fj :call AppendFoldMarker('close')<cr>
inoremap <Leader>fj <ESC>:call AppendFoldMarker('close')<cr>;

function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
    $put ='</PrettyXML>'
    silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file#Extended_version
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
    let ft=toupper(a:filetype)
    let group='textGroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.'
                \ matchgroup='.a:textSnipHl.'
                \ start="'.a:start.'" end="'.a:end.'"
                \ contains=@'.group
endfunction

" }}}

" Other mappings {{{
    set pastetoggle=α
    " Shift+Layer3Mod+a

    if !exists('g:spf13_bundle_groups') || !count(g:spf13_bundle_groups, 'general')
        " Ctrl+a is used by tmux and screen
        " vim-speeddating
        nnoremap <c-s> <c-a>

        " Don‘t use Ctrl+a even if not in tmux.
        " This would also break <c-s>
        " noremap <c-a> <Nop>
    endif

    " Every unnecessary keystroke that can be saved is good for your health :)
    noremap <silent> <c-j> <c-w>j
    noremap <silent> <c-k> <c-w>k
    noremap <silent> <c-l> <c-w>l
    noremap <silent> <c-h> <c-w>h

    " https://vim.fandom.com/wiki/Recover_from_accidental_Ctrl-U
    inoremap <c-u> <c-g>u<c-u>
    inoremap <c-w> <c-g>u<c-w>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " I use this so that Ctrl-c also works in the command-line window like Escape.
    " Does not work
    " noremap <c-c> <ESC>
    "
    " inoremap <c-c> <Nop>
    " Use Neo2 Escape because it works everywhere.
    " Disabling because it breaks Cygwin + qNeo2 setup.

    " noremap <c-m> <c-t>
    " Does also remap <return> to <c-t>
    " nnoremap <c-n> <c-]>
    " Put it into ~/.vim/after/plugin/overwrite.vim

    command! -complete=file -nargs=? O tabnew <args>
" }}}

" Windows compatible {{{

if has('win32') || has('win64')
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

if exists('+shellslash')
    " Do the same what improved M$ cmd does but in reverse :)
    " Use forward backslashes as directory separator on Windows.
    " If you type backwards slashes, Vim will upgrade them to forward backslashes.
    set shellslash
endif

" }}}

" M$ Windows specifics {{{

" Vim on Windows is not able to run my fully blown config with plugins.
if has('win32') || has('win64')
    if filereadable(expand("~/.config/dotfiles/vim/bundle/outlook/plugin/outlook.vim"))
        source ~/.config/dotfiles/vim/bundle/outlook/plugin/outlook.vim
        let g:outlook_Javascript = '$HOME/.config/dotfiles/vim/bundle/outlook/plugin/outlookvim.js'
    endif
endif

" }}}

" Machine specific configuration {{{

" Needs to stay outside of ~/.config/nvim/ to ensure the path is writable.
if filereadable(expand("~/.vimrc.private"))
    " Synced on trusted systems. On others it can be created and the
    " content will not be synced.
    source ~/.vimrc.private
endif
if filereadable(expand("~/.vimrc.local"))
    " Machine specific.
    source ~/.vimrc.local
endif

" }}}
