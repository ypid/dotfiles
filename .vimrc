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
    " call add(g:spf13_bundle_groups, 'programming_not_often_used')
    call add(g:spf13_bundle_groups, 'perl')
    call add(g:spf13_bundle_groups, 'snipmate')
    call add(g:spf13_bundle_groups, 'html')
    call add(g:spf13_bundle_groups, 'python')

    call add(g:spf13_bundle_groups, 'misc')
    " call add(g:spf13_bundle_groups, 'games')

    " Not often used, not properly tested.
    call add(g:spf13_bundle_groups, 'testing')
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

            " Bundle 't9md/vim-quickhl'
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

            " Bundle 'autoproto.vim'

            Bundle 'chase/vim-ansible-yaml'
            " Bundle 'Glench/Vim-Jinja2-Syntax'
            " Bundle 'icook/Vim-Jinja2-Syntax'
            Bundle 'chase/Vim-Jinja2-Syntax'
        endif
        if count(g:spf13_bundle_groups, 'tested_not_using')
            " I don‘t really like this behavior
            " Bundle 'terryma/vim-smooth-scroll'
            " noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
            " noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
            " noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>
            " noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>
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

            " Bundle 'tpope/vim-abolish'

            " Translate {{{
                if has("python") && executable('python')
                    Bundle 'ypid/lookup.vim'
                    " let g:lookup_dict_para = []
                    " noremap <Leader>tr :Lookup<CR>
                    " vmap <Leader>tr :call LookupVisual()<CR>
                    noremap ι :Lookup<CR>
                    vmap ι :call LookupVisual()<CR>
                    " Shift+Layer3Mod+s
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
            Bundle 'tpope/vim-markdown'
            " Bundle 'plasticboy/vim-markdown'
            Bundle 'jtratner/vim-flavored-markdown'

            " Bundle 'Rykka/riv.vim'
            " Bundle 'Rykka/InstantRst'

            Bundle 'bronson/vim-visual-star-search'
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
                Bundle 'bling/vim-airline'
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
            highlight SyntasticErrorSign guifg=red guibg=red
            " let g:syntastic_mode_map = { 'mode': 'active',
            "                            \ 'active_filetypes': [],
            "                            \ 'passive_filetypes': ['python'] }
            let g:syntastic_ignore_files = ['\m^/etc/']
            let g:syntastic_check_on_wq = 0
            " Too slow for some big files. I am looking at you opening_hours.js :-( ;-)
            "
            let g:syntastic_tex_checkers = ['chktex']
            let g:syntastic_cpp_checkers = ['gcc', 'cppclean']
            "
            " Bundle 'Valloric/YouCompleteMe'
            " Much dependencies
            " Bundle 'vivien/vim-addon-linux-coding-style'
            Bundle 'tpope/vim-surround'

            Bundle 'lfilho/cosco.vim'
            noremap <silent> <Leader>, :call cosco#commaOrSemiColon()<CR>
            inoremap <silent> <Leader>, <c-o>:call cosco#commaOrSemiColon()<CR>
            " Bundle 'oinksoft/endline.vim'
            " let g:EndlineInsertMapping = '<Leader>,'

            " More text objects {{{
                " http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
                Bundle 'michaeljsmith/vim-indent-object'

                " Bundle 'wellle/targets.vim'

                " Text object for [a]rgument in function. E.g. def " test(test='def', 24)
                " Bundle 'argtextobj.vim'
                Bundle 'b4winckler/vim-angry'

                Bundle 'terryma/vim-expand-region'
                map ν <Plug>(expand_region_expand)
                " Shift+Layer3Mod+j
                map ρ <Plug>(expand_region_shrink)
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

            " Tabularize {{{
                Bundle 'godlygeek/tabular'
                noremap <Leader>a)  :Tabularize /)/l0<CR>
                noremap <Leader>a&  :Tabularize /&<CR>
                noremap <Leader>a=  :Tabularize /[/*+-]\?=<CR>
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
                " Bundle 'ciaranm/detectindent'
                Bundle 'ypid/detectindent'
                let g:detectindent_preferred_expandtab = 1
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
                " noremap α :echo system('date -d @'.expand('<cword>'))<CR>
            " }}}

            Bundle 'derekwyatt/vim-fswitch'
            nnoremap <Leader>h :FSSplitBelow<cr>

            " Highlight brackets
            " Bundle 'kien/rainbow_parentheses.vim'
            " nnoremap <Leader>R :RainbowParenthesesToggle<CR>

            if executable('ctags')
                Bundle 'majutsushi/tagbar'
                nnoremap <Leader>ft :TagbarToggle<cr>

                " Bundle 'craigemery/vim-autotag'
                " Did not work. Using manual autocmd.
                "
                " Bundle 'xolox/vim-misc'
                " Bundle 'xolox/vim-easytags'
                let g:easytags_async = 1
                " " let g:easytags_file = '~/.vim/tags'
                " " let g:easytags_file = './tags'
                let g:easytags_dynamic_files = 1
            endif

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
        elseif count(g:spf13_bundle_groups, 'neocomplcache')

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
            " Pick either python-mode or pyflakes & pydoc
            Bundle 'klen/python-mode'
            let g:pymode_folding = 1
            let g:pymode_doc = 0
            let g:pymode_run_bind = '<leader>aa'
            let g:pymode_lint_cwindow = 1
            let g:pymode_breakpoint_bind = '<leader>ö'
            let g:pymode_rope_completion = 0
            let g:pymode_lint_ignore="E302"
            " E302: I use sometimes folds to group a few functions together.
            " let g:pymode_folding = 0
            " I use powerman/vim-plugin-viewdoc for that kind of thing.
            " Bundle 'python.vim'
            " Bundle 'python_match.vim'
            " Bundle 'pythoncomplete'

            " PyMode {{{
                let g:pymode_lint_checker = "pyflakes"
                let g:pymode_options = 0
            " }}}

            " PythonMode {{{
            " Disable if python support not present
                if !has('python')
                    let g:pymode = 1
                endif
            " }}}
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
        " set background=light
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

            " Adjust the filetype for some files {{{
                autocmd BufRead,BufNewFile .mrconfig* setlocal filetype=sh
                autocmd BufRead,BufNewFile .vimpagerrc setlocal filetype=vim
                autocmd BufRead,BufNewFile /etc/*/apt.conf setlocal filetype=conf
                autocmd BufRead,BufNewFile /etc/hosts setlocal filetype=conf
                autocmd BufRead,BufNewFile /etc/NetworkManager/NetworkManager.conf setlocal filetype=conf
                autocmd BufRead,BufNewFile /usr/share/X11/xkb/* setlocal filetype=xkb
                autocmd BufRead,BufNewFile $HOME/.ssh/*config* setlocal filetype=sshconfig
                autocmd BufRead,BufNewFile $HOME/.unison/* setlocal filetype=conf

                " http://mathias-kettner.de/checkmk_configfiles.html
                autocmd BufRead,BufNewFile *.mk setlocal filetype=python

                " I already use the "wrong" file suffix for all my LaTeX files
                " autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
                autocmd BufRead,BufNewFile *.ldf setlocal filetype=tex
                autocmd BufRead,BufNewFile *.lco setlocal filetype=tex

                " autocmd BufRead,BufNewFile source.list.* setlocal filetype=debsources
                autocmd BufRead,BufNewFile .gitignore setlocal filetype=conf

                autocmd BufRead,BufNewFile *.nse setlocal filetype=lua

                autocmd BufRead,BufNewFile *firejail/** HideBadWhitespace

                autocmd BufRead,BufNewFile *subuser/** HideBadWhitespace
                autocmd BufRead,BufNewFile *subuser/** let b:syntastic_mode = 'passive'
                autocmd BufRead,BufNewFile *subuser/** let g:pymode_trim_whitespaces = 0
                autocmd BufRead,BufNewFile *subuser/** let g:pymode_lint = 0

                autocmd BufRead,BufNewFile *ansible/**/ if &filetype=='yaml'|set filetype=ansible|endif
                autocmd BufRead,BufNewFile *ansible/*vars/* set filetype=yaml
                autocmd BufRead,BufNewFile *ansible/**/ if &filetype==''|set filetype=yaml|endif
                autocmd BufReadPost *.j2 setlocal filetype=jinja
                autocmd BufRead,BufNewFile *ansible/hosts setf dosini|syn on
            " }}}

            autocmd BufWritePre /tmp/*  setlocal noundofile
            autocmd BufWritePre *sec*   setlocal noundofile
            autocmd BufWritePre *crypt* setlocal noundofile
            autocmd BufWritePre *mnt*   setlocal noundofile

            autocmd BufRead,BufNewFile /etc/* if &filetype=='python'|let g:pymode_lint = 0|endif
            autocmd BufRead,BufNewFile /etc/* if &filetype=='python'|let g:pymode_rope = 0|endif

            " Set language specific stuff {{{
                autocmd FileType vim setlocal expandtab shiftwidth=4
                autocmd FileType vim let b:delimitMate_quotes = "' `"
                autocmd FileType sh setlocal textwidth=0
                autocmd FileType perl setlocal expandtab shiftwidth=4
                autocmd FileType perl compiler perlcritic
                autocmd FileType python setlocal shiftwidth=4
                autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
                autocmd FileType python setlocal makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
                autocmd FileType python setlocal efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#
                if count(g:spf13_bundle_groups, 'python')
                    autocmd FileType python let g:syntastic_check_on_wq = 0
                endif

                autocmd FileType ansible,jinja,yaml,tex setlocal foldmarker=(((,)))
                autocmd FileType ansible,jinja,yaml syntax spell toplevel
                " Use this foldmarker to avoid folds when using Jinja2
                " templates.
                " autocmd Syntax jinja syntax enable

                autocmd FileType c setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

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
                " au FileType {c,cpp} au BufWritePost <buffer> silent ! [ -e tags ] &&
                    " \ ( awk -F'\t' '$2\!="%:gs/'/'\''/"{print}' tags ; ctags -f- '%:gs/'/'\''/' )
                    " \ | sort -t$'\t' -k1,1 -o tags.new && mv tags.new tags
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
            " autocmd FileType c,cpp,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> EraseBadWhitespace
            autocmd VimEnter * if &diff | execute 'windo set wrap' | endif

            " Always switch to the current file directory
            autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
            " autocmd BufEnter * if expand("%:p") =~ "/.unison/" | lcd | endif
            " Go to home for unison to use file completion easily.

            let autocommands_loaded = 1
        endif
    endif
" }}}

" GUI Settings {{{
    " GVIM- (here instead of .gvimrc)
    if count(g:config_section_enable, 'gui_config')
        if has('gui_running')
            set guioptions-=T           " Remove the toolbar
            set lines=40                " 40 lines of text instead of 24
            if has("gui_gtk2")
                set guifont=Andale\ Mono\ Regular\ 15,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 12
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
    endif
" }}}
