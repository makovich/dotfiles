scriptencoding utf-8

if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif


" Lightline
packadd lightline.vim

let g:lightline = {
\ 'enable': {
\   'tabline': 0,
\ },
\ 'colorscheme': 'monokai_pro',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename']],
\   'right': [['lineinfo'], ['linter_warnings'], ['linter_errors'], ['percent']],
\ },
\ 'inactive': {
\   'left': [['filename']],
\   'right': [],
\ },
\ 'component': {
\   'percent': '%2p%%',
\   'lineinfo': '%{LightlineFiletype()} ☰ %4l/%L :%-2v',
\ },
\ 'component_function': {
\   'mode': 'LightlineMode',
\   'filename': 'LightlineFilename',
\   'filetype': 'LightlineFiletype',
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\ },
\ }

function! LightlineModified()
  return &filetype =~? 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &filetype !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = winwidth(0) > 90 ? expand('%:p') : expand('%:t')
  return fname ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname =~# '__Tagbar__' ? g:lightline.fname :
        \ fname =~# '__Gundo\|NERD_tree' ? '' :
        \ fname =~# '__Scratch__' ? '[Notes]' :
        \ &buftype ==# 'quickfix' ? '' :
        \ fname ==# '[Plugins]' ? '' :
        \ &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ ('' !=# LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' !=# fname ? fname : '[No Name]') .
        \ ('' !=# LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~# '__Tagbar__' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname ==# '__Gundo__' ? 'Gundo' :
        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ fname ==# '[Plugins]' ? 'Plug' :
        \ &buftype ==# 'quickfix' ? 'QuickFix' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineLinterWarnings() abort
  let l:count = lsp#get_buffer_diagnostics_counts().warning
  return l:count == 0 ? '' : l:count
endfunction

function! LightlineLinterErrors() abort
  let l:count = lsp#get_buffer_diagnostics_counts().error
  return l:count == 0 ? '' : l:count
endfunction

colorscheme monokai_pro

" Leader
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" From INSERT to NORMAL
inoremap jj <Esc>
inoremap оо <Esc>

" Wrapped line is not the single one for motions
nmap j gj
nmap k gk

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
inoremap <C-w> <C-o>cb
imap     <C-j> <Cr>

" vim-sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" unbind auto-bound default s/S replacements
map <Plug>SwallowSneak_s <Plug>Sneak_s
map <Plug>SwallowSneak_S <Plug>Sneak_S

" incsearch
map  /       <Plug>(incsearch-forward)
map  ?       <Plug>(incsearch-stay)<C-R><C-W>
nmap <S-Tab> <Plug>(incsearch-stay)<C-R><C-W>

" qq - record macro `q`
" q  - quit recording
" leader+q  - play recorded
nnoremap <Leader>q @q
vnoremap <Leader>q :norm @q<CR>

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

" Previous buffer
nmap <Leader>; :e#<CR>

" Close the buffer, don't close the window (bufkill.vim)
nmap <Leader>Q :BD<CR>

" Shift-q closes the window
nmap Q :q!<CR>

" Write file
nmap <Leader>w :update<CR>

" Zoom (or only one opened window)
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
nmap <Leader>f :Fls!<CR>
nmap <Leader>o :Outline!<CR>
nmap <Leader>g :Rgp!<CR>
nmap <Leader>t :FZFTags!<CR>
nmap <M-/>     :Rg<Space><C-R>=expand("<cword>")<CR>

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

" Bookmarks
noremap 'D :Fls! ~/dotfiles<CR>
noremap 'M :Fls! ~/mem<CR>

" Poorman's Auto-save
" autocmd InsertLeave,CursorHold * update

filetype on
filetype plugin on
filetype indent on

set autoindent
set autoread
set autowrite
set background=dark
set backspace=2
set clipboard=unnamedplus
set completeopt=longest,menuone,noinsert
set concealcursor=niv
set conceallevel=0
set copyindent
set cursorline
set expandtab
set fillchars+=vert:│
set foldmethod=indent
set hidden
set nohlsearch
set incsearch
set infercase
set ignorecase
set laststatus=2
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
set noshowmode
set nowrap
set number
" set scrolloff=15
set selection=old
set shiftwidth=2
set shortmess+=c
set showbreak=
set showmatch
set signcolumn=yes
set softtabstop=2
set tabstop=2
set textwidth=0
set undodir=~/.vim/.undodir
set undofile
set updatetime=300
set visualbell t_vb=

augroup VimTune
  au!

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
  au filetype crontab setlocal nobackup nowritebackup

  " Allow tabs in shell scripts
  au filetype sh setlocal noexpandtab
augroup END

" vim-xkbswitch
if has('macunix')
  let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
  let g:XkbSwitchEnabled = 1
endif

" vim-markdown
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['html', 'css', 'xml', 'vim', 'lua', 'c', 'sh', 'rust']

" auto-pairs
" https://github.com/jiangmiao/auto-pairs/pull/266
let g:AutoPairsMapCh = 1
let g:AutoPairsShortcutJump = '<C-L>'
let g:AutoPairsShortcutFastWrap = '<C-S>'

" incsearch
let g:incsearch_cli_key_mappings = { '\<C-j>': '\<CR>' }

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

  let g:vsnip_snippet_dir = expand('~/.vim/vsnip')
  let g:vsnip_choice_delay = 1000
  let g:vsnip_sync_delay = 0

  let g:vsnip_integ_config = {
        \ 'asyncomplete': v:true
        \ }

  " imap <expr> <C-j> pumvisible() ? "\<C-n>"  : "\<C-j>"
  " imap <expr> <C-k> pumvisible() ? "\<C-p>"  : "\<C-k>"
  imap <expr> <Cr>  pumvisible() ? "\<Esc>a" : "\<Cr>"
  imap <C-n> <Plug>(asyncomplete_force_refresh)

  imap <expr> <Tab> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<Tab>"
  smap <expr> <Tab> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<Tab>"

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
  au BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
  au BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
  au BufWritePre *.rs call execute('LspDocumentFormatSync')
augroup END

" grep with ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --color=never

  " vim-ripgrep
  let g:rg_command = 'rg --vimgrep --hidden --glob "!rusty-tags.vi"'
endif

augroup Fzf
  au! FileType fzf

  let g:fzf_command_prefix = 'FZF'
  let g:fzf_layout = { 'down': '15' }

  function! GoToLine(delim, line)
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

  command! -bang -nargs=? -complete=dir Rgp
        \ call fzf#run(fzf#wrap({
        \     'source': 'rg --hidden --line-number --glob "!.git/" --glob "!rusty-tags.vi"' . ( len(<q-args>) == 0 ? " ." : " . " . shellescape(<q-args>) ),
        \     'sink': function('GoToLine', [':']),
        \     'options': ['--layout=reverse',
        \                 '--delimiter=:', '--nth=3',
        \                 '--color=16', '--inline-info', '--prompt=Rg> ',
        \                 '--cycle',
        \                 '--preview-window=right:65%:+{2}-/2',
        \                 '--preview=bat --style=numbers --color=always --highlight-line={2} {1}'] },
        \   <bang>0))

  command! -bang -nargs=? -complete=dir Fls
        \ call fzf#run(fzf#wrap({
        \     'source': 'fd --color=always --type=file --max-depth=40 --hidden --exclude=.git --follow' . ( len(<q-args>) == 0 ? " ." : " . " . shellescape(<q-args>) ),
        \     'options': ['--header= ', '--layout=reverse',
        \                 '--ansi', '--color=16', '--inline-info', '--prompt=',
        \                 '--cycle',
        \                 '--preview-window=right:65%',
        \                 '--preview=bat --style=numbers --color=always {1}'] },
        \   <bang>0))

  command! -bang Outline
        \ call fzf#run(fzf#wrap({
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
        \     'sink': function('GoToLine', ['\t']),
        \     'options': ['--layout=reverse', '--no-sort',
        \                 '--delimiter=\t', '--nth=3',
        \                 '--color=16', '--inline-info', '--prompt=Outline> ',
        \                 '--cycle',
        \                 '--preview-window=right:65%:hidden:+{1}-/2',
        \                 '--preview=bat --style=numbers --color=always --highlight-line={1} ' . expand('%:p')] },
        \   <bang>0))

  au  FileType fzf set laststatus=0 showtabline=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showtabline=1 showmode ruler
augroup END

augroup Lsp
  au!

  let g:lsp_virtual_text_enabled = 1
  let g:lsp_virtual_text_prefix = " ‣ "
  let g:lsp_highlights_enabled = 1
  let g:lsp_textprop_enabled = 1
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_diagnostics_float_cursor = 0
  let g:lsp_highlight_references_enabled = 1
  let g:lsp_preview_keep_focus = 1
  let g:lsp_diagnostics_signs_error = { 'text': '✕' }
  let g:lsp_diagnostics_signs_warning = { 'text': '！' }
  let g:lsp_diagnostics_signs_information = { 'text': 'ℹ' }
  let g:lsp_document_code_action_signs_enabled = 0

  au BufWritePre <buffer> LspDocumentFormatSync

  au User lsp_server_init nmap K  <plug>(lsp-hover)
  au User lsp_server_init nmap gD <plug>(lsp-definition)
  au User lsp_server_init nmap gR <plug>(lsp-references)
  au User lsp_server_init nmap gM <plug>(lsp-rename)
  au User lsp_server_init nmap gA <plug>(lsp-code-action)
  au User lsp_server_init nmap ]w <plug>(lsp-next-diagnostic)
  au User lsp_server_init nmap [w <plug>(lsp-previous-diagnostic)

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
