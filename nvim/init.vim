" High level configuration and plugin groups {{{
let g:config_section_enable = []
call add(g:config_section_enable, 'general_config')
call add(g:config_section_enable, 'omnicomplete')
call add(g:config_section_enable, 'ui_config')
call add(g:config_section_enable, 'solarized')
call add(g:config_section_enable, 'autocmd_config')
call add(g:config_section_enable, 'gui_config')
call add(g:config_section_enable, 'machine_spesific')

" Configure plugin groups {{{
let g:spf13_bundle_groups = []

call add(g:spf13_bundle_groups, 'init_plugin_system')

" Default
" call add(g:spf13_bundle_groups, 'plugin_dependencies')
call add(g:spf13_bundle_groups, 'general_important')
" call add(g:spf13_bundle_groups, 'general_restore_view')
call add(g:spf13_bundle_groups, 'general')
call add(g:spf13_bundle_groups, 'ui_enhancements')
call add(g:spf13_bundle_groups, 'generic_programming')
call add(g:spf13_bundle_groups, 'programming_not_often_used')
call add(g:spf13_bundle_groups, 'perl')
call add(g:spf13_bundle_groups, 'jinja2')
call add(g:spf13_bundle_groups, 'sysadmin')
call add(g:spf13_bundle_groups, 'snipmate')
call add(g:spf13_bundle_groups, 'html')
call add(g:spf13_bundle_groups, 'python')
call add(g:spf13_bundle_groups, 'haxe')

call add(g:spf13_bundle_groups, 'misc')
" call add(g:spf13_bundle_groups, 'games')

" Not often used, not properly tested.
call add(g:spf13_bundle_groups, 'testing')
" call add(g:spf13_bundle_groups, 'neocomplcache')
call add(g:spf13_bundle_groups, 'latex')
call add(g:spf13_bundle_groups, 'javascript')
" call add(g:spf13_bundle_groups, 'scala')
" call add(g:spf13_bundle_groups, 'ruby')
" call add(g:spf13_bundle_groups, 'golang')
call add(g:spf13_bundle_groups, 'c')


if $ANDROID_ROOT != ''
    let g:spf13_bundle_groups = []
endif
" }}}

" }}}

source ~/.config/nvim/init_min.vim

" Don’t continue sourcing this in template qubes on Qubes OS to reduce attack surface.
if filereadable("/run/qubes/this-is-templatevm")
    finish
endif

" Plugins {{{

if count(g:spf13_bundle_groups, 'init_plugin_system') " {{{
    " I use git submodules to manage my plugins. To avoid redundancy, I put
    " "ghost" as owner here.

    filetype off

    set runtimepath+=~/.vim/bundle/vundle
    call vundle#rc()

    " Needed to make doc helptags work.
    Plugin 'ghost/vundle'

    " set runtimepath+=~/.vim/bundle/neobundle.vim
    " call neobundle#begin(expand('~/.vim/bundle/'))
endif " }}}

if count(g:spf13_bundle_groups, 'plugin_dependencies') " {{{
    Plugin 'ghost/vim-addon-mw-utils'
    Plugin 'ghost/tlib_vim'
endif " }}}

if count(g:spf13_bundle_groups, 'testing') " {{{

    " Plugin 'terryma/vim-multiple-cursors'
    " let g:multi_cursor_next_key='<c-e>'
    " let g:multi_cursor_prev_key='<C-p>'

    " Plugin 't9md/vim-quickhl'
    " nmap μ <Plug>(quickhl-manual-this)
    " vmap μ <Plug>(quickhl-manual-this)
    " " Shift+Layer3Mod+m
    " "
    " " xmap <Space>M <Plug>(quickhl-manual-reset)
    " nmap β :QuickhlManualReset<CR>

    " Shift+Layer3Mod+n
    " Shift+Layer3Mod+μ
    " nmap μ <Plug>(quickhl-tag-toggle)

    " let g:yankring_history_dir = '$HOME/.vimswap'
    " Plugin 'YankRing.vim'
    " Plugin 'maxbrunsfeld/vim-yankstack'

    " Plugin 'wellle/tmux-complete.vim'

    " Plugin 'kshenoy/vim-origami'

    " Plugin 'TTCoach'

    " Replace with fzf or something.
    " Plugin 'rm-hull/vim-locate'

    " I am using the plugin versions compatible with fzf v0.17.5 on
    " purpose because that is the version included in Debian Buster.
    Plugin 'ghost/fzf'
    Plugin 'ghost/fzf.vim'


    " You simply select the region, call :NR and the selected part
    " will open in a new split window while the rest of the buffer
    " will be protected.
    " Plugin 'chrisbra/NrrwRgn'

    " Already included in recent Vim versions.
    " Plugin 'elzr/vim-json'

    " TODO: Still needed?
    Plugin 'ghost/anwolib'

    let g:auto_save_silent = 1
    Plugin 'ghost/vim-auto-save'
    nnoremap σ :AutoSaveToggle<CR>
    " Shift+Layer3Mod+s
endif " }}}

if count(g:spf13_bundle_groups, 'general_important') " {{{
    " Used multiple times *every* Vim session.

    " CtrlP {{{
    " Plugin 'wincent/Command-T'
    Plugin 'ghost/ctrlp.vim'
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

    " Plugin 'tomtom/tcomment_vim'
    " let g:tcommentOptions = {'strip_whitespace': 1}

    Plugin 'ghost/nerdcommenter'
    let NERDSpaceDelims = 1

    " noremap <Bar> :call NERDComment("n", "AlignLeft")<cr>
    " Use <Leader>cb for this.
    noremap <Bar> :call NERDComment('n', 'Toggle')<cr>

    " }}}

    " Proper regex support {{{
    " Even after years of using Vim, I could never get used to
    " it’s regex dialect. Just use something proper.

    Plugin 'ghost/eregex.vim'

    " }}}

endif " }}}

if count(g:spf13_bundle_groups, 'general_restore_view') " {{{
    " Disable this group for working on Vim configuration and
    " testing new buffer stuff.
    Plugin 'ghost/restore_view.vim'
endif " }}}

if count(g:spf13_bundle_groups, 'general') " {{{
    " Plugin 'scrooloose/nerdtree'
    " noremap <Leader>v :NERDTreeToggle<CR>

    " Auto close opening characters like '(' with ')' {{{
        " Plugin 'spf13/vim-autoclose' " Too simple, no indent stuff
        " let g:AutoPairShortcutToggle = '<Leader>ac'
        " Plugin 'jiangmiao/auto-pairs' " Could not get inserting new closing brackets and jumping to existing brackets at once to work
        " let g:AutoPairsFlyMode = 1
        " noremap <silent> <Leader>ac :call AutoPairsToggle()<CR>
        " inoremap <silent> <Leader>ac <ESC>:call AutoPairsToggle()<CR>a
        Plugin 'ghost/delimitMate'
        let delimitMate_expand_cr = 1
    " }}}

    " Plugin 'vim-scripts/sessionman.vim'

    if !has('nvim')
        Plugin 'matchit.zip'
    endif

    " Plugin 'ghost/vim-sleuth'
    Plugin 'ghost/editorconfig-vim'

    " Trailing whitespace handling {{{
        " Plugin 'bitc/vim-bad-whitespace'
        " noremap <Leader>fc :EraseBadWhitespace<CR>

        Plugin 'ghost/vim-better-whitespace'
        noremap <Leader>fc :StripWhitespace<CR>
    " }}}

    Plugin 'ghost/vim-repeat'

    Plugin 'ghost/vim-characterize'

    Plugin 'ghost/vim-speeddating'
    " Refer to .vimrc.min for details.
    nmap  <C-S>     <Plug>SpeedDatingUp
    nmap  <C-X>     <Plug>SpeedDatingDown
    xmap  <C-S>     <Plug>SpeedDatingUp
    xmap  <C-X>     <Plug>SpeedDatingDown
    nmap d<C-S>     <Plug>SpeedDatingNowUTC
    nmap d<C-X>     <Plug>SpeedDatingNowLocal

    " Plugin 'tpope/vim-abolish'

    " Translate {{{
    if has("python") || has("python3")
        Plugin 'ghost/lookup.vim'
        let g:lookup_databases = [ 'jargon', 'vera', 'english-german', 'german-english', 'elements', 'gcide' ]
        " noremap <Leader>tr :Lookup<CR>
        " vmap <Leader>tr :call LookupVisual()<CR>
        nnoremap δ :Lookup<CR>
        vnoremap δ :call LookupVisual()<CR>
        " Shift+Layer3Mod+d
        " This is a workaround: See Shift+Layer3Mod+s in
        " .vimrc.min
    endif
    " }}}

    " Plugin 'Lokaltog/vim-easymotion'
    " let g:EasyMotion_leader_key = '<Leader>j'
    " Don’t really using it for now.

    " Plugin 'ghost/gundo.vim'
    " let g:gundo_prefer_python3 = 1
    " nnoremap ρ :GundoToggle<CR>
    " Shift+Layer3Mod+r
    " Shift+Layer3Mod+u cannot be used because it is the same as Shift+Layer3Mod+h on neo_qwertz.
    Plugin 'ghost/vim-mundo'
    let g:mundo_prefer_python3 = 1
    nnoremap ρ :MundoToggle<CR>

    " WARNING: I only reviewed the code paths that I use from this library
    " because it is too big.
    Plugin 'ghost/vim-ingo-library'

    " https://stackoverflow.com/questions/22193596/in-vim-how-to-remove-all-lines-that-are-duplicate-somewhere/22377072#22377072
    Plugin 'ghost/vim-PatternsOnText'

    "" Indent guide {{{
    " Plugin 'Yggdroot/indentLine'
    Plugin 'ghost/vim-indent-guides'
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    " let g:indent_guides_guide_size = 2
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_soft_pattern = ' '

    let g:indent_guides_default_mapping = 0
    noremap <silent> ι :IndentGuidesToggle<CR>
    " Shift+Layer3Mod+i
    " }}}

    let g:markdown_folding = 1
    let g:markdown_fenced_languages = ['html', 'javascript', 'python', 'bash=sh']
    " Plugin 'tpope/vim-markdown'
    " Plugin 'plasticboy/vim-markdown'
    " Plugin 'jtratner/vim-flavored-markdown'

    if executable('task')
        Plugin 'ghost/vim-taskwarrior'
    endif

    Plugin 'ghost/riv.vim'
    " Plugin 'Rykka/InstantRst'
    noremap <Leader>Q :RivTitle1<CR>'.
    inoremap <Leader>Q <ESC>:RivTitle1<CR>o
    noremap <Leader>q :RivTitle2<CR>'.
    inoremap <Leader>q <ESC>:RivTitle2<CR>o
    noremap <Leader>w :RivTitle3<CR>'.
    inoremap <Leader>w <ESC>:RivTitle3<CR>o

    " Plugin 'bronson/vim-visual-star-search'
    Plugin 'ghost/vim-visualstar'

    let g:move_map_keys = 0
    Plugin 'ghost/vim-move'
    vnoremap κ <Plug>MoveBlockUp
    nnoremap κ <Plug>MoveLineUp
    " Shift+Layer3Mod+k

    vnoremap θ <Plug>MoveBlockDown
    nnoremap θ <Plug>MoveLineDown
    " Shift+Layer3Mod+j

    Plugin 'ghost/vim-plugin-AnsiEsc'

    " Show diff for before recover.
    Plugin 'ghost/Recover.vim'
endif " }}}

if count(g:spf13_bundle_groups, 'ui_enhancements') " {{{

    Plugin 'ghost/vim-airline' " {{{

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

    " Plugin 'ghost/vim-smooth-scroll' " {{{

    " " I don‘t really like this behavior
    " noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
    " noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    " noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>
    " noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>

    " " }}}

endif " }}}

if count(g:spf13_bundle_groups, 'generic_programming') " {{{

    if has('nvim')
        " Plugin 'ghost/neomake'
        " call neomake#configure#automake('rw', 1000)
    else
        Plugin 'ghost/syntastic'
        " Plugin 'pydave/AsyncCommand'
        " Plugin 'stgpetrovic/syntastic-async'
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
        let g:syntastic_yaml_checkers = []
        " let g:syntastic_yaml_yamllint_args = '-c ' . shellescape($HOME . '/.yamllint')

        " ansible-lint is currently too slow for checking while editing.
        let g:syntastic_ansible_checkers = ['yamllint']
    endif


    " Plugin 'Valloric/YouCompleteMe'
    " Much dependencies
    " Plugin 'vivien/vim-addon-linux-coding-style'
    Plugin 'ghost/vim-surround'

    " Plugin 'lfilho/cosco.vim'
    " noremap <silent> <Leader>, :call cosco#commaOrSemiColon()<CR>
    " inoremap <silent> <Leader>, <c-o>:call cosco#commaOrSemiColon()<CR>
    " I pressed ,, too often accidentally.

    " Plugin 'oinksoft/endline.vim'
    " let g:EndlineInsertMapping = '<Leader>,'

    " More text objects {{{
        " http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
        Plugin 'ghost/vim-indent-object'

        " Plugin 'wellle/targets.vim'

        " Text object for [a]rgument in function. E.g. def " test(test='def', 24)
        " Plugin 'argtextobj.vim'
        Plugin 'ghost/vim-angry'

        " Plugin 'terryma/vim-expand-region'
        " Not using currently, map again when the need arises. I need
        " those rare key combinations :)
        " map ν <Plug>(expand_region_expand)
        " Shift+Layer3Mod+j
        " map ρ <Plug>(expand_region_shrink)
        " Shift+Layer3Mod+k

        " https://stackoverflow.com/questions/6588899/add-support-for-ci-and-da-seleting-text-inside-pipes/6589216#6589216
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
            Plugin 'ghost/vim-fugitive'
            nnoremap <silent> <Leader>gs :Gstatus<CR>
            nnoremap <silent> <Leader>gd :Gdiff<CR>
            nnoremap <silent> <Leader>gc :Gcommit<CR>
            nnoremap <silent> <Leader>gb :Gblame<CR>
            nnoremap <silent> <Leader>gl :Glog<CR>
            nnoremap <silent> <Leader>gp :Git push<CR>
        " }}}

        " Plugin 'int3/vim-extradite'
        " let g:extradite_showhash = 1
        " command! Gloge Extradite

        " Plugin 'airblade/vim-gitgutter'
        " Show changes in working copy with plus sign, start of the line

        Plugin 'ghost/diffconflicts'
    " }}}

    Plugin 'ghost/vim-diff-enhanced'

    Plugin 'ghost/vim-plugin-viewdoc'
    let g:manpageview_options_pl = ";-f;-q;-t;"
    let g:viewdoc_openempty = 1
    let g:viewdoc_copy_to_search_reg = 1
    let g:viewdoc_prevtabonclose = 1

    " Plugin 'ghost/zeavim.vim'

    " Tabularize {{{
        Plugin 'ghost/tabular'
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

    " Toggle words {{{

    Plugin 'toggle_words.vim'
    noremap ο :ToggleWord<CR>
    " Shift+Layer3Mod+o

    " Plugin 'ghost/vim-cycle'

    " }}}

    Plugin 'ghost/vim-endwise'

    " Ack {{{

    if executable('rg')
        Plugin 'ghost/vim-ripgrep'

        command! -nargs=* -complete=file Rg :call s:Rg(<q-args>)
        command! -complete=file RgRoot :call s:RgShowRoot()
    elseif executable('ag')
        let g:ackprg = 'ag --vimgrep'
    elseif executable('ack-grep')
        let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    endif

    if executable('ack') || exists('g:ackprg')
        Plugin 'ghost/ack.vim'

        command! -bang -nargs=* -complete=file Ag           call ack#Ack('grep<bang>', <q-args>)
        command! -bang -nargs=* -complete=file AgAdd        call ack#Ack('grepadd<bang>', <q-args>)
        command! -bang -nargs=* -complete=file AgFromSearch call ack#AckFromSearch('grep<bang>', <q-args>)
        command! -bang -nargs=* -complete=file LAg          call ack#Ack('lgrep<bang>', <q-args>)
        command! -bang -nargs=* -complete=file LAgAdd       call ack#Ack('lgrepadd<bang>', <q-args>)
        command! -bang -nargs=* -complete=file AgFile       call ack#Ack('grep<bang> -g', <q-args>)
        command! -bang -nargs=* -complete=help AgHelp       call ack#AckHelp('grep<bang>', <q-args>)
        command! -bang -nargs=* -complete=help LAgHelp      call ack#AckHelp('lgrep<bang>', <q-args>)
        command! -bang -nargs=*                AgWindow     call ack#AckWindow('grep<bang>', <q-args>)
        command! -bang -nargs=*                LAgWindow    call ack#AckWindow('lgrep<bang>', <q-args>)
    endif

    " }}}

    " Plugin 'whatyouhide/vim-lengthmatters'
    " let g:lengthmatters_on_by_default = 0

    Plugin 'ghost/vim-fswitch'
    nnoremap <Leader>h :FSSplitBelow<cr>

    " Highlight brackets.
    Plugin 'ghost/rainbow_parentheses.vim'
    nnoremap <Leader>R :RainbowParenthesesToggle<CR>

    if executable('ctags') " {{{
        " Plugin 'majutsushi/tagbar'
        " nnoremap <Leader>ft :TagbarToggle<cr>

        " Plugin 'craigemery/vim-autotag'
        " Did not work. Using manual autocmd.

        " " vim-easytags depends on vim-misc.
        " Plugin 'xolox/vim-misc'
        " Plugin 'xolox/vim-easytags'
        " let g:easytags_async = 1
        " " let g:easytags_file = '~/.vim/tags'
        " " let g:easytags_file = './tags'
        " let g:easytags_dynamic_files = 1

        " Taglist {{{

        " Plugin 'taglist.vim'
        " noremap <Leader>cq :TlistToggle<cr>
        noremap <Leader>cr :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
        " let Tlist_WinWidth = 30

        " }}}

    endif " }}}

    " Needs to be set before other stuff in the .vimrc to work
    " correctly.
    " https://stackoverflow.com/questions/413015/a-problem-with-folding-bash-functions-in-vim/38934275#38934275
    autocmd FileType sh let g:sh_fold_enabled=5
    autocmd FileType sh let g:is_bash=1
    autocmd FileType sh set foldmethod=syntax

    " Save and run {{{
    " Not needed currently.
        " Plugin 'xuhdev/SingleCompile'
        " let g:SingleCompile_alwayscompile = 0
        " call SingleCompile#SetCompilerTemplate('mkd', 'markdown',
        "             \ 'text-to-HTML conversion tool', 'markdown',
        "             \ '> $(FILE_TITLE)$.html', 'true' )
        " call SingleCompile#SetPriority('mkd', 'markdown', 50)

        " call SingleCompile#ChooseCompiler('mkd', 'markdown')

        " noremap <Leader>as :SCCompileRun<CR>
        " inoremap <Leader>as <c-o>:SCCompileRun<CR>
    " }}}

    " Plugin 'ghost/license-to-vim'

endif " }}}

" General Programming (not often used) {{{
    if count(g:spf13_bundle_groups, 'programming_not_often_used')

        " Plugin 'mattn/webapi-vim'
        " Plugin 'mattn/gist-vim'

        Plugin 'ghost/SyntaxAttr.vim'
        noremap <Leader>ti :call SyntaxAttr#SyntaxAttr()<CR>

        Plugin 'ghost/SrchRplcHiGrp.vim'
    endif
" }}}

" Snippets & AutoComplete {{{
    if count(g:spf13_bundle_groups, 'snipmate')
        if has("python") || has("python3")
            " Needs to be before syntax on …
            Plugin 'ghost/ultisnips'
            Plugin 'ghost/vim-snippets'
            let g:UltiSnipsListSnippets = "<Leader><tab>"
            let g:UltiSnipsExpandTrigger="<tab>"
        endif
    endif

    " TODO: Switch to: https://github.com/Shougo/deoplete.nvim
    " Plugin 'neocomplete.vim'
    if count(g:spf13_bundle_groups, 'neocomplcache') " {{{
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
    endif " }}}

" }}}

if count(g:spf13_bundle_groups, 'bash') " {{{
    Plugin 'ghost/bats.vim'
endif " }}}

if count(g:spf13_bundle_groups, 'msshell') " {{{
    Plugin 'ghost/vim-ps1'
endif " }}}

if count(g:spf13_bundle_groups, 'perl') " {{{
    " Replaced by neomake:
    " Plugin 'ghost/perlcritic-compiler-script'

    Plugin 'ghost/vim-perl'
    " Plugin 'c9s/perlomni.vim'
endif " }}}

if count(g:spf13_bundle_groups, 'python') " {{{
    if has('python')
        " Plugin 'klen/python-mode'
    endif

    " Pick either python-mode or pyflakes & pydoc
    " let g:pymode_lint_write = 0
    let g:pymode_options_max_line_length = 100
    let g:pymode_folding = 1

    let g:pymode_doc = 0
    " I use powerman/vim-plugin-viewdoc for that kind of thing.

    " let g:pymode_syntax = 0
    let g:pymode_run_bind = '<Leader>aa'
    let g:pymode_breakpoint_bind = '<Leader>ö'

    let g:pymode_lint_ignore="E302"
    " E302: I use sometimes folds to group a few functions together.
    " let g:pymode_folding = 0

    let g:pymode_lint_checker = "pyflakes"
    let g:pymode_options = 0

    " Plugin 'python.vim'
    " Plugin 'python_match.vim'
    " Plugin 'pythoncomplete'

endif " }}}

if count(g:spf13_bundle_groups, 'haxe') " {{{
    Plugin 'ghost/vaxe'
endif " }}}

if count(g:spf13_bundle_groups, 'cpp') " {{{
    Plugin 'ghost/qmake-syntax-vim'
endif " }}}

if count(g:spf13_bundle_groups, 'scala') " {{{
    " Plugin 'derekwyatt/vim-scala'
    " Plugin 'derekwyatt/vim-sbt'
endif " }}}

if count(g:spf13_bundle_groups, 'javascript') " {{{
    " Replaced by neomake:
    " Plugin 'ghost/jshint2.vim'

    " Plugin 'leshill/vim-json'
    " Plugin 'groenewege/vim-less'
    " Plugin 'pangloss/vim-javascript'
    " Plugin 'briancollins/vim-jst'
    " Plugin 'kchmck/vim-coffee-script'
endif " }}}

if count(g:spf13_bundle_groups, 'latex') " {{{
    " " IMPORTANT: grep will sometimes skip displaying the file name if you
    " " search in a singe file. This will confuse Latex-Suite. Set your grep
    " " program to always generate a file-name.
    " set grepprg=grep\ -nH\ $*

    " " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " " The following changes the default filetype back to 'tex':
    " let g:tex_flavor='latex'
    " imap <Leader>Y <Plug>inoremap_JumpForward
    " inoremap <Leader>C <ESC>:LatexTOC<cr>
    " noremap <Leader>C :LatexTOC<cr>
    " " Plugin 'ghost/LaTeX-Box'
    " " Plugin 'ghost/vim-tex-autoclose'

    " Give vimtex a try.
    " Plugin 'ghost/vimtex'
endif " }}}

if count(g:spf13_bundle_groups, 'html') " {{{
    " AutoCloseTag {{{
        " Automatically closes HTML tag once you finish typing it with >.
        " Plugin 'karuna/HTML-AutoCloseTag'
        " Plugin 'amirh/HTML-AutoCloseTag'
        Plugin 'ghost/HTML-AutoCloseTag'
        let g:closetag_html_style=1

        " Plugin 'closetag.vim'
        " Plugin 'inkarkat/closetag.vim'
        Plugin 'ghost/closetag.vim'
        " Default mapping: inoremap <expr> <Leader>ae <SID>GetCloseTag('i')
    " }}}

    " Plugin 'sukima/xmledit'
    let xml_syntax_folding=1

    " Plugin 'hail2u/vim-css3-syntax'
    " Plugin 'tpope/vim-haml'
    "
    " Not needed anymore. Included in Vim.
    " https://github.com/groenewege/vim-less/issues/51
    " Plugin 'groenewege/vim-less'

    " Plugin 'greyblake/vim-preview' " configure Browser

    Plugin 'ghost/xterm-color-table.vim'
endif " }}}

if count(g:spf13_bundle_groups, 'ruby') " {{{
    " Plugin 'ghost/vim-rails'
    " let g:rubycomplete_buffer_loading = 1
    " let g:rubycomplete_classes_in_global = 1
    " let g:rubycomplete_rails = 1
endif " }}}

if count(g:spf13_bundle_groups, 'golang') " {{{
    Plugin 'ghost/vim-golang'
    Plugin 'ghost/vim-gocode'
endif " }}}

if count(g:spf13_bundle_groups, 'jinja2') " {{{
    " Supports MatchIt and Endwise.
    Plugin 'ghost/Vim-Jinja2-Syntax'
endif " }}}

if count(g:spf13_bundle_groups, 'sysadmin') " {{{
    " Plugin 'Puppet-Syntax-Highlighting'

    " Plugin 'pearofducks/ansible-vim'
    Plugin 'ghost/vim-ansible-yaml'

    Plugin 'ghost/salt-vim'

    Plugin 'ghost/logstash.vim'

    Plugin 'ghost/vim-nftables'
endif " }}}

if count(g:spf13_bundle_groups, 'miscelenous') " Misc {{{
    Plugin 'ghost/Tortoise-Typing'
    Plugin 'ghost/LearnVim'

    " Pro hardmode:
    " * "Helps" users that I teach Vim and who use my config. Fix:
    "   Enable it for them locally.
    " Contra hardmode:
    " * Prevents me from using Neo2 "standard" instead of Vim
    "   "custom". Why use $ which is specific to Vim when Neo2 has a
    "   shortcut to go to the end of the line?
    " Decission: Disable hardmode for myself.
    " Plugin 'wikitopian/hardmode'
    " let g:HardMode_level = 'wannabe'

    " Plugin 'spf13/vim-preview'
    " Plugin 'tpope/vim-cucumber'
    " Plugin 'quentindecock/vim-cucumber-align-pipes'
    " Plugin 'mattn/calendar-vim'
endif " }}}

if count(g:spf13_bundle_groups, 'games') " {{{
    Plugin 'TeTrIs.vim'
    Plugin 'sokoban.vim'
    Plugin 'ghost/nyancat-vim'
endif " }}}

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
    function! s:MkNonExDir(file, buf)
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

" Spellcheck {{{
" set spellfile=~/.vim/spell/en.utf-8.add set dictionary+=/usr/share/dict/words
" English is the default. German is legacy and is to be enabled
" only as needed.
"
if has('win32') || has('win64')
    set spelllang=en_us
else
    set spelllang=en_us,de_de
endif
" }}}

" Color schema {{{
    if count(g:config_section_enable, 'solarized')
        " Plugin 'altercation/vim-colors-solarized'
        " if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        "     let g:solarized_termcolors=256
        "     let g:solarized_termtrans=3
        "     " let g:solarized_contrast="high"
        "     " let g:solarized_visibility="high"
        "     color solarized             " Load a colorscheme
        " endif

        Plugin 'ghost/vim-solarized8'
        colorscheme solarized8_high
    else
        " Plugin 'flazz/vim-colorschemes'
        " Plugin 'nanotech/jellybeans.vim'
        " Plugin 'spf13/vim-colors'
    endif

    set background=dark

    if count(g:config_section_enable, 'ui_config')
        highlight clear SignColumn      " SignColumn should match background for
                                        " things like vim-gitgutter
        highlight ExtraWhitespace ctermbg=red guibg=red
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

" autocmd {{{

if count(g:config_section_enable, 'autocmd_config')
    let g:netrw_dirhistmax = 0

    if has('autocmd')
        augroup vimrc
            filetype on
            " autocmd BufWritePost $MYVIMRC source %
            " autocmd BufWritePost $HOME/.vimpagerrc source %
            autocmd VimLeave * if filereadable($HOME."/.vim/bundle/vundle/.netrwhist")|call delete($HOME."/.vim/bundle/vundle/.netrwhist")|endif
            autocmd VimLeave * if filereadable($HOME."/.vim/.netrwhist")|call delete($HOME."/.vim/.netrwhist")|endif

            autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

            autocmd BufReadCmd file://* exe "edit ".substitute(expand("<afile>"),"file:/*","/","")

            " Automatically set executable bit for scripts. {{{
            " https://www.reddit.com/r/linux/comments/e649x/
            function! MakeScriptExecuteable()
                if getline(1) =~# '\v^#!.*/bin/'
                    silent !chmod +x <afile>
                endif
            endf
            autocmd BufWritePost * call MakeScriptExecuteable()
            " }}}

            " Custom filetype detection. {{{
            autocmd BufRead,BufNewFile /etc/hosts setlocal filetype=conf
            autocmd BufRead,BufNewFile /etc/NetworkManager/NetworkManager.conf setlocal filetype=conf
            autocmd BufRead,BufNewFile /usr/share/X11/xkb/* setlocal filetype=xkb
            autocmd BufRead,BufNewFile /etc/salt/**.conf setlocal filetype=yaml
            autocmd BufRead,BufNewFile $HOME/.ssh/*config* setlocal filetype=sshconfig
            autocmd BufRead,BufNewFile $HOME/.unison/* setlocal filetype=conf
            autocmd BufRead,BufNewFile *logstash*/**/*.conf setlocal filetype=logstash

            autocmd BufRead,BufNewFile .gitignore setlocal filetype=conf
            " }}}

            " Adjust settings for files. {{{
            autocmd BufRead,BufNewFile yamllint setlocal filetype=yaml
            autocmd BufRead,BufNewFile .mrconfig* setlocal filetype=sh
            autocmd BufRead,BufNewFile $HOME/.config/mr/* setlocal filetype=sh
            autocmd BufRead,BufNewFile .vimpagerrc setlocal filetype=vim

            autocmd BufReadCmd salt://* exe "edit ".substitute(expand("<afile>"),'^salt:\/\/[^/]\+\/','./','')

            " I already use the "wrong" file suffix for all my LaTeX files
            " autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
            autocmd BufRead,BufNewFile *.ldf setlocal filetype=tex
            autocmd BufRead,BufNewFile *.lco setlocal filetype=tex

            autocmd BufRead,BufNewFile *mrconfig* setlocal filetype=dosini

            autocmd BufRead,BufNewFile *firejail/** HideBadWhitespace
            autocmd BufRead,BufNewFile *firejail/**.inc setlocal filetype=conf

            autocmd BufRead,BufNewFile *ansible/**/ if &filetype=='yaml'|setlocal filetype=ansible|endif
            autocmd BufRead,BufNewFile *ansible/inventory/**/ setlocal filetype=ansible
            autocmd BufRead,BufNewFile */default/main.yml setlocal foldlevel=1

            " autocmd BufRead,BufNewFile *ansible/**/ if &filetype==''|setlocal filetype=yaml|endif
            " }}}

            autocmd BufWritePre /tmp/*  setlocal noundofile
            autocmd BufWritePre *sec*   setlocal noundofile
            autocmd BufWritePre *crypt* setlocal noundofile
            autocmd BufWritePre *mnt*   setlocal noundofile

            autocmd BufWritePre *.rst,*.yml call TrimTrailingEmptyLines()

            " Set language specific stuff {{{
            autocmd FileType make setlocal noexpandtab
            autocmd FileType sh setlocal textwidth=0
            autocmd FileType perl setlocal iskeyword-=-
            autocmd FileType python setlocal makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
            autocmd FileType python setlocal efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#
            if count(g:spf13_bundle_groups, 'python')
                autocmd FileType python let g:syntastic_check_on_wq = 0
            endif

            autocmd BufRead,BufNewFile *.bats let b:syntastic_mode = 'passive'


            " https://github.com/htgoebel/yaml2rst/blob/develop/docs/fold-markers.rst
            autocmd FileType ansible,jinja,yaml,tex setlocal foldmarker=[[[,]]]

            autocmd FileType ansible IndentGuidesDisable

            autocmd FileType xml setlocal foldmethod=indent
            " autocmd FileType xml setlocal foldmethod=syntax " does not work
            autocmd FileType markdown let b:delimitMate_nesting_quotes = ["`"]
            autocmd FileType tex,html,markdown,rst setlocal shiftwidth=2 tabstop=2 softtabstop=2
            autocmd FileType tex nnoremap <buffer> <silent>	<Leader>ae	:call TexACClosePrev('n')<cr>
            autocmd FileType tex abbr „ \enquote{
            " autocmd FileType tex abbr “ }
            " Not needed, closed by auto-pairs.

            " Encourage a self review before writing the commit message by
            " moving the cursor to "On branch" to start from there.
            autocmd FileType gitcommit exe 5

            autocmd FileType gitcommit call matchadd('ColorColumn', '\%1l\%74v', 100)

            " autocmd FileType {c,cpp} autocmd BufWritePost <buffer> silent ! [ -e tags ] &&
                " \ ( awk -F'\t' '$2\!="%:gs/'/'\''/"{print}' tags ; ctags -f- '%:gs/'/'\''/' )
                " \ | sort -t$'\t' -k1,1 -o tags.new && mv tags.new tags

            " autocmd FileType sh autocmd BufWritePre * call TrimTrailingEmptyLines()


            " }}}

            autocmd QuickFixCmdPost make cwindow
            autocmd VimEnter * if &diff | execute 'windo set wrap' | endif

            " Always switch to the current file directory
            autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

            " autocmd BufEnter * if expand("%:p") =~# "/.unison/" | lcd | endif
            " Go to home for unison to use file completion easily.
        augroup END
    endif
endif

" }}}
