scriptencoding utf-8

if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
else
  " vim only fix: mode dependent cursor shape
  if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  endif
endif

" vim-xkbswitch
if has('macunix')
  let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
  let g:XkbSwitchEnabled = 1
endif

syntax on
colorscheme default

hi Normal                         ctermfg=231         ctermbg=NONE        cterm=NONE
hi Visual                         ctermfg=NONE        ctermbg=237         cterm=NONE

hi TabLineFill                    ctermfg=237         ctermbg=237
hi TabLine                        ctermfg=237         ctermbg=237
hi TabLineSel                     ctermfg=231         ctermbg=NONE

hi Cursor                         ctermfg=NONE        ctermbg=231         cterm=NONE
hi CursorLine                     ctermfg=NONE        ctermbg=233         cterm=NONE
hi CursorLineNR                   ctermfg=11          ctermbg=233         cterm=NONE
hi LineNr                         ctermfg=237         ctermbg=NONE        cterm=NONE
hi SignColumn                     ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi FoldColumn                     ctermfg=14          ctermbg=NONE        cterm=NONE
hi CursorColumn                   ctermfg=NONE        ctermbg=233         cterm=NONE
hi ColorColumn                    ctermfg=NONE        ctermbg=233         cterm=NONE
hi VertSplit                      ctermfg=242         ctermbg=NONE        cterm=NONE
hi MatchParen                     ctermfg=11          ctermbg=NONE        cterm=underline
hi StatusLine                     ctermfg=231         ctermbg=242         cterm=bold
hi StatusLineNC                   ctermfg=231         ctermbg=242         cterm=NONE
hi Pmenu                          ctermfg=NONE        ctermbg=235         cterm=NONE
hi PmenuSel                       ctermfg=NONE        ctermbg=59          cterm=NONE
hi IncSearch                      ctermfg=16          ctermbg=11          cterm=NONE
hi Search                         ctermfg=16          ctermbg=11          cterm=NONE
hi QuickFixLine                   ctermfg=NONE        ctermbg=233         cterm=NONE
hi Sneak                          ctermfg=11          ctermbg=NONE        cterm=underline
hi Folded                         ctermfg=242         ctermbg=235         cterm=NONE

hi SignError                      ctermfg=1           ctermbg=NONE        cterm=NONE
hi SignWarn                       ctermfg=214         ctermbg=NONE        cterm=NONE

hi ALEError                       ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi ALEWarning                     ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi ALEVirtualTextError            ctermfg=NONE        ctermbg=NONE        cterm=italic
hi ALEVirtualTextWarning          ctermfg=NONE        ctermbg=NONE        cterm=italic
hi link ALEErrorSign              SignError
hi link ALEWarningSign            SignWarn

hi link LspReference              MatchParen
hi link LspErrorHighlight         SignError
hi link LspErrorLine              ALEVirtualTextError
hi link LspErrorText              ALEErrorSign
hi link LspWarningHighlight       SignWarn
hi link LspWarningLine            ALEVirtualTextWarning
hi link LspWarningText            ALEWarningSign

hi DiffAdd                        ctermfg=231         ctermbg=28          cterm=NONE
hi DiffDelete                     ctermfg=231         ctermbg=52          cterm=NONE
hi DiffChange                     ctermfg=231         ctermbg=NONE        cterm=NONE
hi DiffText                       ctermfg=231         ctermbg=166         cterm=NONE

hi Boolean                        ctermfg=141         ctermbg=NONE        cterm=NONE
hi Character                      ctermfg=141         ctermbg=NONE        cterm=NONE
hi Comment                        ctermfg=242         ctermbg=NONE        cterm=italic
hi SpecialComment                 ctermfg=237         ctermbg=NONE        cterm=italic
hi Directory                      ctermfg=141         ctermbg=NONE        cterm=NONE
hi Conditional                    ctermfg=204         ctermbg=NONE        cterm=NONE
hi Constant                       ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Define                         ctermfg=204         ctermbg=NONE        cterm=NONE
hi ErrorMsg                       ctermfg=231         ctermbg=204         cterm=NONE
hi WarningMsg                     ctermfg=231         ctermbg=204         cterm=NONE
hi Float                          ctermfg=141         ctermbg=NONE        cterm=NONE
hi Function                       ctermfg=81          ctermbg=NONE        cterm=NONE
hi Identifier                     ctermfg=81          ctermbg=NONE        cterm=NONE
hi Keyword                        ctermfg=204         ctermbg=NONE        cterm=NONE
hi Label                          ctermfg=204         ctermbg=NONE        cterm=NONE
hi NonText                        ctermfg=59          ctermbg=NONE        cterm=NONE
hi Number                         ctermfg=141         ctermbg=NONE        cterm=NONE
hi Operator                       ctermfg=204         ctermbg=NONE        cterm=NONE
hi PreProc                        ctermfg=155         ctermbg=NONE        cterm=NONE
hi Special                        ctermfg=81          ctermbg=NONE        cterm=NONE
hi SpecialKey                     ctermfg=59          ctermbg=NONE        cterm=NONE
hi Statement                      ctermfg=204         ctermbg=NONE        cterm=NONE
hi StorageClass                   ctermfg=81          ctermbg=NONE        cterm=NONE
hi String                         ctermfg=221         ctermbg=NONE        cterm=NONE
hi Tag                            ctermfg=204         ctermbg=NONE        cterm=NONE
hi Title                          ctermfg=255         ctermbg=NONE        cterm=bold
hi Todo                           ctermfg=11          ctermbg=NONE        cterm=NONE
hi Type                           ctermfg=81          ctermbg=NONE        cterm=NONE
hi Underlined                     ctermfg=NONE        ctermbg=NONE        cterm=underline

"hi WhiteSpaceBol                  ctermfg=237         ctermbg=NONE        cterm=NONE
"hi WhiteSpaceMol                  ctermfg=0           ctermbg=NONE        cterm=NONE
"match WhiteSpaceMol / /
"2match WhiteSpaceBol /^ \+/

hi def VimwikiHeader1             ctermfg=252                             cterm=bold
hi def VimwikiHeader2             ctermfg=249                             cterm=bold
hi def VimwikiHeader3             ctermfg=246                             cterm=bold
hi def VimwikiHeader4             ctermfg=243                             cterm=bold
hi def VimwikiHeader5             ctermfg=240                             cterm=bold
hi def VimwikiHeader6             ctermfg=237                             cterm=bold

" Dependencies:
" - https://github.com/universal-ctags/ctags
" - https://github.com/dan-t/rusty-tags
" - https://github.com/lotabout/skim
" - https://github.com/BurntSushi/ripgrep
" - https://github.com/sharkdp/fd
" - https://github.com/sharkdp/bat

" :GetPlugs
let s:repos = "
  \ https://github.com/prabirshrestha/asyncomplete-file.vim
  \ https://github.com/prabirshrestha/asyncomplete-lsp.vim
  \ https://github.com/yami-beta/asyncomplete-omni.vim
  \ https://github.com/prabirshrestha/asyncomplete.vim
  \ https://github.com/jiangmiao/auto-pairs
  \ https://github.com/bakpakin/fennel.vim
  \ https://github.com/rafamadriz/friendly-snippets
  \ https://github.com/haya14busa/incsearch.vim
  \ https://github.com/lotabout/skim
  \ https://github.com/tweekmonster/startuptime.vim
  \ https://github.com/wellle/targets.vim
  \ https://github.com/tpope/vim-commentary
  \ https://github.com/prabirshrestha/vim-lsp
  \ https://github.com/mattn/vim-lsp-settings
  \ https://github.com/tpope/vim-repeat
  \ https://github.com/justinmk/vim-sneak
  \ https://github.com/tpope/vim-surround
  \ https://github.com/tpope/vim-unimpaired
  \ https://github.com/tpope/vim-vinegar
  \ https://github.com/hrsh7th/vim-vsnip
  \ https://github.com/hrsh7th/vim-vsnip-integ
  \ https://github.com/lyokha/vim-xkbswitch
  \ "

packloadall

filetype on
filetype plugin on
filetype indent on

set autoindent
set autoread
set autowrite
set backspace=2
set clipboard=unnamedplus
set completeopt=longest,menuone,noinsert
set concealcursor=niv
set conceallevel=0
set copyindent
set cursorline
set display-=msgsep
set expandtab
set fillchars+=vert:│
set foldmethod=indent
set hidden
set nohlsearch
set incsearch
set infercase
set ignorecase
set laststatus=0
set list
set listchars=tab:·\ ,trail:•
" set listchars+=eol:¬,tab:→\ ,trail:·,extends:>,precedes:<
set matchtime=2
set modelines=0
set nomodeline
set mouse=nia
set mousemodel=popup
set nobackup
set nofoldenable
set nowrap
set number
set ruler
set rulerformat=%30(%)
set rulerformat+=%#LineNr#
set rulerformat+=%M\ %<%y
set rulerformat+=%=
set rulerformat+=\ %#SignWarn#%{LspDiag('warning')}
set rulerformat+=\ %#SignError#%{LspDiag('error')}
set rulerformat+=%#LineNr#
set rulerformat+=\ \ %l/%L\ :%c
" set scrolloff=15
set selection=old
set shiftwidth=2
set shortmess+=cI
set showbreak=
set showmatch
set showmode
set showtabline=0
set signcolumn=yes
set softtabstop=2
set statusline=%#CursorLineNr#%p%%%=%m\ %r\ %h\ %F
set tabstop=2
set textwidth=0
set undodir=~/.vim/.undodir
set undofile
set updatetime=300
set visualbell t_vb=

" Leader
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" From INSERT to NORMAL
inoremap jj <Esc>
inoremap оо <Esc>

" Wrapped line is not the single one
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Window sliding
noremap <C-j> <C-y>
noremap <C-k> <C-e>

" Hardmode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Take it easy
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-h> <Left>
inoremap <M-l> <Right>
inoremap <M-H> <C-o>B
inoremap <M-L> <C-o>W
" ru equivalent
inoremap <M-л> <Up>
inoremap <M-о> <Down>
inoremap <M-р> <Left>
inoremap <M-д> <Right>
inoremap <M-р> <C-o>B
inoremap <M-д> <C-o>W

" Who's saying emacs?!
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-d> <C-o>x
imap     <C-j> <Cr>

" Display full path to the file
noremap <C-G> 1<C-G>

" vim-sneak
if exists('g:loaded_sneak_plugin')
  map f <Plug>Sneak_f
  map F <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T
  " unbind auto-bound default s/S replacements
  nunmap s
  nunmap S
  vunmap s
  " nmap <Plug>SwallowSneak_s <Plug>Sneak_s
  " nmap <Plug>SwallowSneak_S <Plug>Sneak_S
endif

" incsearch
if exists('g:loaded_incsearch')
  map  /       <Plug>(incsearch-forward)
  map  ?       <Plug>(incsearch-stay)<C-R><C-W>
  nmap <S-Tab> <Plug>(incsearch-stay)<C-R><C-W>
  let g:incsearch_cli_key_mappings = {
        \   "\<C-n>": { 'key': '<Over>(buffer-complete)', 'noremap': 1 },
        \   "\<C-p>": { 'key': '<Over>(buffer-complete-prev)', 'noremap': 1 },
        \   "\<C-j>": "\<CR>",
        \ }
endif

" qq - record macro `q`
" q  - quit recording
" Q  - play recorded
nnoremap Q @q
vnoremap Q :norm @q<CR>

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

" Previous buffer
nmap <Leader>; <C-^>

" Select buffer by single number
" nnoremap <silent> <Leader>: :buffers<CR>:silent exec "buffer " . nr2char(getchar())<CR>

" Shift-q closes the buffer or window if it's the last one
nmap <expr> <Leader>q len(getbufinfo({'buflisted':1})) == 1 ? ':q!<CR>' : ':bd!<CR>'

" Write file
nmap <Leader>w :update<CR><C-G>
nmap <Leader><Space> :update<CR><C-G>

" Zoom (or leave the single opened window)
nmap <Leader>z <C-w>o

" Split horizontally
nmap <Leader>s <C-w>s
nmap <Leader>_ <C-w>s

" Split vertically
nmap <Leader>v <C-w>v
nmap <Leader><Bar> <C-w>v

" One hand mode
nmap <Leader>j <C-w><C-w>
nmap <Leader>k <C-w>W

" Lookups
nmap <Leader>: :Bufs<CR>
nmap <Leader>f :Fls<CR>
nmap <Leader>o :Otln<CR>
nmap <Leader>g :Rgp<CR>
nmap <Leader>/ :silent Grep<Space><C-R>=expand("<cword>")<CR>

" Move block in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap > >gv
vnoremap < <gv

" Tags navigation
nmap <M-]> mO:exec "ltag " . expand("<cword>")<CR>:lopen<CR>
nmap <M-t> :lclose<CR>:silent! exec '20pop'<CR>:normal! `O<CR>
nmap gt <M-]>

" VSCode-like comment (Ctrl+/)
nmap <C-_> :Commentary<CR>
vmap <C-_> :Commentary<CR>
imap <C-_> <Esc>:Commentary<CR>i

augroup VimTune
  au!

  " Poorman's Auto-save
  " au InsertLeave,CursorHold * update

  " Unset paste on InsertLeave
  au InsertLeave * silent! set nopaste

  " Hide line selection when window has no focus
  au VimEnter * setlocal cursorline
  au WinEnter * if &diff | setlocal nocursorline | else | setlocal cursorline | endif
  au BufWinEnter * if &diff | setlocal nocursorline | else | setlocal cursorline | endif
  au WinLeave * setlocal nocursorline

  " Resize panes when window/terminal gets resize
  au VimResized * :wincmd =

  " Jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal! g'\"" | endif

  " Show line numbers for QuickFix
  au FileType qf setlocal number nolist

  " Quickview open & move through matches
  au FileType qf nmap <buffer> <silent> j j<CR><C-w>p
  au FileType qf nmap <buffer> <silent> k k<CR><C-w>p
  au FileType qf nmap <buffer> <silent> <C-O> :close<CR>:normal! `O<CR>

  " Allow save crontabs
  au FileType crontab setlocal nobackup nowritebackup

  " Allow tabs in shell scripts
  au FileType sh setlocal noexpandtab
augroup END

" vim-markdown
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['html', 'css', 'xml', 'vim', 'lua', 'c', 'sh', 'rust']

" auto-pairs
" https://github.com/jiangmiao/auto-pairs/pull/266
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let g:AutoPairsMapCh = 1
" let g:AutoPairsShortcutJump = '<C-L>'
let g:AutoPairsShortcutFastWrap = '<C-L>'

" asyncomplete.vim
augroup Completions
  au!

  function! s:sort_by_priority_preprocessor(options, matches) abort
    let l:items = []
    for [l:source_name, l:matches] in items(a:matches)
      for l:item in l:matches['items']
        if stridx(l:item['word'], a:options['base']) == 0
          let l:item['priority'] = get(asyncomplete#get_source_info(l:source_name),'priority',0)
          call add(l:items, l:item)
        endif
      endfor
    endfor

    let l:items = sort(l:items, {a, b -> b['priority'] - a['priority']})

    call asyncomplete#preprocess_complete(a:options, l:items)
  endfunction

  let g:asyncomplete_preprocessor = [function('s:sort_by_priority_preprocessor')]
  let g:asyncomplete_remove_duplicates = 0
  let g:asyncomplete_smart_completion = 0
  let g:asyncomplete_auto_popup = 1
  let g:asyncomplete_buffer_clear_cache = 1

  " let g:vsnip_snippet_dirs = ['~/vim/vsnip', '~/.vim/pack/plugins/start/friendly-snippets/snippets',  ]

  let g:vsnip_choice_delay = 1000
  let g:vsnip_sync_delay = 0

  let g:vsnip_integ_config = {
        \ 'asyncomplete': v:true
        \ }

  " imap <expr> <C-j> pumvisible() ? "\<C-n>"  : "\<C-j>"
  " imap <expr> <C-k> pumvisible() ? "\<C-p>"  : "\<C-k>"
  if exists('g:asyncomplete_loaded')
    imap <expr> <Cr>  pumvisible() ? "\<Esc>a" : "\<Cr>"
    imap <C-n> <Plug>(asyncomplete_force_refresh)
  endif

  if exists('g:loaded_vsnip')
    imap <expr> <Tab> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<Tab>"
    smap <expr> <Tab> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<Tab>"
  endif

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'whitelist': ['*'],
        \ 'priority': 2,
        \ 'completor': function('asyncomplete#sources#file#completor')
        \ }))

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \ 'name': 'omni',
        \ 'whitelist': ['*'],
        \ 'blacklist': ['c', 'cpp', 'html'],
        \ 'refresh_pattern': '\(\k\+$\|\.$\|:$\)',
        \ 'priority': 4,
        \ 'completor': function('asyncomplete#sources#omni#completor')
        \  }))
augroup END

augroup Rust
  au!

  " Set tags source for Rust
  au BufRead *.rs :setlocal tags=./.rusty-tags.vi;/,$RUST_SRC_PATH/.rusty-tags.vi
  au BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --output=.rusty-tags.vi --start-dir=" . expand('%:p:h') . "&" | redraw!
  au BufWritePre *.rs call execute('LspDocumentFormatSync')

  " Single quote is a lifetime - turning it off
  au FileType rust let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"', '`':'`', '<':'>'}
augroup END

augroup Golang
  au!
  au FileType go setlocal tabstop=4 noexpandtab
augroup END

" grep with ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --hidden\ --no-heading\ --smart-case\ --glob=!.git/\ --glob=!.rusty-tags.vi
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  command! -nargs=+ Grep grep <args> | cwindow

  " vim-ripgrep
  let g:rg_command = 'rg --vimgrep --hidden --glob=!.git/ --glob=!.rusty-tags.vi'
endif

augroup Skim
  au! FileType skim

  function! s:GoToLine(delim, line)
    if a:delim ==# ':'
      let l:match = split(a:line, a:delim)
      let l:filename = l:match[0]
      let l:line_no = l:match[1]
      exec 'edit +' . l:line_no . ' ' . l:filename
    else
      let l:line_no = split(a:line, a:delim)[0]
      exec ':' . line_no
    end
  endf

  function! s:ListBufs()
    redir =>output
    silent buffers
    redir END
    return split(output, "\n")
  endf

  function! s:BufsHandle(lines)
    let l:key = a:lines[0]
    if l:key == 'ctrl-x'
      let l:idxs = join(map(a:lines[1:], 'split(v:val)[0]'))
      exec 'bdelete ' . l:idxs
      exec 'Bufs'
    else
      exec 'buffer ' . split(a:lines[1])[0]
    endif
  endf

  function! s:OpenUp(mode, lines)
    let l:qry = get(a:lines, 0, '')
    let l:key = get(a:lines, 1, '')
    let l:sel = get(a:lines, 2, '')

    let l:carousel = {
          \ 'Fls':  'Rgp',
          \ 'Rgp':  'Otln',
          \ 'Otln': 'Bufs',
          \ 'Bufs': 'Fls' }

    if l:key == 'tab'
      exec ':' . get(l:carousel, a:mode, 'Fls') . ' ' . l:qry
    elseif len(l:sel) == 0
      exec 'edit ' . trim(l:qry, "'", 1)
    elseif a:mode == 'Fls'
      exec 'edit ' . l:sel
    elseif a:mode == 'Rgp'
      call s:GoToLine(':', l:sel)
    elseif a:mode == 'Otln'
      call s:GoToLine('\t', l:sel)
    elseif a:mode == 'Bufs'
      call s:BufsHandle(a:lines[1:])
    endif
  endf

  au FileType skim set noshowmode noruler | au BufLeave <buffer> set showmode ruler

  command! -nargs=? Bufs
        \ call skim#run({
        \     'source': s:ListBufs(),
        \     'sink*': function('s:OpenUp', ['Bufs']),
        \     'options': ['--header= ', '--layout=reverse',
        \                 '--ansi', '--color=16', '--inline-info', '--prompt=Bufs> ',
        \                 '--cycle',
        \                 '--query=' . <q-args>,
        \                 '--multi', '--bind=space:toggle+down',
        \                 '--print-query', '--expect=ctrl-x,tab',
        \                 '--delimiter="', '--nth=2',
        \                 '--preview-window=right:65%',
        \                 '--preview=bat --style=numbers --color=always {2}'] })

  command! -nargs=? Fls
        \ call skim#run({
        \     'source': 'fd --color=always --type=file --max-depth=40 --hidden --exclude=.git --exclude=.rusty-tags.vi --follow .',
        \     'sink*': function('s:OpenUp', ['Fls']),
        \     'options': ['--header= ', '--layout=reverse',
        \                 '--ansi', '--color=16', '--inline-info', '--prompt=Fls> ',
        \                 '--cycle',
        \                 '--expect=tab',
        \                 '--print-query',
        \                 '--query=' . <q-args>,
        \                 '--preview-window=right:65%',
        \                 '--preview=bat --style=numbers --color=always {1}'] })

  command! -nargs=? Rgp
        \ call skim#run({
        \     'source': 'rg --color=always --line-number --hidden --glob !.git/ --glob !.rusty-tags.vi .',
        \     'sink*': function('s:OpenUp', ['Rgp']),
        \     'options': ['--header= ', '--layout=reverse',
        \                 '--delimiter=:', '--nth=3..',
        \                 '--color=16', '--inline-info', '--prompt=Rgp> ',
        \                 '--cycle',
        \                 '--expect=tab',
        \                 '--print-query',
        \                 '--query=' . <q-args>,
        \                 '--preview-window=right:65%:+{2}-/2',
        \                 '--preview=bat --style=numbers --color=always --highlight-line={2} {1}'] })

  command! -nargs=? Otln
        \ call skim#run({
        \     'source': "ctags -f - --sort=foldcase --file-scope=no --all-kinds=* --fields=Kn " . expand('%:p') .
        \               ' | grep -F "/;\""'.
        \               " | awk -F $'\t' ".
        \               "'".
        \               '   BEGIN { OFS=FS }'.
        \               '         {'.
        \               '           gsub(/implementation/, "impl", $4);'.
        \               '           gsub(/\/\^[ ]*/, "", $3);'.
        \               '           gsub(/[; {]*\$\/;"$/, "", $3);'.
        \               '           gsub(/line:/, "", $5);'.
        \               '           printf "%d\t%12s  %-31s\t%s\n", $5, $4, $1, $3;'.
        \               "         }'".
        \               " | sort -bk2,2",
        \     'sink*': function('s:OpenUp', ['Otln']),
        \     'options': ['--header= ', '--layout=reverse',
        \                 '--no-sort',
        \                 '--query=' . <q-args>,
        \                 '--expect=tab',
        \                 '--print-query',
        \                 '--delimiter=\t', '--nth=3',
        \                 '--color=16', '--inline-info', '--prompt=Otln> ',
        \                 '--cycle',
        \                 '--preview-window=right:65%:hidden:+{1}-/2',
        \                 '--preview=bat --style=numbers --color=always --highlight-line={1} ' . expand('%:p')] })
augroup END

augroup Lsp
  au!

  function! LspDiag(kind)
    if exists("g:lsp_loaded")
      return get(filter(lsp#get_buffer_diagnostics_counts(), 'v:val'), a:kind, '')
    endif
    return ''
  endfunction

  let g:lsp_document_code_action_signs_enabled = 0
  let g:lsp_diagnostics_virtual_text_enabled = 0
  let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
  let g:lsp_semantic_enabled = 1
  let g:lsp_textprop_enabled = 1
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 0
  let g:lsp_diagnostics_echo_delay = 200
  let g:lsp_diagnostics_float_cursor = 0
  let g:lsp_highlight_references_enabled = 1
  let g:lsp_preview_keep_focus = 1
  let g:lsp_diagnostics_signs_error = { 'text': '✕' }
  let g:lsp_diagnostics_signs_warning = { 'text': '！' }
  let g:lsp_diagnostics_signs_information = { 'text': '→' }
  let g:lsp_diagnostics_signs_hint = { 'text': '→' }

  au BufWritePre <buffer> LspDocumentFormatSync

  au User lsp_server_init nmap K         <plug>(lsp-hover)
  au User lsp_server_init nmap gD        <plug>(lsp-definition)
  au User lsp_server_init nmap gR        <plug>(lsp-references)
  au User lsp_server_init nmap gM        <plug>(lsp-rename)
  au User lsp_server_init nmap <Leader>a <plug>(lsp-code-action)
  au User lsp_server_init vmap <Leader>a '<,'><plug>(lsp-code-action)
  au User lsp_server_init nmap ]w        <plug>(lsp-next-diagnostic)
  au User lsp_server_init nmap [w        <plug>(lsp-previous-diagnostic)

"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rls']},
"         \ 'whitelist': ['rust'],
"         \ })

"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'vim-language-server',
"         \ 'cmd': {server_info->['vim-language-server', '--stdio']},
"         \ 'whitelist': ['vim'],
"         \ })
augroup END

augroup Targets
  au!
  autocmd User targets#mappings#user call targets#mappings#extend({
        \ 'a': {'argument': [{'o': '[<([]', 'c': '[])>]', 's': ','}]},
        \ })
augroup END

function! s:GetPlugs(upgrade)
  let l:plugs_dir = $HOME . '/.vim/pack/plugins/all/'
  let l:start_dir = $HOME . '/.vim/pack/plugins/start'

  call system('mkdir -p ' . l:plugs_dir . ' ' . l:start_dir)

  for l:repo in split(s:repos)
    let l:plug_name = split(l:repo,'\/')[-1]
    let l:dest = l:plugs_dir . l:plug_name

    if empty(glob(l:dest))
      echo '>> Clone: ' . l:dest
      echo system('git clone --depth 1 ' . shellescape(l:repo) . ' ' . l:dest)
      echo system('ln -vs ../all/' . l:plug_name . ' ' . l:start_dir)
    elseif a:upgrade
      echo '>> Pull: ' . l:dest
      echo system('git -C ' . shellescape(l:dest) . ' pull --rebase --verbose')
    else
      echo '>> Skip: ' . l:dest
    end
  endfor
endfunction

command! -bang GetPlugs call s:GetPlugs(<bang>0)
