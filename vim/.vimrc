scriptencoding utf-8

if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif

call plug#begin('~/.vim/plugged')

" Plug 'tweekmonster/startuptime.vim'             " :StartupTime ~/foo.vim 100

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'                        " netrw: -, ~, ./!, y., gh
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'qpkorr/vim-bufkill'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'                       " yssb, ysiw{, cs(', ds[, cs'<q>, cst'
Plug 'wellle/targets.vim'                       " Pair (ci(, da[, dinb), Separator (i., A;), Argument (cia, daa), Quote (cib, di', cinq), Tag (it)
Plug 'justinmk/vim-sneak'                       " f-motion on steroids


Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'jremmen/vim-ripgrep'                      " grep word under the cursor <leader>g / <leader>G

" ide
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

Plug 'Shougo/neosnippet.vim'
" Plug 'honza/vim-snippets'                     " install but don't load; below it's added to the runtime path

Plug 'prabirshrestha/asyncomplete.vim', { 'tag': 'v1.7' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
" Plug 'prabirshrestha/asyncomplete-tags.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" rust
Plug 'racer-rust/vim-racer'
" Plug 'rhysd/rust-doc.vim'

" scratchpad
Plug 'metakirby5/codi.vim'

" writer mode
Plug 'junegunn/goyo.vim'  ", { 'for': ['markdown'] }

" vim lang
Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'

" lua
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'

call plug#end()

let g:lua_check_syntax = 0
let g:lua_check_globals = 0
let g:lua_complete_omni = 1

" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:loaded_python_provider = 1

colorscheme monokai_pro

nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" From INSERT to NORMAL
inoremap jj <Esc>

" Wrapped line is not the single one for motions
nmap j gj
nmap k gk

" vim-sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" unbind default s/S replacements
map <Plug>SwallowSneak_s <Plug>Sneak_s
map <Plug>SwallowSneak_S <Plug>Sneak_S

" qq - record macro
" q  - quit recording
" Q  - play recorded
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

" Previous buffer
nmap <Leader><Space> :e#<CR>

" Close the buffer, don't close the window (bufkill.vim)
nmap <Leader>Q :BD<CR>

" Space-q close the window
nmap <Leader>q <C-w><C-q>

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

" Move block in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
" silent! set mouse=nvc
set nobackup
set nofoldenable
set noshowmode
set nowrap
set number
set scrolloff=15
set shiftwidth=2
set shortmess+=c
set showbreak=
set showmatch
set signcolumn=yes
set softtabstop=2
set tabstop=2
set textwidth=0
set updatetime=300
set visualbell t_vb=

" Hardmode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Mode dependent cursor shape
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" https://unix.stackexchange.com/questions/433273/changing-cursor-style-based-on-mode-in-both-zsh-and-vim
" p.s.: looks like with auto-pairs plugin this makes things worst
" autocmd VimEnter * silent exec "! echo -ne '\e[1 q\n'"
" autocmd VimLeave * silent exec "! echo -ne '\e[5 qbye'"

" Poorman's Auto-save
" autocmd InsertLeave,CursorHold * update
nmap <Leader>w :update<CR>

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
  au FileType qf nmap <buffer> <silent> p <CR><C-w>p
  au FileType qf nmap <buffer> <silent> J j<CR><C-w>p
  au FileType qf nmap <buffer> <silent> K k<CR><C-w>p
  au FileType qf nmap <buffer> <silent> <C-N> j<CR><C-w>p
  au FileType qf nmap <buffer> <silent> <C-P> k<CR><C-w>p

  au FileType GV nmap <buffer> <silent> J jo
  au FileType GV nmap <buffer> <silent> K ko

  " Allow save crontabs
  au filetype crontab setlocal nobackup nowritebackup
augroup END

" auto-pairs https://github.com/jiangmiao/auto-pairs/pull/266
inoremap <buffer> <silent> <M-E> <C-R>=AutoPairsFastWrap("E")<CR>
inoremap <buffer> <silent> <M-$> <C-R>=AutoPairsFastWrap("$")<CR>

" asyncomplete.vim
let g:asyncomplete_remove_duplicates = 0
let g:asyncomplete_smart_completion = 0
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_buffer_clear_cache = 1

imap <expr><C-n> pumvisible() ? "\<C-n>" : "\<Plug>(asyncomplete_force_refresh)"
smap <expr><C-n> pumvisible() ? "\<C-n>" : "\<Plug>(asyncomplete_force_refresh)"
inoremap <expr><CR> pumvisible() ? "\<ESC>o" : "\<CR>"

call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'priority': 3,
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 2,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['c', 'cpp', 'html'],
    \ 'refresh_pattern': '\(\k\+$\|\.$\|:$\)',
    \ 'priority': 4,
    \ 'completor': function('asyncomplete#sources#omni#completor')
    \  }))

call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'priority': 5,
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))

" vim-racer
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

augroup Rust
  au!

  " Set tags source for Rust
  au BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
  au BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

  au FileType rust nmap gd <Plug>(rust-def)
  au FileType rust nmap K <plug>(ale_hover)
augroup END

" VSCode-like comment
nmap <C-_> :Commentary<CR>
vmap <C-_> :Commentary<CR>
imap <C-_> <Esc>:Commentary<CR>i

" spell (replace misspelled with first alternative suggestion)
imap <C-F> <C-G>u<Esc>[s1z=`]a<C-G>u

" neosnippets
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory = [ '~/.vim/plugged/vim-snippets/snippets', '~/.vim/snippets' ]

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Zen mode
nmap \z mt:Goyo<CR>'tzz

let g:goyo_height=100
let g:goyo_width=100

function! s:goyo_enter()
  set signcolumn=no
  set noshowmode
  set noshowcmd
  set wrap
  hi! Normal       ctermbg=233
  hi! VertSplit    ctermbg=233 ctermfg=233
  hi! StatusLine   ctermbg=233 ctermfg=233
  hi! StatusLineNC ctermbg=233 ctermfg=233
  hi! EndOfBuffer  ctermbg=233 ctermfg=233
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  hi! EndOfBuffer  ctermbg=0 ctermfg=0
  hi! StatusLineNC ctermbg=0 ctermfg=NONE
  hi! StatusLine   ctermbg=0 ctermfg=0
  hi! VertSplit    ctermbg=0 ctermfg=233
  hi! Normal       ctermbg=0
  set nowrap
  set showcmd
  set showmode
  set signcolumn=auto
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

augroup Goyo
  au!
  au User GoyoEnter nested call <SID>goyo_enter()
  au User GoyoLeave nested call <SID>goyo_leave()
augroup END

" grep with ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --color=never

  " Additionally ignore Rust tags file
  let g:rg_command = 'rg --vimgrep --glob "!rusty-tags.vi"'

"   let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"   let g:ctrlp_use_caching = 0
endif

" Find in files for the word under the cursor in the current directory
" nmap \f mO:call AckRun(expand('<cword>'))<CR>
" FIXME: vim-grepper has to make shellescape(a:txt, 1)
" or swith to grepper
nmap <Leader>g mO:Rg <cword><CR>
nmap <Leader>G :cclose<CR>:'O<CR>

" fzf
let g:fzf_command_prefix = 'FZF'
let g:fzf_layout = { 'down': '15' }
let g:fzf_mru_exclude = '.*fugitiveblame'

nmap <C-P> :Fls<CR>
nmap <Leader>p :FZFMru<CR>
nmap <Leader>f :Rgp!<CR>
nmap <Leader>F :Fls! ~/
nmap <Leader>o :Outline!<CR>

command! -bang -nargs=? -complete=dir Rgp
    \ call fzf#run(fzf#wrap('GrepPreview', {
    \     'source': 'rg --hidden --line-number --glob "!.git/" --glob "!rusty-tags.vi"' . ( len(<q-args>) == 0 ? " ." : " . " . shellescape(<q-args>) ),
    \     'sink': function('GoToLine', [':']),
    \     'options': ['--layout=reverse',
    \                 '--delimiter=:', '--nth=3',
    \                 '--color=16', '--inline-info', '--prompt=Rg> ',
    \                 '--cycle', '--bind=alt-h:toggle-preview',
    \                 '--preview-window=right:65%:hidden',
    \                 '--preview=bat --style=numbers --color=always --line-range={2}: {1}'] },
    \   <bang>0))

command! -bang -nargs=? -complete=dir Fls
    \ call fzf#run(fzf#wrap('CtrlP',
    \   fzf#vim#with_preview({
    \     'source': 'fd --type=file --max-depth=40 --hidden --exclude=.git --follow' . ( len(<q-args>) == 0 ? " ." : " . " . shellescape(<q-args>) ),
    \     'options': '--no-sort --color=16 --cycle --inline-info --prompt=' }, 'right:70%:hidden', 'alt-h'),
    \   <bang>0))

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

command! -bang Outline
    \ call fzf#run(fzf#wrap('Outline', {
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
    \               '           printf "%4d\t%12s  %-31s\t%s\n", $5, $4, $1, $3;'.
    \               "         }'".
    \               " | sort -bk2,2",
    \     'sink': function('GoToLine', ['\t']),
    \     'options': ['--layout=reverse', '--no-sort',
    \                 '--delimiter=\t', '--nth=3',
    \                 '--color=16', '--inline-info', '--prompt=Outline> ',
    \                 '--cycle', '--bind=alt-h:toggle-preview',
    \                 '--preview-window=right:65%:hidden',
    \                 '--preview=bat --style=numbers --color=always --line-range={1}: ' . expand('%:p')] },
    \   <bang>0))

augroup Fzf
  au! FileType fzf
  au  FileType fzf set laststatus=0 showtabline=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showtabline=1 showmode ruler
augroup END

" Prevent ack's output leakage
" https://github.com/mileszs/ack.vim/issues/18
" function AckRun(string) abort
"  let saved_shellpipe = &shellpipe
"  let &shellpipe = '>'
"  try
"    execute 'Ack! \\b' . shellescape(a:string, 1) . '\\b'
"  finally
"    let &shellpipe = saved_shellpipe
"  endtry
"endfunction

" Tell ack.vim to use ripgrep instead
" let g:ackprg = 'rg --vimgrep --no-heading'

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

" Tags navigation
nmap <M-]> mO:exec "ltag " . expand("<cword>")<CR><C-t>:lopen<CR>
nmap <M-t> :lclose<CR>:silent! exec '20pop'<CR>:'O<CR>
nmap <Leader>t <M-]>
nmap <Leader>T <M-t>

" vim-polyglot
let g:rust_use_custom_ctags_defs = 1

" vim-tmux-navigator
let g:tmux_navigator_save_on_switch = 1

" ALE
nmap ]w <Plug>(ale_next_wrap)
nmap [w <Plug>(ale_previous_wrap)
nmap \w :update<CR>:silent exec '!touch -cm '.expand('%:p')<CR><Plug>(ale_fix)<Plug>(ale_lint)
nmap \W <Plug>(ale_reset_buffer)

let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'vim': ['vint'],
\   'rust': ['rls'],
\   'lua': ['luac'],
\}
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'rust': ['rustfmt'],
\}
let g:ale_completion_enabled = 0
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_set_highlights = 0
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' ■ '
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '！' " '○◆'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %severity%: %s'
let g:ale_lint_delay = 10
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0

" Lightline
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
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : all_non_errors
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors == 0 ? '' : all_errors
endfunction

augroup Lightline
  au!
  au User ALELintPost if exists('#lightline') | call lightline#update() | redrawstatus | endif
augroup END

let g:vimwiki_list = [{ 'path': '~/belarustianin/', 'syntax': 'markdown', 'ext': '.md' },
                     \{ 'path': '~/notes/' }]
let g:vimwiki_auto_chdir = 1
let g:vimwiki_use_calendar = 1
let g:vimwiki_url_maxsave = 0
