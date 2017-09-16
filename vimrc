" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:

let g:config_section_enable = []
call add(g:config_section_enable, 'general_config')
call add(g:config_section_enable, 'omnicomplete')
call add(g:config_section_enable, 'ui_config')
call add(g:config_section_enable, 'solarized')
call add(g:config_section_enable, 'formating_config')
call add(g:config_section_enable, 'gui_config')
call add(g:config_section_enable, 'machine_spesific')
let g:spf13_no_views = 1
" For working on Vim configuration.

source ~/.vimrc.min

" Bundles and plugins {{{
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off

        set runtimepath+=~/.vim/bundle/vundle
        call vundle#rc()

        " call vundle#begin()
        " Bundle 'gmarik/vundle'
        "" Not required. Managed via git submodules.
        "" Required for :BundleClean.

        " set runtimepath+=~/.vim/bundle/neobundle.vim
        " call neobundle#begin(expand('~/.vim/bundle/'))
    " }}}

    let g:spf13_bundle_groups = []

    " Default
    " call add(g:spf13_bundle_groups, 'dependencies')
    call add(g:spf13_bundle_groups, 'general_important')
    call add(g:spf13_bundle_groups, 'general')
    call add(g:spf13_bundle_groups, 'ui')
    call add(g:spf13_bundle_groups, 'work')
    call add(g:spf13_bundle_groups, 'programming')
    call add(g:spf13_bundle_groups, 'programming_not_often_used')
    call add(g:spf13_bundle_groups, 'perl')
    call add(g:spf13_bundle_groups, 'snipmate')
    call add(g:spf13_bundle_groups, 'html')
    call add(g:spf13_bundle_groups, 'python')
    call add(g:spf13_bundle_groups, 'haxe')

    call add(g:spf13_bundle_groups, 'misc')
    " call add(g:spf13_bundle_groups, 'games')

    " Not often used, not properly tested.
    call add(g:spf13_bundle_groups, 'testing')
    " call add(g:spf13_bundle_groups, 'tested_not_using')
    " call add(g:spf13_bundle_groups, 'neocomplcache')
    call add(g:spf13_bundle_groups, 'latex')
    call add(g:spf13_bundle_groups, 'javascript')
    " call add(g:spf13_bundle_groups, 'scala')
    " call add(g:spf13_bundle_groups, 'ruby')
    " call add(g:spf13_bundle_groups, 'go')
    call add(g:spf13_bundle_groups, 'c')

    " Deps {{{
        if count(g:spf13_bundle_groups, 'dependencies')
            Bundle 'MarcWeber/vim-addon-mw-utils'
            Bundle 'tomtom/tlib_vim'
        endif
    " }}}

    " Work {{{
        if count(g:spf13_bundle_groups, 'work')
            Bundle 'hamcos/vim-hamcos'
        endif
    " }}}

    " Testing {{{
        if count(g:spf13_bundle_groups, 'testing')
            Bundle 'terryma/vim-multiple-cursors'
            let g:multi_cursor_next_key='<c-e>'
            let g:multi_cursor_prev_key='<C-p>'

            Bundle 't9md/vim-quickhl'
            nmap μ <Plug>(quickhl-manual-this)
            vmap μ <Plug>(quickhl-manual-this)
            " Shift+Layer3Mod+m
            "
            " xmap <Space>M <Plug>(quickhl-manual-reset)
            nmap β :QuickhlManualReset<CR>
            " Shift+Layer3Mod+n

            " nmap μ <Plug>(quickhl-tag-toggle)
            " Shift+Layer3Mod+μ

            " let g:yankring_history_dir = '$HOME/.vimswap'
            " Bundle 'YankRing.vim'
            " Bundle 'maxbrunsfeld/vim-yankstack'

            " Bundle 'wellle/tmux-complete.vim'

            Bundle 'PProvost/vim-ps1'

            " Bundle 'kshenoy/vim-origami'

            " Show diff for before recover
            Bundle 'chrisbra/Recover.vim'

            Bundle 'TTCoach'

            Bundle 'rm-hull/vim-locate'

            Bundle 'chase/vim-ansible-yaml'
            " Bundle 'pearofducks/ansible-vim'

            " Bundle 'Glench/Vim-Jinja2-Syntax'
            "
            " Supports MatchIt and Endwise.
            Bundle 'chase/Vim-Jinja2-Syntax'

            " You simply select the region, call :NR and the selected part
            " will open in a new split window while the rest of the buffer
            " will be protected.
            " Bundle 'chrisbra/NrrwRgn'

            " Already included in recent Vim versions.
            " Bundle 'elzr/vim-json'

            Bundle 'anwolib'
        endif

        if count(g:spf13_bundle_groups, 'tested_not_using')
            " I don‘t really like this behavior
            Bundle 'terryma/vim-smooth-scroll'
            noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
            noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
            noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>
            noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>
        endif
    " }}}

    " General important {{{
    " Used multiple times *every* Vim session.
        if count(g:spf13_bundle_groups, 'general_important')
            " CtrlP {{{
                " Bundle 'wincent/Command-T'
                Bundle 'kien/ctrlp.vim'
                let g:ctrlp_show_hidden = 1
                let g:ctrlp_mruf_save_on_update = 0
                let g:ctrlp_extensions = ['line']
                let g:ctrlp_open_new_file = 'h'
                let g:ctrlp_mruf_max = 2000
                let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*\|vimrc*'
                " Use <Leader>ff to open the vimrc …
                noremap <Leader>r :CtrlPMRUFiles<CR>
            " }}}

            " Handling comments {{{
                " Bundle 'tomtom/tcomment_vim'
                " let g:tcommentOptions = {'strip_whitespace': 1}

                Bundle 'scrooloose/nerdcommenter'
                let NERDSpaceDelims = 1

                let g:NERDCustomDelimiters = {
                    \ 'sshdconfig' : { 'left' : '#' },
                    \ 'dnsmasq'    : { 'left' : '#' },
                \ }

                " noremap gcc :call NERDComment('n', 'Toggle')<CR>
                " noremap <Leader>d :call NERDComment('n', 'Toggle')<CR>

                " noremap <Bar> :call NERDComment("n", "AlignLeft")<cr>
                " Use <Leader>cb for this.
                noremap <Bar> :call NERDComment('n', 'Toggle')<cr>
            " }}}

        endif
    " }}}

    " General {{{
        if count(g:spf13_bundle_groups, 'general')
            " Bundle 'scrooloose/nerdtree'
            " noremap <Leader>v :NERDTreeToggle<CR>

            " Auto close opening characters like '(' with ')' {{{
                " Bundle 'spf13/vim-autoclose' " Too simple, no indent stuff
                " let g:AutoPairShortcutToggle = '<Leader>ac'
                " Bundle 'jiangmiao/auto-pairs' " Could not get inserting new closing brackets and jumping to existing brackets at once to work
                " let g:AutoPairsFlyMode = 1
                " noremap <silent> <Leader>ac :call AutoPairsToggle()<CR>
                " inoremap <silent> <Leader>ac <ESC>:call AutoPairsToggle()<CR>a
                Bundle 'Raimondi/delimitMate'
                let delimitMate_expand_cr = 1
            " }}}

            " Bundle 'vim-scripts/sessionman.vim'
            Bundle 'matchit.zip'
            " Extended matching with "%"

            " vim-bad-whitespace {{{
                Bundle 'bitc/vim-bad-whitespace'
                noremap <Leader>fc :EraseBadWhitespace<CR>
            " }}}

            Bundle 'tpope/vim-repeat'

            Bundle 'tpope/vim-characterize'

            let g:indent_guides_auto_colors = 1
            Bundle 'tpope/vim-speeddating'
            " Refer to .vimrc.min for details.
            nmap  <C-S>     <Plug>SpeedDatingUp
            nmap  <C-X>     <Plug>SpeedDatingDown
            xmap  <C-S>     <Plug>SpeedDatingUp
            xmap  <C-X>     <Plug>SpeedDatingDown
            nmap d<C-S>     <Plug>SpeedDatingNowUTC
            nmap d<C-X>     <Plug>SpeedDatingNowLocal

            " Bundle 'tpope/vim-abolish'

            " Translate {{{
                if has("python") && executable('python')
                    Bundle 'ypid/lookup.vim'
                    " let g:lookup_dict_para = []
                    let g:lookup_databases = [ 'jargon', 'vera', 'english-german', 'german-english', 'elements', 'gcide' ]
                    " noremap <Leader>tr :Lookup<CR>
                    " vmap <Leader>tr :call LookupVisual()<CR>
                    noremap α :Lookup<CR>
                    vmap α :call LookupVisual()<CR>
                    " Shift+Layer3Mod+d
                    " This is a workaround: See Shift+Layer3Mod+s in
                    " .vimrc.min
                endif
            " }}}

            " Bundle 'Lokaltog/vim-easymotion'
            " let g:EasyMotion_leader_key = '<Leader>j'
            " Don’t really using it for now.

            Bundle 'sjl/gundo.vim'
            " nnoremap <Leader>ga :GundoToggle<CR>
            nnoremap ψ :GundoToggle<CR>
            " Shift+Layer3Mod+u

            " indent_guides {{{
                " Bundle 'Yggdroot/indentLine'
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
                " let g:indent_guides_guide_size = 2
                let g:indent_guides_enable_on_vim_startup = 1
                let g:indent_guides_soft_pattern = ' '

                noremap <silent> γ :IndentGuidesToggle<CR>
                " Shift+Layer3Mod+i
            " }}}

            if !exists('g:spf13_no_views')
                Bundle 'vim-scripts/restore_view.vim'
            endif

            let g:markdown_folding = 1
            let g:markdown_fenced_languages = ['html', 'javascript', 'python', 'bash=sh']
            " Bundle 'tpope/vim-markdown'
            " Bundle 'plasticboy/vim-markdown'
            " Bundle 'jtratner/vim-flavored-markdown'

            if executable('task')
                Bundle 'blindFS/vim-taskwarrior'
            endif

            Bundle 'Rykka/riv.vim'
            " Bundle 'Rykka/InstantRst'
            noremap <Leader>Q :RivTitle1<CR>'.
            inoremap <Leader>Q <ESC>:RivTitle1<CR>o
            noremap <Leader>q :RivTitle2<CR>'.
            inoremap <Leader>q <ESC>:RivTitle2<CR>o
            noremap <Leader>w :RivTitle3<CR>'.
            inoremap <Leader>w <ESC>:RivTitle3<CR>o

            " Bundle 'bronson/vim-visual-star-search'
            Bundle 'thinca/vim-visualstar'

            let g:move_map_keys = 0
            Bundle 'matze/vim-move'
            vmap ρ <Plug>MoveBlockUp
            nmap ρ <Plug>MoveLineUp
            " Shift+Layer3Mod+k

            vmap ν <Plug>MoveBlockDown
            nmap ν <Plug>MoveLineDown
            " Shift+Layer3Mod+j
        endif
    " }}}

    " UI enhancements {{{
        if count(g:spf13_bundle_groups, 'ui')
            " Powerline {{{
                " if (has("python") && executable('python')) || (has("python3") && executable('python3'))
                    " Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
                " else
                    " Bundle 'Lokaltog/vim-powerline'
                " endif
                Bundle 'vim-airline/vim-airline'
                " So much faster than Powerline …
                " let g:airline#extensions#tabline#enabled = 1
                " function! AccentDemo()
                    " let keys = ['a','b','c','d','e','f','g','h']
                    " for k in keys
                        " call airline#parts#define_text(k, k)
                    " endfor
                    " call airline#parts#define_accent('a', 'red')
                    " call airline#parts#define_accent('b', 'green')
                    " call airline#parts#define_accent('c', 'blue')
                    " call airline#parts#define_accent('d', 'yellow')
                    " call airline#parts#define_accent('e', 'orange')
                    " call airline#parts#define_accent('f', 'purple')
                    " call airline#parts#define_accent('g', 'bold')
                    " call airline#parts#define_accent('h', 'italic')
                    " let g:airline_section_a = airline#section#create(keys)
                " endfunction
                " autocmd VimEnter * call AccentDemo()
                " let g:airline_section_x = ['tagbar', 'filetype']
                let g:airline#extensions#default#layout = [
                            \ [ 'a', 'b', 'c', 'x' ],
                            \ [ 'y', 'z', 'warning' ]
                            \ ]
            " }}}
        endif
    " }}}

    " General Programming {{{
        if count(g:spf13_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            Bundle 'scrooloose/syntastic'
            " Bundle 'pydave/AsyncCommand'
            " Bundle 'stgpetrovic/syntastic-async'
            highlight SyntasticErrorSign guifg=red guibg=red
            let g:syntastic_mode_map = { 'mode': 'active',
                                       \ 'active_filetypes': [],
                                       \ 'passive_filetypes': ['perl'] }
            let g:syntastic_ignore_files = ['\m^/etc/']
            let g:syntastic_check_on_wq = 0
            " Too slow for some big files. I am looking at you opening_hours.js :-( ;-)
            "
            let g:syntastic_tex_checkers = ['chktex']
            " let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'python']
            " let g:syntastic_python_checkers = ['flake8', 'python', 'pylint']
            let g:syntastic_python_checkers = ['flake8', 'python']
            let g:syntastic_cpp_checkers = ['gcc', 'cppclean']
            let g:syntastic_yaml_checkers = ['yamllint']
            " let g:syntastic_yaml_yamllint_args = '-c ' . shellescape($HOME . '/.yamllint')
            "
            " Bundle 'Valloric/YouCompleteMe'
            " Much dependencies
            " Bundle 'vivien/vim-addon-linux-coding-style'
            Bundle 'tpope/vim-surround'

            Bundle 'bats.vim'

            " Bundle 'lfilho/cosco.vim'
            " noremap <silent> <Leader>, :call cosco#commaOrSemiColon()<CR>
            " inoremap <silent> <Leader>, <c-o>:call cosco#commaOrSemiColon()<CR>
            "" I pressed ,, too often accidentally.

            " Bundle 'oinksoft/endline.vim'
            " let g:EndlineInsertMapping = '<Leader>,'

            " More text objects {{{
                " http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
                Bundle 'michaeljsmith/vim-indent-object'

                " Bundle 'wellle/targets.vim'

                " Text object for [a]rgument in function. E.g. def " test(test='def', 24)
                " Bundle 'argtextobj.vim'
                Bundle 'b4winckler/vim-angry'

                " Bundle 'terryma/vim-expand-region'
                " Not using currently, map again when the need arises. I need
                " those rare key combinations :)
                " map ν <Plug>(expand_region_expand)
                " Shift+Layer3Mod+j
                " map ρ <Plug>(expand_region_shrink)
                " Shift+Layer3Mod+k

                " http://stackoverflow.com/a/6589216
                nnoremap di\| T\|d,
                nnoremap da\| F\|d,
                nnoremap ci\| T\|c,
                nnoremap ca\| F\|c,
                nnoremap yi\| T\|y,
                nnoremap ya\| F\|y,
                nnoremap vi\| T\|v,
                nnoremap va\| F\|v,
            " }}}

            " Git {{{
                " Fugitive {{{
                    Bundle 'tpope/vim-fugitive'
                    nnoremap <silent> <leader>gs :Gstatus<CR>
                    nnoremap <silent> <leader>gd :Gdiff<CR>
                    nnoremap <silent> <leader>gc :Gcommit<CR>
                    nnoremap <silent> <leader>gb :Gblame<CR>
                    nnoremap <silent> <leader>gl :Glog<CR>
                    nnoremap <silent> <leader>gp :Git push<CR>
                " }}}

                " Bundle 'int3/vim-extradite'
                " let g:extradite_showhash = 1
                " command! Gloge Extradite

                " Bundle 'airblade/vim-gitgutter'
                " Show changes in working copy with plus sign, start of the line
            " }}}

            Bundle 'powerman/vim-plugin-viewdoc'
            let g:manpageview_options_pl = ";-f;-q;-t;"
            let g:viewdoc_openempty = 1
            let g:viewdoc_copy_to_search_reg = 1
            let g:viewdoc_prevtabonclose = 1

            Bundle 'KabbAmine/zeavim.vim'

            " Tabularize {{{
                Bundle 'godlygeek/tabular'
                noremap <Leader>a)  :Tabularize /)/l0<CR>
                noremap <Leader>a&  :Tabularize /&<CR>
                noremap <Leader>a=  :Tabularize /[/*+-?]\?=[>]\?<CR>
                noremap <Leader>a-  :Tabularize /-\w*<CR>
                noremap <Leader>a:  :Tabularize /: /<CR>
                noremap <Leader>az: :Tabularize /:\zs /l0<CR>
                noremap <Leader>a;  :Tabularize /;/l0r1<CR>
                noremap <Leader>a,  :Tabularize /,/l0r1<CR>
                " noremap <Leader>a,  :Tabularize /,\zs/l0c1<CR>
                noremap <Leader>a/  :Tabularize /\zs\(\/\/\\|\/\*\)/<CR>
                noremap <Leader>a"  :Tabularize /"<CR>
                noremap <Leader>a'  :Tabularize /:\zs \+'/l0r0<CR>
                noremap <Leader>a#  :Tabularize /#<CR>
                noremap <Leader>a<Space> :Tabularize /\s\+\zs/<CR>
                " http://stackoverflow.com/questions/10287919/use-vims-tabularize-plugin-to-only-match-the-first-occurance-of-a-delimiter
                noremap <Leader>af<Space> :Tabularize /^\s*\w*<CR>
                noremap <Leader>a<Bar> :Tabularize /[^\\]\zs<Bar><CR>
                " noremap <Leader>ae :Tabularize /\s\{2,\}\zs<CR>
            " }}}

            " Toggle words
            Bundle 'toggle_words.vim'
            noremap δ :ToggleWord<CR>
            " Mod4 + ö

            Bundle 'tpope/vim-endwise'

            " DetectIndent {{{
                Bundle 'ciaranm/detectindent'
                " Bundle 'ypid/detectindent'
                " let g:detectindent_preferred_expandtab = 1
                let g:detectindent_preferred_indent    = 4
                let g:detectindent_min_indent          = 2
            " }}}

            " Ack {{{
                if executable('ag')
                    let g:ackprg = 'ag --vimgrep'
                    " let g:ackprg = 'ag --nogroup --nocolor --column'
                    " Bundle 'mileszs/ack.vim'
                    Bundle 'rking/ag.vim'
                elseif executable('ack-grep')
                    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
                    Bundle 'mileszs/ack.vim'
                elseif executable('ack')
                    Bundle 'mileszs/ack.vim'
                endif
            " }}}

            " Bundle 'whatyouhide/vim-lengthmatters'
            let g:lengthmatters_on_by_default = 0

            Bundle 'derekwyatt/vim-fswitch'
            nnoremap <Leader>h :FSSplitBelow<cr>

            " Highlight brackets
            Bundle 'kien/rainbow_parentheses.vim'
            nnoremap <Leader>R :RainbowParenthesesToggle<CR>

            if executable('ctags')
                Bundle 'majutsushi/tagbar'
                nnoremap <Leader>ft :TagbarToggle<cr>

                " Bundle 'craigemery/vim-autotag'
                " Did not work. Using manual autocmd.

                " " vim-easytags depends on vim-misc.
                " Bundle 'xolox/vim-misc'
                " Bundle 'xolox/vim-easytags'
                " let g:easytags_async = 1
                " " let g:easytags_file = '~/.vim/tags'
                " " let g:easytags_file = './tags'
                " let g:easytags_dynamic_files = 1
            endif

            " Needs to be set before other stuff in the .vimrc to work
            " correctly.
            " https://stackoverflow.com/questions/413015/a-problem-with-folding-bash-functions-in-vim/38934275#38934275
            autocmd FileType sh let g:sh_fold_enabled=5
            autocmd FileType sh let g:is_bash=1
            autocmd FileType sh set foldmethod=syntax

            " Save and run {{{
            " Not needed currently.
                " Bundle 'xuhdev/SingleCompile'
                " let g:SingleCompile_alwayscompile = 0
                " call SingleCompile#SetCompilerTemplate('mkd', 'markdown',
                "             \ 'text-to-HTML conversion tool', 'markdown',
                "             \ '> $(FILE_TITLE)$.html', 'true' )
                " call SingleCompile#SetPriority('mkd', 'markdown', 50)

                " call SingleCompile#ChooseCompiler('mkd', 'markdown')

                " noremap <Leader>as :SCCompileRun<CR>
                " inoremap <Leader>as <c-o>:SCCompileRun<CR>
            " }}}

            " " Taglist {{{
            " Bundle 'taglist.vim'
            " noremap <Leader>cq :TlistToggle<cr>
            noremap <Leader>cr :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
            " let Tlist_WinWidth = 30
            " " }}}
        endif
    " }}}

    " General Programming (not often used) {{{
        if count(g:spf13_bundle_groups, 'programming_not_often_used')

            " Bundle 'mattn/webapi-vim'
            " Bundle 'mattn/gist-vim'

            Bundle 'inkarkat/SyntaxAttr.vim'
            noremap <Leader>ti :call SyntaxAttr()<CR>

            Bundle 'SrchRplcHiGrp.vim'
        endif
    " }}}

    " Snippets & AutoComplete {{{
        if count(g:spf13_bundle_groups, 'snipmate')
            if has("python") && executable('python')
                " Needs to be before syntax on …
                Bundle 'SirVer/ultisnips'
                Bundle 'honza/vim-snippets'
                " let g:UltiSnipsListSnippets = "<Leader><tab>"
                noremap <Leader><tab> :call UltiSnips#ListSnippets()<cr>
            endif
        endif
        Bundle 'neocomplete.vim'
        if count(g:spf13_bundle_groups, 'neocomplcache')

            " neocomplcache {{{
                let g:acp_enableAtStartup = 0
                let g:neocomplcache_enable_at_startup = 1
                let g:neocomplcache_enable_camel_case_completion = 1
                let g:neocomplcache_enable_smart_case = 1
                let g:neocomplcache_enable_underbar_completion = 1
                let g:neocomplcache_enable_auto_delimiter = 1
                let g:neocomplcache_max_list = 15
                let g:neocomplcache_force_overwrite_completefunc = 1

                " SuperTab like snippets behavior.
                imap <silent><expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<c-e>" : "\<TAB>")
                smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

                " Define dictionary.
                let g:neocomplcache_dictionary_filetype_lists = { 'default' : '', 'vimshell' : $HOME.'/.vimshell_hist', 'scheme' : $HOME.'/.gosh_completions' }

                " Define keyword.
                if !exists('g:neocomplcache_keyword_patterns')
                    let g:neocomplcache_keyword_patterns = {}
                endif
                let g:neocomplcache_keyword_patterns._ = '\h\w*'

                " Plugin key-mappings.

                " These two lines conflict with the default digraph mapping of <c-K>
                imap <c-l> <Plug>(neosnippet_expand_or_jump)
                smap <c-l> <Plug>(neosnippet_expand_or_jump)

                " inoremap <expr><c-g> neocomplcache#undo_completion()
                " inoremap <expr><c-l> neocomplcache#complete_common_string()
                inoremap <expr><CR> neocomplcache#complete_common_string()

                " <TAB>: completion.
                " inoremap <expr><TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
                " inoremap <expr><S-TAB> pumvisible() ? "\<c-p>" : "\<TAB>"

                " <CR>: close popup
                " <s-CR>: close popup and save indent.
                inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
                inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

                " <c-h>, <BS>: close popup and delete backword char.
                inoremap <expr><BS> neocomplcache#smart_close_popup()."\<c-h>"
                inoremap <expr><c-y> neocomplcache#close_popup()

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
            " }}}
        endif
    " }}}

    " Python {{{
        if count(g:spf13_bundle_groups, 'python')
            if has('python')
                " Bundle 'klen/python-mode'
            endif

            " Pick either python-mode or pyflakes & pydoc
            " let g:pymode_lint_write = 0
            let g:pymode_options_max_line_length = 100
            let g:pymode_folding = 1

            let g:pymode_doc = 0
            " I use powerman/vim-plugin-viewdoc for that kind of thing.

            " let g:pymode_syntax = 0
            let g:pymode_run_bind = '<leader>aa'
            let g:pymode_breakpoint_bind = '<leader>ö'

            let g:pymode_lint_ignore="E302"
            " E302: I use sometimes folds to group a few functions together.
            " let g:pymode_folding = 0

            let g:pymode_lint_checker = "pyflakes"
            let g:pymode_options = 0

            " Bundle 'python.vim'
            " Bundle 'python_match.vim'
            " Bundle 'pythoncomplete'

        endif
    " }}}

    " Haxe {{{
        if count(g:spf13_bundle_groups, 'haxe')
            Bundle 'vaxe'
        endif
    " }}}

    " C and C++ {{{
        if count(g:spf13_bundle_groups, 'c')
            Bundle 'artoj/qmake-syntax-vim'
        endif
    " }}}

    " Perl {{{
        if count(g:spf13_bundle_groups, 'perl')
            Bundle 'perlcritic-compiler-script'
            Bundle 'vim-perl/vim-perl'
            " Bundle 'c9s/perlomni.vim'
        endif
    " }}}

    " Javascript {{{
        if count(g:spf13_bundle_groups, 'javascript')
            Bundle 'Shutnik/jshint2.vim'
            " Bundle 'leshill/vim-json'
            " Bundle 'groenewege/vim-less'
            " Bundle 'pangloss/vim-javascript'
            " Bundle 'briancollins/vim-jst'
            " Bundle 'kchmck/vim-coffee-script'
        endif
    " }}}

    " Java {{{
        if count(g:spf13_bundle_groups, 'scala')
            " Bundle 'derekwyatt/vim-scala'
            " Bundle 'derekwyatt/vim-sbt'
        endif
    " }}}

    " LaTeX {{{
        if count(g:spf13_bundle_groups, 'latex')
            " IMPORTANT: grep will sometimes skip displaying the file name if you
            " search in a singe file. This will confuse Latex-Suite. Set your grep
            " program to always generate a file-name.
            set grepprg=grep\ -nH\ $*

            " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
            " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
            " The following changes the default filetype back to 'tex':
            let g:tex_flavor='latex'
            imap <Leader>Y <Plug>inoremap_JumpForward
            inoremap <Leader>C <ESC>:LatexTOC<cr>
            noremap <Leader>C :LatexTOC<cr>

            Bundle 'LaTeX-Box-Team/LaTeX-Box'
            Bundle 'gi1242/vim-tex-autoclose'
        endif
    " }}}

    " HTML {{{
        if count(g:spf13_bundle_groups, 'html')
            " AutoCloseTag {{{
                " Automatically closes HTML tag once you finish typing it with >.
                " Bundle 'karuna/HTML-AutoCloseTag'
                " Bundle 'amirh/HTML-AutoCloseTag'
                Bundle 'ypid/HTML-AutoCloseTag'
                let g:closetag_html_style=1

                " Bundle 'closetag.vim'
                " Bundle 'inkarkat/closetag.vim'
                Bundle 'ypid/closetag.vim'
                " Default mapping: inoremap <expr> <Leader>ae <SID>GetCloseTag('i')
            " }}}

            " Bundle 'sukima/xmledit'
            let xml_syntax_folding=1

            " Bundle 'hail2u/vim-css3-syntax'
            " Bundle 'tpope/vim-haml'
            "
            " Not needed anymore. Included in Vim.
            " https://github.com/groenewege/vim-less/issues/51
            " Bundle 'groenewege/vim-less'

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

            Bundle 'guns/xterm-color-table.vim'
        endif
    " }}}

    " Ruby {{{
        if count(g:spf13_bundle_groups, 'ruby')
            Bundle 'tpope/vim-rails'
            let g:rubycomplete_buffer_loading = 1
            "let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif
    " }}}

    " Go Lang {{{
        if count(g:spf13_bundle_groups, 'go')
            Bundle 'jnwhiteh/vim-golang'
            Bundle 'spf13/vim-gocode'
        endif
    " }}}

    " Misc {{{
        if count(g:spf13_bundle_groups, 'misc')
            Bundle 'thanthese/Tortoise-Typing'
            Bundle 'dahu/LearnVim'
            " Bundle 'spf13/vim-preview'
            " Bundle 'tpope/vim-cucumber'
            " Bundle 'quentindecock/vim-cucumber-align-pipes'
            " Bundle 'Puppet-Syntax-Highlighting'
            " Bundle 'mattn/calendar-vim'
            Bundle 'logstash.vim'
        endif
    " }}}

    " Games {{{
        if count(g:spf13_bundle_groups, 'games')
            Bundle 'TeTrIs.vim'
            Bundle 'sokoban.vim'
            Bundle 'koron/nyancat-vim'
        endif
    " }}}

    " Twig {{{
        if count(g:spf13_bundle_groups, 'twig')
            Bundle 'beyondwords/vim-twig'
        endif
    " }}}

    " Too small for a plugin {{{
        " http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
        function! s:ExecuteInShell(command)
            let command = join(noremap(split(a:command), 'expand(v:val)'))
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

        " Marking duplicate lines
        " https://stackoverflow.com/questions/1268032/marking-duplicate-lines
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

        " Set tabstop and softtabstop to the value of shiftwidth
        function! SetIndentWidth()
            " let &l:sts = &l:ts
            " let &l:sw  = &l:ts
            let &l:ts  = &l:sw
            let &l:sts = &l:sw
        endfunction

        " Creating parent directories on save
        " https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save/4294176#4294176
        function s:MkNonExDir(file, buf)
            if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
                let dir=fnamemodify(a:file, ':h')
                if !isdirectory(dir)
                    call mkdir(dir, 'p')
                endif
            endif
        endfunction
        " Created to many directories for moved parent directories when using
        " Ctrl-P history.
        " augroup BWCCreateDir
        "     autocmd!
        "     autocmd BufEnter * call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
        " augroup END

        " Trim blank lines at the end of files on save if there is only
        " one empty line at the end.
        " Add multiple empty lines to avoid them getting trimmed.
        " Ref: https://github.com/drybjed/dotfiles/pull/2#issuecomment-231701424
        " Setting for @drybjed ;)
        " https://stackoverflow.com/questions/7495932/how-can-i-trim-blank-lines-at-the-end-of-file-in-vim
        " Unsure if :0;/^\%(\_s*\S\)\@!/,$d
        " could also achieve this.
        function! TrimTrailingEmptyLines()
            KeepView silent! %s#\([^\s]\)\($\n\s*\)\{1\}\%$#\1#
        endfunction

    " }}}

    " call neobundle#end()
" }}}

" General {{{
    if count(g:config_section_enable, 'general_config')
        filetype indent plugin on   " Automatically detect file types.
        syntax on                   " Syntax highlighting
        syntax spell toplevel
    endif
" }}}

" Vim UI {{{
    if count(g:config_section_enable, 'solarized')
        Bundle 'altercation/vim-colors-solarized'
        if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
            let g:solarized_termcolors=256
            let g:solarized_termtrans=3
            " let g:solarized_contrast="high"
            " let g:solarized_visibility="high"
            color solarized             " Load a colorscheme
        endif
    else
        " Bundle 'flazz/vim-colorschemes'
        " Bundle 'nanotech/jellybeans.vim'
        " Bundle 'spf13/vim-colors'
        set background=light
    endif

    if count(g:config_section_enable, 'ui_config')
        set tabpagemax=15               " Only show 15 tabs
        set showmode                    " Display the current mode
        set showcmd                     " Display the good stuff ;) Like how many characters have been selected.
        set cursorline                  " Highlight current line

        highlight clear SignColumn      " SignColumn should match background for
                                        " things like vim-gitgutter
        highlight ExtraWhitespace ctermbg=red guibg=red

        if has('statusline')
            set laststatus=2
        endif

    endif
" }}}

   " OmniComplete {{{
        if count(g:config_section_enable, 'omnicomplete')
            if has("autocmd") && exists("+omnifunc")
                autocmd Filetype *if &omnifunc == " |setlocal omnifunc=syntaxcomplete#Complete |endif
            endif

            hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
            hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
            hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

            " Some convenient mappings
            " inoremap <expr> <Esc>      pumvisible() ? "\<c-e>" : "\<Esc>"
            " inoremap <expr> <CR>       pumvisible() ? "\<c-y>" : "\<CR>"
            " inoremap <expr> <Down>     pumvisible() ? "\<c-n>" : "\<Down>"
            " inoremap <expr> <Up>       pumvisible() ? "\<c-p>" : "\<Up>"
            " inoremap <expr> <c-d>      pumvisible() ? "\<PageDown>\<c-p>\<c-n>" : "\<c-d>"
            " inoremap <expr> <c-u>      pumvisible() ? "\<PageUp>\<c-p>\<c-n>" : "\<c-u>"

            " Automatically open and close the popup menu / preview window
            set completeopt=menu,preview,longest
        endif
    " }}}

" Formatting {{{
    if count(g:config_section_enable, 'formating_config')
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

        let g:netrw_dirhistmax = 0

        if has("autocmd") && !exists("autocommands_loaded")
            filetype on
            " autocmd BufWritePost $MYVIMRC source %
            " autocmd BufWritePost $HOME/.vimpagerrc source %
            autocmd VimLeave * if filereadable($HOME."/.vim/bundle/vundle/.netrwhist")|call delete($HOME."/.vim/bundle/vundle/.netrwhist")|endif
            autocmd VimLeave * if filereadable($HOME."/.vim/.netrwhist")|call delete($HOME."/.vim/.netrwhist")|endif

            autocmd BufRead,BufNewFile * set expandtab

            " Adjust settings for files {{{
                autocmd BufRead,BufNewFile yamllint setlocal filetype=yaml
                autocmd BufRead,BufNewFile .mrconfig* setlocal filetype=sh
                autocmd BufRead,BufNewFile $HOME/.config/mr/* setlocal filetype=sh
                autocmd BufRead,BufNewFile .vimpagerrc setlocal filetype=vim
                autocmd BufRead,BufNewFile /etc/*/apt.conf setlocal filetype=conf
                autocmd BufRead,BufNewFile /etc/hosts setlocal filetype=conf
                autocmd BufRead,BufNewFile /etc/NetworkManager/NetworkManager.conf setlocal filetype=conf
                autocmd BufRead,BufNewFile /usr/share/X11/xkb/* setlocal filetype=xkb
                autocmd BufRead,BufNewFile $HOME/.ssh/*config* setlocal filetype=sshconfig
                autocmd BufRead,BufNewFile $HOME/.unison/* setlocal filetype=conf

                " http://mathias-kettner.de/checkmk_configfiles.html
                autocmd BufRead,BufNewFile *.mk setlocal filetype=python|let g:pymode_options_max_line_length = 150|let g:pymode_lint = 0

                " I already use the "wrong" file suffix for all my LaTeX files
                " autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
                autocmd BufRead,BufNewFile *.ldf setlocal filetype=tex
                autocmd BufRead,BufNewFile *.lco setlocal filetype=tex

                " autocmd BufRead,BufNewFile source.list.* setlocal filetype=debsources
                autocmd BufRead,BufNewFile .gitignore setlocal filetype=conf
                autocmd BufRead,BufNewFile *gitconfig setlocal filetype=gitconfig

                autocmd BufRead,BufNewFile *mrconfig* setlocal filetype=dosini

                autocmd BufRead,BufNewFile *.nse setlocal filetype=lua

                autocmd BufRead,BufNewFile *firejail/** HideBadWhitespace
                autocmd BufRead,BufNewFile *firejail/**.inc setlocal filetype=conf
                autocmd BufRead,BufNewFile *yohours/** HideBadWhitespace
                autocmd BufRead,BufNewFile *OpeningHoursParser.java/** HideBadWhitespace

                " autocmd BufRead,BufNewFile *debops** HideBadWhitespace

                "" Read https://github.com/subuser-security/subuser/blob/master/CONTRIBUTING.rst#coding-guidelines
                autocmd BufRead,BufNewFile *subuser/** HideBadWhitespace
                autocmd BufRead,BufNewFile *subuser/** let g:pymode_trim_whitespaces = 0
                autocmd BufRead,BufNewFile *subuser/** let b:syntastic_mode = 'passive'
                autocmd BufRead,BufNewFile *subuser/** let g:pymode_lint = 0

                autocmd BufRead,BufNewFile *.sandboxes/** let b:syntastic_mode = 'passive'

                autocmd BufRead,BufNewFile **rsnapshot.conf* set noexpandtab

                autocmd BufRead,BufNewFile *ansible/**/ if &filetype=='yaml'|set filetype=ansible|endif
                autocmd BufRead,BufNewFile *ansible/inventory/**/ set filetype=ansible
                autocmd BufRead,BufNewFile */default/main.yml set foldlevel=1

                " autocmd BufRead,BufNewFile *.yml set filetype=ansible

                " Too slow.
                " autocmd BufRead,BufNewFile **includes/*.rst set filetype=txt

                " yaml seems to be more slow than ansible filetype?
                " autocmd BufRead,BufNewFile *ansible/*vars/* set filetype=yaml

                " autocmd BufRead,BufNewFile *ansible/**/ if &filetype==''|set filetype=yaml|endif

                autocmd BufRead,BufNewFile **ansigenome.conf set filetype=yaml
            " }}}

            autocmd BufWritePre /tmp/*  setlocal noundofile
            autocmd BufWritePre *sec*   setlocal noundofile
            autocmd BufWritePre *crypt* setlocal noundofile
            autocmd BufWritePre *mnt*   setlocal noundofile

            autocmd BufWritePre *.rst,*.yml call TrimTrailingEmptyLines()

            " Setting for @drybjed ;)
            " autocmd BufReadPost *.rst setlocal spell

            autocmd BufRead,BufNewFile /etc/* if &filetype=='python'|let g:pymode_lint = 0|endif
            autocmd BufRead,BufNewFile /etc/* if &filetype=='python'|let g:pymode_rope = 0|endif

            " That thing just does not let itself unload!!
            " autocmd BufRead,BufNewFile /**/debops/docs/** if &filetype=='python'|let g:pymode = 0|endif


            " Automatically set executable bit for scripts
            " https://www.reddit.com/r/linux/comments/e649x/
            function! ChmodScripts()
                if getline(1) =~ "^#!"
                    if getline(1) =~ "/bin/"
                        silent !chmod +x <afile>
                    endif
                endif
            endf
            " autocmd BufWritePost * call ChmodScripts()

            " Set language specific stuff {{{
                autocmd FileType Makefile setlocal noexpandtab ts=4
                autocmd FileType vim setlocal expandtab shiftwidth=4
                autocmd FileType vim let b:delimitMate_quotes = "' `"
                autocmd FileType sh setlocal textwidth=0
                autocmd FileType perl setlocal expandtab shiftwidth=4
                autocmd FileType perl compiler perlcritic
                autocmd FileType perl set iskeyword-=-
                autocmd FileType python setlocal shiftwidth=4
                autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
                autocmd FileType python setlocal makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
                autocmd FileType python setlocal efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#
                if count(g:spf13_bundle_groups, 'python')
                    autocmd FileType python let g:syntastic_check_on_wq = 0
                endif

                autocmd BufRead,BufNewFile *.bats let b:syntastic_mode = 'passive'

                " https://github.com/htgoebel/yaml2rst/blob/develop/docs/fold-markers.rst
                autocmd FileType ansible,jinja,yaml,tex setlocal foldmarker=[[[,]]]
                autocmd FileType ansible,jinja,yaml syntax spell toplevel
                " Use this foldmarker to avoid folds when using Jinja2
                " templates.
                " autocmd Syntax jinja syntax enable

                autocmd FileType ansible IndentGuidesDisable

                autocmd FileType c setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

                autocmd FileType html compiler tidy
                autocmd FileType xml setlocal foldmethod=indent
                " autocmd FileType xml setlocal foldmethod=syntax " does not work
                autocmd FileType markdown let b:delimitMate_nesting_quotes = ["`"]
                autocmd FileType tex,html,markdown,rst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
                autocmd FileType tex nnoremap <buffer> <silent>	<Leader>ae	:call TexACClosePrev('n')<cr>
                " inoremap <buffer> <silent>	<C-\>c		<c-\><c-o>:call TexACClosePrev('i')<cr>
                autocmd FileType tex abbr „ \enquote{
                " autocmd FileType tex abbr “ }
                " Not needed, closed by auto-pairs.

                " autocmd FileType gitcommit IndentGuidesDisable
                autocmd FileType gitcommit normal gg
                autocmd FileType gitcommit call matchadd('ColorColumn', '\%1l\%74v', 100)
                " autocmd FileType {c,cpp} autocmd BufWritePost <buffer> silent ! [ -e tags ] &&
                    " \ ( awk -F'\t' '$2\!="%:gs/'/'\''/"{print}' tags ; ctags -f- '%:gs/'/'\''/' )
                    " \ | sort -t$'\t' -k1,1 -o tags.new && mv tags.new tags

                autocmd FileType sh autocmd BufWritePre * call TrimTrailingEmptyLines()


            " }}}

            " autocmd VimEnter * RainbowParenthesesToggle " enable by defalut
            " autocmd Syntax * RainbowParenthesesLoadRound " default
            "
            " Not needed currently.
            " autocmd VimEnter,BufRead,BufNewFile * if exists(":RainbowParenthesesLoadSquare")|exe "RainbowParenthesesLoadSquare"|endif
            " autocmd VimEnter,BufRead,BufNewFile * if exists(":RainbowParenthesesLoadBraces")|exe "RainbowParenthesesLoadBraces"|endif
            "
            autocmd BufRead * if exists(":DetectIndent")|exe "DetectIndent"|endif
            " autocmd BufRead,BufNewFile * call SetIndentWidth()
            " autocmd BufWritePost * echo &ff
            autocmd QuickFixCmdPost make cwindow
            autocmd VimEnter * if &diff | execute 'windo set wrap' | endif

            " Always switch to the current file directory
            autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
            " autocmd BufEnter * if expand("%:p") =~ "/.unison/" | lcd | endif
            " Go to home for unison to use file completion easily.

            let autocommands_loaded = 1
        endif
    endif
" }}}
