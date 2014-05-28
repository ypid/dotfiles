" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Environment {
    " Basics {
        set nocompatible        " must be first line
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
    "
    " Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off
        set rtp+=~/.vim/bundle/vundle
        " let g:vundle_default_git_proto = 'git'
        call vundle#rc()
        Bundle 'gmarik/vundle'
    " }

" }

" Key (re)Mappings {
    " Mappings which only work with plugins enabled should be placed in the
    " Plugin section.

    " Overwrite default Vim mappings {
        map gf :sp <cfile><CR>

        " Wrapped lines goes down/up to next row, rather than next line in file.
        noremap j gj
        noremap k gk

        " Visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv
    " }


    set pastetoggle=<F2>           " pastetoggle (sane indentation on pastes)

    " Map leader mappings {{{
    let mapleader = ','

    " Save and go to normal mode
    map <Leader>s :update<CR>
    imap <Leader>s <ESC>:update<CR>l

    " Filetype detact
    map <Leader>fd :filetype detect<CR>
    imap <Leader>fd <ESC>:filetype detect<CR>a

    " Save and exit
    map <Leader>x :x<CR>
    imap <Leader>x <ESC>:x<CR>

    " Quick quit command
    nmap <Leader>e :quit<CR>
    " Quit all windows
    nmap <Leader>E :q!<CR>

    " Code folding options {{{
    " nmap <leader>f0 :set foldlevel=0<CR>
    " Use zM for this
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
    " }}}

    " Toggle highlight search
    nmap <Leader>B :set invhlsearch<CR>
    nmap <Leader>b :nohlsearch<CR>

    " Bind set list
    map <Leader>l :set list!<CR>
    imap <Leader>l <ESC>:set list!<CR>a

    " Insert current full path of the file
    imap <Leader>fp <ESC>:put =expand('%:p')<CR>kJA

    " Insert current file name
    " imap <Leader>fn <ESC>"%p<CR>g;
    " Just use Ctrl-r%

    " Spellcheck {
        set spellfile=~/.vim/spell/en.utf-8.add
        set dictionary+=/usr/share/dict/words
        " set spelllang=en_us,de_de
        set spelllang=en_us
        map <Leader>cd :set spell!<CR>
        imap <Leader>cd <ESC>:set spell!<CR>a
    " }

    " Insert newline without entering insert mode
    map <Leader>Q O<Esc>
    map <Leader>q o<Esc>

    " easier moving between tabs
    map <Leader>n <esc>:tabprevious<CR>
    map <Leader>m <esc>:tabnext<CR>

    " easier moving between buffers
    map <Leader>w <esc>:bNext<CR>

    " set the executable bit
    map <Leader>y :w!<CR>:!chmod +x "%"<CR>
    imap <Leader>y <ESC>:w!<CR>:!chmod +x "%"<CR>a

    nmap <Leader>d :echo strftime("%Y-%m-%d_%H:%M")<CR>
    " }}}

    " Other mappings {{{
        " Easier horizontal scrolling
        map zl zL
        map zh zH

        " Every unnecessary keystroke that can be saved is good for your health :)
        noremap <c-j> <c-w>j
        noremap <c-k> <c-w>k
        noremap <c-l> <c-w>l
        noremap <c-h> <c-w>h

        " http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
        inoremap <c-u> <c-g>u<c-u>
        inoremap <c-w> <c-g>u<c-w>

        " Shortcuts
        " Change Working Directory to that of the current file
        cmap cwd lcd %:p:h
        cmap cd. lcd %:p:h

        " For when you forget to sudo.. Really Write the file.
        cmap w!! w !sudo tee % >/dev/null

        " I use this so that Ctrl-c also works in the command-line window like Escape.
        " Does not work
        map! <c-c> <ESC>
    " }}}

    " Disabled (mostly because of incompatibilities {{{
        " Easier moving in tabs and windows
        " The lines conflict with the default digraph mapping of <C-K>
        " map <C-J> <C-W>j<C-W>_
        " map <C-K> <C-W>k<C-W>_
        " map <C-L> <C-W>l<C-W>_
        " map <C-H> <C-W>h<C-W>_

        " The following two lines conflict with moving to top and
        " bottom of the screen
        " map <S-H> gT
        " map <S-L> gt

        " Unbind the cursor keys in insert, normal and visual modes.
        " Luckily I do not use them anymore because they are so far away.
        " But there are better ways to send those keycodes.
        " for prefix in ['i', 'n', 'v']
        "     for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        "         exe prefix . "map " . key . " <Nop>"
        "     endfor
        " endfor
        "
        " imap <c-j> <return> " please use Alt-Gr+v (Neo2)
        " map <c-i> :set list!<CR>
        " imap <c-i> <ESC>:set list!<CR>a
    " }}}
" }

" Bundles and plugins {
    " let g:spf13_bundle_groups=['general', 'neocomplcache',
    " 'programming', 'ruby', 'python', 'perl', 'go', 'twig', 'javascript',
    " 'html', 'latex',
    " 'misc', 'scala', 'games']
    let g:spf13_bundle_groups=['general', 'work', 'programming', 'python', 'perl', 'javascript', 'html', 'snipmate']

    " Deps {
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        " if executable('ack-grep')
        "     let g:ackprg="ack-grep -H --nocolor --nogroup --column"
        "     Bundle 'mileszs/ack.vim'
        " elseif executable('ack')
        "     Bundle 'mileszs/ack.vim'
        " elseif executable('ag')
        "     Bundle 'mileszs/ack.vim'
        "     let g:ackprg = 'ag --nogroup --nocolor --column'
        " endif
    " }

    " Work {
        if count(g:spf13_bundle_groups, 'work')
        Bundle 'hamcos/vim-hamcos'
        endif
    " }

    " General {
        if count(g:spf13_bundle_groups, 'general')
            Bundle 'scrooloose/nerdtree'
            map <Leader>v :NERDTreeToggle<CR>

            " Require it here, but configure it later.
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'spf13/vim-colors'
            Bundle 'tpope/vim-surround'
            " Bundle 'spf13/vim-autoclose' " Too simple, no indent stuff
            " let g:AutoPairShortcutToggle = '<Leader>ac'
            " Bundle 'jiangmiao/auto-pairs' " Could not get inserting new closing brackets and jumping to existing brackets at once to work
            " let g:AutoPairsFlyMode = 1
            " nmap <silent> <Leader>ac :call AutoPairsToggle()<CR>
            " imap <silent> <Leader>ac <ESC>:call AutoPairsToggle()<CR>a
            Bundle 'Raimondi/delimitMate'
            let delimitMate_expand_cr = 1


            " CtrlP {
                Bundle 'kien/ctrlp.vim'
                let g:ctrlp_show_hidden = 1
                let g:ctrlp_mruf_save_on_update = 0
                let g:ctrlp_extensions = ['line']
                let g:ctrlp_open_new_file = 'h'
                let g:ctrlp_mruf_max = 2000
                nmap <Leader>r :CtrlPMRUFiles<CR>
            " }

            " Bundle 'vim-scripts/sessionman.vim'
            Bundle 'matchit.zip'
            " Extended matching with "%"

            " vim-bad-whitespace {
            Bundle 'bitc/vim-bad-whitespace'
            nmap <Leader>fc :EraseBadWhitespace<CR>
            " }

            Bundle 'tpope/vim-repeat'

            " Translate {
            if has("python") && executable('python')
                Bundle 'ypid/lookup.vim'
                " let g:lookup_dict_para = []
                nmap <Leader>tr :Lookup<CR>
                vmap <Leader>tr :call LookupVisual()<CR>
                endif
            " }

            if (has("python") && executable('python')) || (has("python3") && executable('python3'))
                Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
            else
                Bundle 'Lokaltog/vim-powerline'
            endif

            " Bundle 'Lokaltog/vim-easymotion'
            " let g:EasyMotion_leader_key = '<Leader>j'
            " Don’t really using it for now.

            " Bundle 'python.vim--Herzog'

            " Replaced by solarized {{{
                " Bundle 'godlygeek/csapprox'
                " Bundle 'jistr/vim-nerdtree-tabs'
                " Bundle 'flazz/vim-colorschemes'
            " }}}

            Bundle 'sjl/gundo.vim'
            nnoremap <Leader>ga :GundoToggle<CR>

            " Bundle 'thanthese/Tortoise-Typing'
            " Bundle 'myusuf3/numbers.vim'

            " indent_guides {
            Bundle 'nathanaelkane/vim-indent-guides'
            if !exists('g:spf13_no_indent_guides_autocolor')
                let g:indent_guides_auto_colors = 1
            else
                " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
                autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
                autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
            endif
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
            " }

            if !exists('g:spf13_no_views')
                Bundle 'vim-scripts/restore_view.vim'
            endif
            " Bundle 'airblade/vim-gitgutter'
            " Show changes in working copy with plus sign, start of the line

            " Bundle 'tpope/vim-abolish.git'
            " Don’t really using it for now.

            Bundle 'tpope/vim-markdown'
        endif
    " }

    " General Programming {
        if count(g:spf13_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            " Bundle 'scrooloose/syntastic' " Too slow
            Bundle 'vivien/vim-addon-linux-coding-style'

            " More text objects {
                " http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
                Bundle 'argtextobj.vim'
                Bundle 'michaeljsmith/vim-indent-object'
            " }

            " Git {{{
                " Fugitive {
                    Bundle 'tpope/vim-fugitive'
                    nnoremap <silent> <leader>gs :Gstatus<CR>
                    nnoremap <silent> <leader>gd :Gdiff<CR>
                    nnoremap <silent> <leader>gc :Gcommit<CR>
                    nnoremap <silent> <leader>gb :Gblame<CR>
                    nnoremap <silent> <leader>gl :Glog<CR>
                    nnoremap <silent> <leader>gp :Git push<CR>
                " }

                Bundle 'int3/vim-extradite'
                let g:extradite_showhash = 1
                command! Gloge Extradite
            " }}}

            Bundle 'powerman/vim-plugin-viewdoc'
            let g:manpageview_options_pl = ";-f;-q;-t;"

            Bundle 'bronson/vim-visual-star-search'

            " Tabularize {
                Bundle 'godlygeek/tabular'
                nmap <Leader>a& :Tabularize /&<CR>
                vmap <Leader>a& :Tabularize /&<CR>
                nmap <Leader>a= :Tabularize /=<CR>
                vmap <Leader>a= :Tabularize /=<CR>
                nmap <Leader>a: :Tabularize /:<CR>
                vmap <Leader>a: :Tabularize /:<CR>
                nmap <Leader>a:t :Tabularize /:\zs<CR>
                vmap <Leader>a:t :Tabularize /:\zs<CR>
                nmap <Leader>a,:Tabularize /,<CR>
                vmap <Leader>a,:Tabularize /,<CR>
                nmap <Leader>a/ :Tabularize /\zs\/\//<CR>
                vmap <Leader>a/ :Tabularize /\/ <CR>
                nmap <Leader>a" :Tabularize /"<CR>
                vmap <Leader>a" :Tabularize /"<CR>
                nmap <Leader>a# :Tabularize /#<CR>
                vmap <Leader>a# :Tabularize /#<CR>
                nmap <Leader>a<Space> :Tabularize /\s\+<CR>
                vmap <Leader>a<Space> :Tabularize /\s\+<CR>
                " http://stackoverflow.com/questions/10287919/use-vims-tabularize-plugin-to-only-match-the-first-occurance-of-a-delimiter
                nmap <Leader>af<Space> :Tabularize /^\s*\w*<CR>
                vmap <Leader>af<Space> :Tabularize /^\s*\w*<CR>
                vmap <Leader>a<Space> :Tabularize /\s\+<CR>
                nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            " }

            " Bundle 'tomtom/tcomment_vim'
            let g:tcommentOptions = {'strip_whitespace': 1}

            Bundle 'scrooloose/nerdcommenter'
            let NERDSpaceDelims = 1

            noremap gcc :call NERDComment('n', 'Toggle')<CR>
            " vnoremap gc gcc

            " Toggle words
            Bundle 'toggle_words.vim'
            nmap <Leader>to :ToggleWord<CR>

            Bundle 'tpope/vim-endwise'

            " DetectIndent {{{
                " Bundle 'ciaranm/detectindent'
                Bundle 'ypid/detectindent'
                let g:detectindent_preferred_expandtab = 1
                let g:detectindent_preferred_indent = 4
                let g:detectindent_min_indent = 2
            " }}}

            " Highlight brackets
            Bundle 'kien/rainbow_parentheses.vim'
            nnoremap <Leader>R :RainbowParenthesesToggle<CR>

            " if executable('ctags')
            "     Bundle 'majutsushi/tagbar'
            " endif

            " Save and run {{{
                Bundle 'xuhdev/SingleCompile'
                let g:SingleCompile_alwayscompile = 0
                call SingleCompile#SetCompilerTemplate('mkd', 'markdown',
                            \ 'text-to-HTML conversion tool', 'markdown',
                            \ '> $(FILE_TITLE)$.html', 'true' )
                call SingleCompile#SetPriority('mkd', 'markdown', 50)

                call SingleCompile#ChooseCompiler('mkd', 'markdown')

                map <Leader>as :SCCompileRun<CR>
                imap <Leader>as <ESC>:SCCompileRun<CR>a
            " }}}

            " " Taglist {
            " Bundle 'taglist.vim'
            " map <Leader>cq :TlistToggle<cr>
            " map <Leader>cr :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
            " let Tlist_WinWidth = 30
            " " }
        endif
    " }

    " General Programming (not often used) {
        if count(g:spf13_bundle_groups, 'programming_not_often_used')

            Bundle 'mattn/webapi-vim'
            Bundle 'mattn/gist-vim'

            Bundle 'inkarkat/SyntaxAttr.vim'
            nmap <Leader>ti :call SyntaxAttr()<CR>

            Bundle 'SrchRplcHiGrp.vim'
        endif
    " }

    " Snippets & AutoComplete {
        if count(g:spf13_bundle_groups, 'snipmate')
            if has("python") && executable('python')
                " Needs to be before syntax on …
                Bundle 'SirVer/ultisnips'
                " let g:UltiSnipsListSnippets = "<Leader><tab>"
                nmap <Leader><tab> :call UltiSnips_ListSnippets()<cr>
            endif
        elseif count(g:spf13_bundle_groups, 'neocomplcache')
            Bundle 'Shougo/neocomplcache'
            Bundle 'Shougo/neosnippet'
            Bundle 'honza/vim-snippets'
           " OmniComplete {
                if has("autocmd") && exists("+omnifunc")
                    autocmd Filetype *if &omnifunc == " |setlocal omnifunc=syntaxcomplete#Complete |endif
                endif

                hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
                hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
                hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

                " Some convenient mappings
                inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
                inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
                inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
                inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
                inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
                inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

                " Automatically open and close the popup menu / preview window
                autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
                set completeopt=menu,preview,longest
            " }

            " neocomplcache {
                let g:acp_enableAtStartup = 0
                let g:neocomplcache_enable_at_startup = 1
                let g:neocomplcache_enable_camel_case_completion = 1
                let g:neocomplcache_enable_smart_case = 1
                let g:neocomplcache_enable_underbar_completion = 1
                let g:neocomplcache_enable_auto_delimiter = 1
                let g:neocomplcache_max_list = 15
                let g:neocomplcache_force_overwrite_completefunc = 1

                " SuperTab like snippets behavior.
                imap <silent><expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-e>" : "\<TAB>")
                smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

                " Define dictionary.
                let g:neocomplcache_dictionary_filetype_lists = { 'default' : '', 'vimshell' : $HOME.'/.vimshell_hist', 'scheme' : $HOME.'/.gosh_completions' }

                " Define keyword.
                if !exists('g:neocomplcache_keyword_patterns')
                    let g:neocomplcache_keyword_patterns = {}
                endif
                let g:neocomplcache_keyword_patterns._ = '\h\w*'

                " Plugin key-mappings.

                " These two lines conflict with the default digraph mapping of <C-K>
                imap <C-l> <Plug>(neosnippet_expand_or_jump)
                smap <C-l> <Plug>(neosnippet_expand_or_jump)

                " inoremap <expr><C-g> neocomplcache#undo_completion()
                " inoremap <expr><C-l> neocomplcache#complete_common_string()
                inoremap <expr><CR> neocomplcache#complete_common_string()

                " <TAB>: completion.
                " inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
                " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

                " <CR>: close popup
                " <s-CR>: close popup and save indent.
                inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
                inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y> neocomplcache#close_popup()

                " Enable omni completion.
                autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
                autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
                autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
                autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
                autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
                autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

                " Enable heavy omni completion.
                if !exists('g:neocomplcache_omni_patterns')
                    let g:neocomplcache_omni_patterns = {}
                endif
                let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
                let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
                let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
                let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
                let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

                " Use honza's snippets.
                let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

                " Enable neosnippet snipmate compatibility mode
                let g:neosnippet#enable_snipmate_compatibility = 1

                " For snippet_complete marker.
                if has('conceal')
                    set conceallevel=2 concealcursor=i
                endif

                " Disable the neosnippet preview candidate window
                " When enabled, there can be too much visual noise
                " especially when splits are used.
                set completeopt-=preview
            " }
        endif
    " }

    " Python {
        if count(g:spf13_bundle_groups, 'python')
            " Pick either python-mode or pyflakes & pydoc
            " Bundle 'klen/python-mode'
            " Bundle 'python.vim'
            " Bundle 'python_match.vim'
            " Bundle 'pythoncomplete'

            " PyMode {
                let g:pymode_lint_checker = "pyflakes"
                let g:pymode_utils_whitespaces = 0
                let g:pymode_options = 0
            " }

            " PythonMode {
            " Disable if python support not present
                if !has('python')
                    let g:pymode = 1
                endif
            " }
        endif
    " }

    " Perl {
        if count(g:spf13_bundle_groups, 'perl')
            Bundle 'perlcritic-compiler-script'
            Bundle 'vim-perl/vim-perl'
            " Bundle 'c9s/perlomni.vim'
        endif
    " }

    " Javascript {
        if count(g:spf13_bundle_groups, 'javascript')
            " Bundle 'leshill/vim-json'
            " Bundle 'groenewege/vim-less'
            " Bundle 'pangloss/vim-javascript'
            " Bundle 'briancollins/vim-jst'
            " Bundle 'kchmck/vim-coffee-script'
        endif
    " }

    " Java {
        if count(g:spf13_bundle_groups, 'scala')
            " Bundle 'derekwyatt/vim-scala'
            " Bundle 'derekwyatt/vim-sbt'
        endif
    " }

    " LaTeX {
        if count(g:spf13_bundle_groups, 'latex')
            " IMPORTANT: grep will sometimes skip displaying the file name if you
            " search in a singe file. This will confuse Latex-Suite. Set your grep
            " program to always generate a file-name.
            set grepprg=grep\ -nH\ $*

            " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
            " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
            " The following changes the default filetype back to 'tex':
            let g:tex_flavor='latex'
            imap <Leader>Y <Plug>IMAP_JumpForward
        endif
    " }

    " HTML {
        if count(g:spf13_bundle_groups, 'html')
            " AutoCloseTag {
            " Bundle 'karuna/HTML-AutoCloseTag'
            " Bundle 'amirh/HTML-AutoCloseTag'
            Bundle 'ypid/HTML-AutoCloseTag'
            let g:closetag_html_style=1
            " Bundle 'closetag.vim'
            " Bundle 'inkarkat/closetag.vim'
            Bundle 'ypid/closetag.vim'

            " Bundle 'sukima/xmledit'
            " Bundle 'closetag.vim'
            " Make it so AutoCloseTag works for xml and xhtml files as well
            " autocmd FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
            " }

            " Bundle 'hail2u/vim-css3-syntax'
            " Bundle 'tpope/vim-haml'
            Bundle 'groenewege/vim-less'
            Bundle 'parkr/vim-jekyll'
            let g:jekyll_post_extension = '.md'
            let g:jekyll_post_template =  [
              \ '---',
              \ 'layout: post',
              \ 'title: JEKYLL_TITLE',
              \ 'description:',
              \ 'tags: [intro, beginner, jekyll, tutorial]',
              \ '---',
              \ '']
              " \ 'date: "JEKYLL_DATE"',

            " Bundle 'greyblake/vim-preview' " configure Browser
        endif
    " }

    " Ruby {
        if count(g:spf13_bundle_groups, 'ruby')
            Bundle 'tpope/vim-rails'
            let g:rubycomplete_buffer_loading = 1
            "let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif
    " }

    " Go Lang {
        if count(g:spf13_bundle_groups, 'go')
            Bundle 'jnwhiteh/vim-golang'
            Bundle 'spf13/vim-gocode'
        endif
    " }

    " Misc {
        if count(g:spf13_bundle_groups, 'misc')
            Bundle 'dahu/LearnVim'
            " Bundle 'spf13/vim-preview'
            " Bundle 'tpope/vim-cucumber'
            " Bundle 'quentindecock/vim-cucumber-align-pipes'
            " Bundle 'Puppet-Syntax-Highlighting'
            " Bundle 'mattn/calendar-vim'
        endif
    " }

    " Games {
        if count(g:spf13_bundle_groups, 'games')
            Bundle 'TeTrIs.vim'
            Bundle 'sokoban.vim'
        endif
    " }

    " Twig {
        if count(g:spf13_bundle_groups, 'twig')
            Bundle 'beyondwords/vim-twig'
        endif
    " }

    " To small for a plugin {
        function! s:ExecuteInShell(command)
            let command = join(map(split(a:command), 'expand(v:val)'))
            let winnr = bufwinnr('^' . command . '$')
            silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
            setlocal buftype=nowrite bufhidden=wipe nobuflisted nowrap number
            echo 'Execute ' . command . '...'
            silent! execute 'silent %!'. command
            silent! execute 'resize ' . line('$')
            silent! redraw
            silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
            silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
            echo 'Shell command ' . command . ' executed.'
        endfunction
        command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

        function! TranslateDateVisual()
            sil! norm! gv"ty
            echo system('date -d @'. @t)
        endfunction

        " Translate the current word (unix time stamp) to a human readable time
        nmap <Leader>td :echo system('date -d @'.expand('<cword>'))<CR>
        vmap <Leader>td :call TranslateDateVisual()<CR>

        function! EnsureDirExists (dir)
            if !isdirectory(a:dir)
                if exists("*mkdir")
                    call mkdir(a:dir,'p')
                    echo "Created directory: " . a:dir
                else
                    echo "Please create directory: " . a:dir
                endif
            endif
        endfunction

        " Marking duplicate lines
        function! HighlightRepeats() range
          let lineCounts = {}
          let lineNum = a:firstline
          while lineNum <= a:lastline
            let lineText = getline(lineNum)
            if lineText != ""
              let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
            endif
            let lineNum = lineNum + 1
          endwhile
          exe 'syn clear Repeat'
          for lineText in keys(lineCounts)
            if lineCounts[lineText] >= 2
              exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
            endif
          endfor
        endfunction

        command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

        " Toggle word highlighting on and off but and don’t get confused if a
        " new search was issued.
        " Does not work. If you fix it please open a pull request :)
        let hlstate=0
        let lastsearchstring = @/
        function! Togglehlsearch()
            if (lastsearchstring == @/)
                nohlsearch
                let lastsearchstring = @/
            else
                set hlsearch
            endif
            let hlstate= &hlstate + 1
            echo "toggled visibility for hlsearch"
        endfunction

        " Toggle highlight search
        " let hlstate=0
        " let lastsearchstring = @/
        " nmap <Leader>b :call Togglehlsearch()<CR>

        " Set tabstop and softtabstop to the value of shiftwidth
        function! SetIndentWidth()
            " let &l:sts = &l:ts
            " let &l:sw  = &l:ts
            let &l:ts  = &l:sw
            let &l:sts = &l:sw
        endfunction

        " Append modeline after last line in buffer.
        " Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
        " files.
        function! AppendModeline()
            let l:modeline = printf("vim: set ts=%d sw=%d tw=%d %set :",
                        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
            call append(line("$"), l:modeline)
            normal '.gcc
            "" Use tcomment to comment the thing out
        endfunction
        nnoremap <silent> <Leader>am :call AppendModeline()<CR>
    " }
" }

" General {
    " set background=light         " Assume a dark background
    filetype indent plugin on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mousehide               " Hide the mouse cursor while typing
    set mouse=a                 " Enable mouse wheel scrolling
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    " set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    " set hidden                          " Allow buffer switching without saving
    set splitbelow                      " Open new splits below (for Gdiff)
    set wildignorecase                  " Comes in very handy when your are used to ZSH.

    " Setting up the directories {
        call EnsureDirExists($HOME . '/.vimswap')
        set directory=~/.vimswap/
        set writebackup
        " call EnsureDirExists($HOME . '/.vimbackup')
        " set backup                  " Backups are nice ...
        " set backupskip=/tmp/*,crypt,sec,mnt
        " set backupdir=~/.vimbackup,/var/tmp,/tmp,.

        call EnsureDirExists($HOME . '/.vimview')
        set viewdir=~/.vimview/

        if has('persistent_undo')
            call EnsureDirExists($HOME . '/.vimundo')
            set undofile
            set undodir=~/.vimundo/
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        let g:skipview_files = [
            \ '*sec*',
            \ '*crypt*'
            \ ]
    " }
" }

" Vim UI {

    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"
        color solarized             " Load a colorscheme
    endif
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter
    highlight ExtraWhitespace ctermbg=red guibg=red

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number
    set winminheight=0              " Windows can be 0 line high
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set foldopen+=search
    set foldmethod=marker
    set nolist
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Formatting {
    set formatoptions+=or
    set wrap linebreak              " Wrap long lines between words</Tab>
    set textwidth=0
    set linebreak
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    " set matchpairs+=<:>             " Match, to be used with %
    " set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars

    if has("autocmd") && !exists("autocommands_loaded")
        filetype on
        " autocmd BufWritePost $MYVIMRC source %
        " autocmd BufWritePost $HOME/.vimpagerrc source %
        autocmd VimLeave * if filereadable($HOME."/.vim/bundle/vundle/.netrwhist")|call delete($HOME."/.vim/bundle/vundle/.netrwhist")|endif

        " Adjust the filetype for some files {{{
            autocmd BufRead,BufNewFile .vimpagerrc setlocal filetype=vim
            autocmd BufRead,BufNewFile /etc/*/apt.conf setlocal filetype=conf
            autocmd BufRead,BufNewFile $HOME/.ssh/*.config setlocal filetype=sshconfig
            autocmd BufRead,BufNewFile $HOME/.unison/* setlocal filetype=conf

            " http://mathias-kettner.de/checkmk_configfiles.html
            autocmd BufRead,BufNewFile *.mk setlocal filetype=python

            " I already use the "wrong" file suffix for all my LaTeX files
            autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
            autocmd BufRead,BufNewFile *.ldf setlocal filetype=tex

            autocmd BufRead,BufNewFile *.nse setlocal filetype=lua
            autocmd BufRead,BufNewFile /usr/share/X11/xkb/* setlocal filetype=xkb
        " }}}

        autocmd BufWritePre /tmp/*  setlocal noundofile
        autocmd BufWritePre *sec*   setlocal noundofile
        autocmd BufWritePre *crypt* setlocal noundofile
        autocmd BufWritePre *mnt*   setlocal noundofile

        " Set language specific stuff {{{
            autocmd FileType perl setlocal expandtab shiftwidth=4
            autocmd FileType perl compiler perlcritic
            autocmd FileType vim setlocal expandtab shiftwidth=4
            autocmd FileType python setlocal shiftwidth=4
            autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
            autocmd FileType python set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
            autocmd FileType python set efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#
            autocmd FileType mkd let b:delimitMate_nesting_quotes = ['`']
            autocmd FileType vim let b:delimitMate_quotes = "' `"
            autocmd FileType tex setlocal expandtab shiftwidth=2
            autocmd FileType c setlocal noexpandtab shiftwidth=4
            autocmd FileType html setlocal expandtab shiftwidth=2
            autocmd FileType html compiler tidy
            autocmd FileType sh setlocal textwidth=0
            " autocmd FileType xml setlocal foldmethod=syntax " does not work
            autocmd FileType xml setlocal foldmethod=indent
        " }}}

        " autocmd VimEnter * RainbowParenthesesToggle " enable by defalut
        " autocmd Syntax * RainbowParenthesesLoadRound " default
        autocmd VimEnter,BufRead,BufNewFile * RainbowParenthesesLoadSquare
        autocmd VimEnter,BufRead,BufNewFile * RainbowParenthesesLoadBraces
        " autocmd BufRead,BufNewFile * call DetectIndentIfNotEmptyBuf()
        autocmd BufRead * DetectIndent
        " autocmd BufWritePost * echo &ff
        autocmd QuickFixCmdPost make cwindow
        " autocmd BufRead,BufNewFile * call SetIndentWidth()
        " autocmd FileType c,cpp,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> EraseBadWhitespace

        " Always switch to the current file directory
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        let autocommands_loaded = 1
    endif
    let xml_syntax_folding=1      " XML
" }

" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 15,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
        if has('gui_macvim')
            set transparency=5      " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
" }

" Machine specific configuration {{{
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
