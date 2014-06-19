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

    " Hack to make mappings using the Alt or Meta key working {{{
    " http://stackoverflow.com/a/10216459/2239985
        " let c='a'
        " while c <= 'z'
            " exec "set <A-".c.">=\e".c
            " exec "inoremap \e".c." <A-".c.">"
            " let c = nr2char(1+char2nr(c))
        " endw

        " set timeout ttimeoutlen=50
        " " these two work in vim
        " " shrtcut with alt key: press Ctrl-v then Alt-k
        " " ATTENTION: the following two lines should not be
        " " edited under other editors like gedit. ^[k and ^[j will be broken!
        " nnoremap ^[k :set paste<CR>m`O<Esc>``:set nopaste<CR>
        " nnoremap ^[j :set paste<CR>m`o<Esc>``:set nopaste<CR>
    " }}}

    " Overwrite default Vim mappings {
        " Also open not existing files.
        noremap gf :sp <cfile><cR>

        " Wrapped lines goes down/up to next row, rather than next line in file.
        " Does this slow down the scrolling in my configuration?
        noremap j gj
        noremap k gk

        " Visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv

        " http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches#Highlight_matches_without_moving
        let g:highlighting = 0
        function! Highlighting()
          if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
            let g:highlighting = 0
            return ":silent nohlsearch\<CR>"
          endif
          let @/ = '\<'.expand('<cword>').'\>'
          let g:highlighting = 1
          return ":silent set hlsearch\<CR>"
        endfunction
        nnoremap <silent> <expr> <Space> Highlighting()
    " }

    " Map leader mappings {{{
        let mapleader = ','

        " Save and go to normal mode
        noremap <Leader>s :update<CR>
        inoremap <Leader>s <ESC>:update<CR>l

        " Filetype detact
        noremap <Leader>fd :filetype detect<CR>
        inoremap <Leader>fd <c-o>:filetype detect<CR>

        " Open my .vimrc
        noremap <Leader>ff :sp $MYVIMRC<CR>

        " Save and exit
        noremap <Leader>x :x<CR>
        inoremap <Leader>x <ESC>:x<CR>

        " Quick quit command
        noremap <Leader>e :quit<CR>
        " Quit all windows
        noremap <Leader>E :q!<CR>

        " Code folding options {{{
            " noremap <leader>f0 :set foldlevel=0<CR>
            " Use zM for this
            noremap <leader>f1 :set foldlevel=1<CR>
            noremap <leader>f2 :set foldlevel=2<CR>
            noremap <leader>f3 :set foldlevel=3<CR>
            noremap <leader>f4 :set foldlevel=4<CR>
            noremap <leader>f5 :set foldlevel=5<CR>
            noremap <leader>f6 :set foldlevel=6<CR>
            noremap <leader>f7 :set foldlevel=7<CR>
            noremap <leader>f8 :set foldlevel=8<CR>
            noremap <leader>f9 :set foldlevel=9<CR>
        " }}}

        " Toggle highlight search
        noremap <Leader>B :set invhlsearch<CR>
        inoremap <Leader>B <c-o>:set invhlsearch<CR>
        noremap <Leader>b :set nohlsearch<CR>
        inoremap <Leader>b <c-o>:set nohlsearch<CR>

        " let hlstate=0
        " let lastsearchstring = @/
        " noremap <Leader>b :call Togglehlsearch()<CR>

        " Bind set list
        noremap <Leader>l :set list!<CR>
        inoremap <Leader>l <c-o>:set list!<CR>

        " Insert current full path of the file
        inoremap <Leader>fp <ESC>:put =expand('%:p')<CR>kJA

        " Insert current file name
        " inoremap <Leader>fn <ESC>"%p<CR>g;
        " Just use Ctrl-r%

        " Spellcheck { set spellfile=~/.vim/spell/en.utf-8.add set dictionary+=/usr/share/dict/words
            set spelllang=en_us,de_de
            " set spelllang=en_us
            noremap <Leader>cd :set spell!<CR>
            inoremap <Leader>cd <c-o>:set spell!<CR>
        " }

        " Insert newline without entering insert mode
        noremap <Leader>Q O<Esc>
        noremap <Leader>q o<Esc>

        " easier moving between tabs
        " noremap <Leader>n <esc>:tabprevious<CR>
        " noremap <Leader>m <esc>:tabnext<CR>
        " Use the default gt and gT

        " easier moving between buffers
        noremap <Leader>w <esc>:bNext<CR>

        " set the executable bit
        noremap <Leader>y :w!<CR>:!chmod +x "%"<CR>:quit<CR>
        inoremap <Leader>y <ESC>:w!<CR>:!chmod +x "%"<CR>:quit<CR>

        " noremap <Leader>d :echo strftime("%Y-%m-%d_%H:%M")<CR>

        function! TranslateDateVisual()
            sil! norm! gv"ty
            echo system('date -d @'. @t)
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
    " }}}

    " Other mappings {{{
        set pastetoggle=<F2>           " pastetoggle (sane indentation on pastes)

        " Easier horizontal scrolling
        noremap zl zL
        noremap zh zH

        " Ctrl+a is used by tmux and screen
        noremap <c-s> <c-a>
        noremap <c-a> <Nop>
        " Don‘t use Ctrl+a even if not in tmux.

        " https://superuser.com/questions/277787/vim-map-a-key-combination-while-in-insert-mode
        " <c-tab> did not work.
        " noremap <Tab> :tabn<CR>
        " Does interfere with c-i ?
        " inoremap <Tab> <c-o>:tabn<CR>

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
        " Try to use Neo2 Escape.
        noremap! <c-c> <ESC>

        nnoremap <c-n> <c-]>
        nnoremap <c-m> <c-t>
    " }}}

    " Disabled (mostly because of incompatibilities {{{
        " The following two lines conflict with moving to top and
        " bottom of the screen
        " noremap <S-H> gT
        " noremap <S-L> gt

        " Unbind the cursor keys in insert, normal and visual modes.
        " Luckily I do not use them anymore because they are so far away.
        " But there are better ways to send those keycodes.
        " for prefix in ['i', 'n', 'v']
        "     for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        "         exe prefix . "noremap " . key . " <Nop>"
        "     endfor
        " endfor
    " }}}
" }

" Bundles and plugins {
    " let g:spf13_bundle_groups=['general', 'neocomplcache',
    " 'programming', 'ruby', 'python', 'perl', 'go', 'twig', 'javascript',
    " 'html', 'latex',
    " 'misc', 'scala', 'games']
    let g:spf13_bundle_groups = []
    call add(g:spf13_bundle_groups, 'dependencies')
    call add(g:spf13_bundle_groups, 'general_important')
    call add(g:spf13_bundle_groups, 'testing')
    call add(g:spf13_bundle_groups, 'general')
    call add(g:spf13_bundle_groups, 'work')
    call add(g:spf13_bundle_groups, 'programming')
    call add(g:spf13_bundle_groups, 'python')
    call add(g:spf13_bundle_groups, 'perl')
    call add(g:spf13_bundle_groups, 'javascript')
    call add(g:spf13_bundle_groups, 'snipmate')
    call add(g:spf13_bundle_groups, 'html')
    " call add(g:spf13_bundle_groups, 'latex')

    " Deps {
        if count(g:spf13_bundle_groups, 'dependencies')
            Bundle 'MarcWeber/vim-addon-mw-utils'
            Bundle 'tomtom/tlib_vim'
        endif
    " }

    " Work {
        if count(g:spf13_bundle_groups, 'work')
            Bundle 'hamcos/vim-hamcos'
        endif
    " }

    " Testing {{{
        if count(g:spf13_bundle_groups, 'testing')
            " Bundle 'terryma/vim-smooth-scroll'
            " noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
            " noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
            " noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
            " noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
        endif
    " }}}

    " General important {{{
    " Used multiple times *every* Vim session.
        if count(g:spf13_bundle_groups, 'general_important')
            " CtrlP {
                Bundle 'kien/ctrlp.vim'
                let g:ctrlp_show_hidden = 1
                let g:ctrlp_mruf_save_on_update = 0
                let g:ctrlp_extensions = ['line']
                let g:ctrlp_open_new_file = 'h'
                let g:ctrlp_mruf_max = 2000
                noremap <Leader>r :CtrlPMRUFiles<CR>
                " noremap <Leader>ff :CtrlPMRUFiles<CR>
            " }

            " Handling comments {{{
                " Bundle 'tomtom/tcomment_vim'
                " let g:tcommentOptions = {'strip_whitespace': 1}

                Bundle 'scrooloose/nerdcommenter'
                let NERDSpaceDelims = 1

                " noremap gcc :call NERDComment('n', 'Toggle')<CR>
                " noremap <Leader>d :call NERDComment('n', 'Toggle')<CR>
                map <Bar> :call NERDComment('n', 'Toggle')<CR>
            " }}}

        endif
    " }}}

    " General {
        if count(g:spf13_bundle_groups, 'general')
            " Bundle 'scrooloose/nerdtree'
            " map <Leader>v :NERDTreeToggle<CR>

            " Auto close opening characters like '(' with ')' {{{
                " Bundle 'spf13/vim-autoclose' " Too simple, no indent stuff
                " let g:AutoPairShortcutToggle = '<Leader>ac'
                " Bundle 'jiangmiao/auto-pairs' " Could not get inserting new closing brackets and jumping to existing brackets at once to work
                " let g:AutoPairsFlyMode = 1
                " noremap <silent> <Leader>ac :call AutoPairsToggle()<CR>
                " inoremap <silent> <Leader>ac <ESC>:call AutoPairsToggle()<CR>a
                Bundle 'Raimondi/delimitMate'
                let delimitMate_expand_cr = 1

                Bundle 'lfilho/cosco.vim'
                noremap <silent> <Leader>, :call cosco#commaOrSemiColon()<CR>
                inoremap <silent> <Leader>, <c-o>:call cosco#commaOrSemiColon()<CR>
                " Bundle 'oinksoft/endline.vim'
                " let g:EndlineInsertMapping = '<Leader>,'
            " }}}

            " Bundle 'vim-scripts/sessionman.vim'
            Bundle 'matchit.zip'
            " Extended matching with "%"

            " vim-bad-whitespace {
                Bundle 'bitc/vim-bad-whitespace'
                noremap <Leader>fc :EraseBadWhitespace<CR>
            " }

            Bundle 'tpope/vim-repeat'

            " Translate {
                if has("python") && executable('python')
                    Bundle 'ypid/lookup.vim'
                    " let g:lookup_dict_para = []
                    noremap <Leader>tr :Lookup<CR>
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

            Bundle 'sjl/gundo.vim'
            nnoremap <Leader>ga :GundoToggle<CR>

            " Bundle 'thanthese/Tortoise-Typing'
            " Bundle 'myusuf3/numbers.vim'

            " indent_guides {
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
                let g:indent_guides_enable_on_vim_startup = 1
            " }

            if !exists('g:spf13_no_views')
                Bundle 'vim-scripts/restore_view.vim'
            endif

            " Bundle 'tpope/vim-markdown'
            Bundle 'jtratner/vim-flavored-markdown'

            Bundle 'bronson/vim-visual-star-search'
        endif
    " }

    " General Programming {
        if count(g:spf13_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            " Bundle 'scrooloose/syntastic' " Too slow
            " Bundle 'vivien/vim-addon-linux-coding-style'
            Bundle 'tpope/vim-surround'

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

                " Bundle 'airblade/vim-gitgutter'
                " Show changes in working copy with plus sign, start of the line

                " Bundle 'tpope/vim-abolish.git'
                " Don’t really using it for now.
            " }}}

            Bundle 'powerman/vim-plugin-viewdoc'
            let g:manpageview_options_pl = ";-f;-q;-t;"

            " Tabularize {
                Bundle 'godlygeek/tabular'
                map <Leader>a& :Tabularize /&<CR>
                map <Leader>a= :Tabularize /=<CR>
                map <Leader>a: :Tabularize /:<CR>
                map <Leader>a:: :Tabularize /:\zs<CR>
                map <Leader>a, :Tabularize /,<CR>
                map <Leader>a/ :Tabularize /\zs\(\/\/\\|\/\*\)/<CR>
                map <Leader>a" :Tabularize /"<CR>
                map <Leader>a' :Tabularize /:\zs \+'/l0r0<CR>
                map <Leader>a# :Tabularize /#<CR>
                map <Leader>a<Space> :Tabularize /\s\+<CR>
                " http://stackoverflow.com/questions/10287919/use-vims-tabularize-plugin-to-only-match-the-first-occurance-of-a-delimiter
                map <Leader>af<Space> :Tabularize /^\s*\w*<CR>
                map <Leader>a<Bar> :Tabularize /[^\\]\zs<Bar><CR>
            " }

            " Toggle words
            Bundle 'toggle_words.vim'
            noremap <Leader>to :ToggleWord<CR>

            Bundle 'tpope/vim-endwise'

            " DetectIndent {{{
                " Bundle 'ciaranm/detectindent'
                Bundle 'ypid/detectindent'
                let g:detectindent_preferred_expandtab = 1
                let g:detectindent_preferred_indent    = 4
                let g:detectindent_min_indent          = 2
            " }}}

            " Ack {{{
                if executable('ack-grep')
                    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
                    Bundle 'mileszs/ack.vim'
                elseif executable('ack')
                    Bundle 'mileszs/ack.vim'
                elseif executable('ag')
                    let g:ackprg = 'ag --nogroup --nocolor --column'
                    Bundle 'mileszs/ack.vim'
                endif
            " }}}

            Bundle 'derekwyatt/vim-fswitch'
            nnoremap <Leader>h :FSSplitBelow<cr>

            " Highlight brackets
            Bundle 'kien/rainbow_parentheses.vim'
            nnoremap <Leader>R :RainbowParenthesesToggle<CR>

            if executable('ctags')
                Bundle 'majutsushi/tagbar'
                nnoremap <Leader>ft :TagbarToggle<cr>
            endif

            " Save and run {{{
                Bundle 'xuhdev/SingleCompile'
                let g:SingleCompile_alwayscompile = 0
                call SingleCompile#SetCompilerTemplate('mkd', 'markdown',
                            \ 'text-to-HTML conversion tool', 'markdown',
                            \ '> $(FILE_TITLE)$.html', 'true' )
                call SingleCompile#SetPriority('mkd', 'markdown', 50)

                call SingleCompile#ChooseCompiler('mkd', 'markdown')

                noremap <Leader>as :SCCompileRun<CR>
                inoremap <Leader>as <c-o>:SCCompileRun<CR>
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
            noremap <Leader>ti :call SyntaxAttr()<CR>

            Bundle 'SrchRplcHiGrp.vim'
        endif
    " }

    " Snippets & AutoComplete {
        if count(g:spf13_bundle_groups, 'snipmate')
            if has("python") && executable('python')
                " Needs to be before syntax on …
                Bundle 'SirVer/ultisnips'
                Bundle 'honza/vim-snippets'
                " let g:UltiSnipsListSnippets = "<Leader><tab>"
                noremap <Leader><tab> :call UltiSnips_ListSnippets()<cr>
            endif
        elseif count(g:spf13_bundle_groups, 'neocomplcache')
            Bundle 'Shougo/neocomplcache'
            Bundle 'Shougo/neosnippet'
           " OmniComplete {
                if has("autocmd") && exists("+omnifunc")
                    autocmd Filetype *if &omnifunc == " |setlocal omnifunc=syntaxcomplete#Complete |endif
                endif

                hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
                hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
                hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

                " Some convenient mappings
                inoremap <expr> <Esc>      pumvisible() ? "\<c-e>" : "\<Esc>"
                inoremap <expr> <CR>       pumvisible() ? "\<c-y>" : "\<CR>"
                inoremap <expr> <Down>     pumvisible() ? "\<c-n>" : "\<Down>"
                inoremap <expr> <Up>       pumvisible() ? "\<c-p>" : "\<Up>"
                inoremap <expr> <c-d>      pumvisible() ? "\<PageDown>\<c-p>\<c-n>" : "\<c-d>"
                inoremap <expr> <c-u>      pumvisible() ? "\<PageUp>\<c-p>\<c-n>" : "\<c-u>"

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
                inoremap <silent><expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<c-e>" : "\<TAB>")
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
                inoremap <c-l> <Plug>(neosnippet_expand_or_jump)
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
            inoremap <Leader>Y <Plug>inoremap_JumpForward
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
            " }

            " Bundle 'sukima/xmledit'

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
        " http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
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
    set tags=./tags;/                   " Look in all upper Directorys for tags files
    " Did not work. http://stackoverflow.com/a/741486

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

    " Bundle 'flazz/vim-colorschemes'
    " Bundle 'spf13/vim-colors'
    Bundle 'altercation/vim-colors-solarized'
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
        if count(g:spf13_bundle_groups, 'programming')
            set statusline+=%{fugitive#statusline()} " Git Hotness
        endif
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
            autocmd FileType vim setlocal expandtab shiftwidth=4
            autocmd FileType vim let b:delimitMate_quotes = "' `"
            autocmd FileType sh setlocal textwidth=0
            autocmd FileType perl setlocal expandtab shiftwidth=4
            autocmd FileType perl compiler perlcritic
            autocmd FileType python setlocal shiftwidth=4
            autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
            autocmd FileType python set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
            autocmd FileType python set efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#
            autocmd FileType mkd let b:delimitMate_nesting_quotes = ['`']
            autocmd FileType tex setlocal expandtab shiftwidth=2
            autocmd FileType c setlocal noexpandtab shiftwidth=4
            autocmd FileType html setlocal expandtab shiftwidth=2
            autocmd FileType html compiler tidy
            autocmd FileType xml setlocal foldmethod=indent
            " autocmd FileType xml setlocal foldmethod=syntax " does not work
            autocmd FileType gitcommit normal gg
        " }}}

        " autocmd VimEnter * RainbowParenthesesToggle " enable by defalut
        " autocmd Syntax * RainbowParenthesesLoadRound " default
        autocmd VimEnter,BufRead,BufNewFile * if exists(":RainbowParenthesesLoadSquare")|exe "RainbowParenthesesLoadSquare"|endif
        autocmd VimEnter,BufRead,BufNewFile * if exists(":RainbowParenthesesLoadBraces")|exe "RainbowParenthesesLoadBraces"|endif
        autocmd BufRead * if exists(":DetectIndent")|exe "DetectIndent"|endif
        " autocmd BufRead,BufNewFile * call SetIndentWidth()
        " autocmd BufWritePost * echo &ff
        autocmd QuickFixCmdPost make cwindow
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
