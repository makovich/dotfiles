#############################################################################
#
# .zshenv [E] -> .zprofile [P] -> .zshrc [RC] -> .zlogin [L] -> .logout [O]
#
#
#                 | interactive  | non-interact |
#       ----------+--------------+--------------+
#           login |  E P RC L O  |  E P __ L O  |
#       ----------+--------------+--------------+
#       non-login |  E _ RC _ _  |  E _ __ _ _  |
#       ----------+--------------+--------------+
#

# Debug me
# set -xe
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# MacOS has own config dir prefrence
export XDG_CONFIG_HOME=$HOME/.config

export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER="less -R"
export MANPAGER="less -m +Gg"
export BROWSER=open

export HISTSIZE=20000
export LESSHISTFILE=~/.less_history

# Override "tmux" (see .tmux.conf for more)
# export TERM=xterm-256color

# Only for BSD
export CLICOLOR=1

# Dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Brew
export HOMEBREW_NO_AUTO_UPDATE=1

# Rust
[ -d "$HOME/.cargo" ] && {
  export RUSTUP_HOME=$HOME/.rustup
  export CARGO_HOME=$HOME/.cargo
  # export CARGO_INSTALL_ROOT=/usr/local/bin
  export PATH=$CARGO_HOME/bin:$PATH
  export RUSTC_WRAPPER=sccache
  export RUST_SRC_PATH="`rustc --print sysroot`/lib/rustlib/src/rust/library/"
}

# Node
# export NVM_DIR="$HOME/.nvm"
# export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

# alp (https://github.com/makovich/alp)
export ALPINE_ISO_DIR=$HOME/code/alpine-img

# nnn
export NNN_OPTS="aeoQH"
export NNN_PLUG=";:preview-tui"
export NNN_BMS="d:~/dotfiles;s:~/src"
export NNN_FCOLORS="c1e26c2e006033f5c6d6abc4"
export NNN_ARCHIVE="\\.(7z|bz|bz2|gz|rar|rpm|tar|tgz|zip)$"
export NNN_OPENER=$HOME/bin/ql
# export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"

# Pickers
MENU_COMMAND="fd --type file --follow --hidden --exclude .git --color=always || find ."
export SKIM_DEFAULT_COMMAND="$MENU_COMMAND"
export FZF_DEFAULT_COMMAND="$MENU_COMMAND"

export SKIM_DEFAULT_OPTIONS="
--ansi \
--reverse \
--color=16 \
--preview-window='right:65%:hidden' \
--preview='bat --color=always --style=numbers {}' \
--bind='\
?:toggle-preview,\
ctrl-j:accept,\
ctrl-[:cancel,\
ctrl-d:half-page-down,\
ctrl-u:half-page-up,\
alt-j:preview-down,\
alt-k:preview-up,\
alt-h:preview-left,\
alt-l:preview-right,\
alt-d:preview-page-down,\
alt-u:preview-page-up'\
"

export FZF_DEFAULT_OPTS="
--ansi \
--reverse \
--color=16 \
--preview-window='right:65%:hidden' \
--preview='bat --color=always --style=numbers {}' \
--bind='\
ctrl-j:accept,\
ctrl-[:cancel,\
ctrl-d:half-page-down,\
ctrl-u:half-page-up,\
?:toggle-preview,\
alt-j:preview-down,\
alt-k:preview-up,\
alt-d:preview-page-down,\
alt-u:preview-page-up'\
"

alias v="$EDITOR"
alias c="`command -v bat >/dev/null 2>&1 && echo bat || echo cat`"
alias n="[ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ] && exit || nnn"
alias l="ls -alFh `ls --color >/dev/null 2>&1 && echo '--color' || echo '-G'`"

alias srv="python3 -m http.server 8080"
alias tmp='cd `mktemp -d /tmp/XXXXXXXX`'
alias tac="`tac -h >/dev/null 2>&1 && echo tac || echo 'tail -r'`"

mkcd() {
  mkdir -p $1
  cd $1
}

m() {
  pushd $HOME/mem
  trap popd EXIT

  # 1. esc
  #    $?=130
  #
  # 2. ctrl-j
  #    qry=
  #    sel=first_item
  #
  # 3. ctrl-j
  #    qry=asdf
  #    sel=am-sa-do-fi.md
  #
  # 4. ctrl-j
  #    qry='newfile.md
  #    sel=
  res=$(sk --bind='ctrl-r:execute(ENV=~/.profile sh -ci "cd $HOME/mem; rg")' --print-query --query ${1:-""} --select-1)
  [ $? -eq 130 ] && return 0

  qry=$(echo "$res" | sed -n 1p | tr -d "'")
  sel=$(echo "$res" | sed -n 2p)

  if [ -z "$sel" ]; then
    $EDITOR "$qry"
  else
    $EDITOR "$sel"
  fi
}

wa() {
  [ "$#" -lt 1 ] && echo "Usage:\n    $0 URL" && return 1
  pushd $HOME/warc
  trap popd EXIT
  wget \
    --page-requisites \
    --convert-links \
    --adjust-extension \
    --compression=auto \
    --reject-regex='/search|/rss' \
    --no-if-modified-since \
    --no-check-certificate \
    --user-agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36' \
    "$@"
}

waa() {
  [ "$#" -lt 1 ] && echo "Usage:\n    $0 URL" && return 1
  wa --mirror "$1"
}

fd() {
  if [ "$#" -gt 0 ]; then
    command fd "$@"
  else
    sk | xargs $EDITOR
  fi
}

rg() {
  if [ "$#" -gt 0 ]; then
    command rg "$@"
  else
    sk \
      --ansi \
      --delimiter=':' \
      --no-multi \
      --interactive \
      --preview-window=right:65%:+{2}-/2 \
      --preview='bat --style=numbers --color=always --highlight-line {2} {1}' \
      --cmd 'rg "{}" --hidden --color=always --ignore-case --line-number' \
      | cut -f1,2 -d':' \
      | sed 's/:/ \+/g' \
      | xargs -I{} sh -c '</dev/tty $EDITOR {}'
  fi
}

# Guess what?
[ -f ~/.secrets ] && source ~/.secrets

# Gives us access to ^Q
# https://github.com/thoughtbot/dotfiles/blob/21055dff633feea87bc9526efb5b2fcc04bc025e/zsh/configs/keybindings.zsh
stty -ixon

# Allow readline see ^O
# https://apple.stackexchange.com/a/3255
stty discard undef

# Bashisms
[ "$BASH_VERSION" ] && {
	PS1="${SSH_CONNECTION+\H }"
	PS1+='\e[$((\j>0?7:0))m'
	PS1+='\e[32m$(code=${?##0};echo ${code:+"\e[31m"})\$\e[00m '

	HISTFILE=~/.bash_history
	HISTCONTROL=ignorespace
	HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  "
	HISTFILESIZE=20000

	shopt -s histappend

	# nnn
	bind -x '"\C-o": n'
}

# Zetshisms
[ "$ZSH_VERSION" ] && {
	export HISTFILE=~/.zsh_history
	export SAVEHIST=20000
	export KEYTIMEOUT=35

	# Uncomment last line or zprof in new session to get counters
	# zmodload zsh/zprof

	# Syntax
	zle-get-fsh () {
		mkdir -p ~/.zsh
		git clone https://github.com/zdharma/fast-syntax-highlighting ~/.zsh/fsh
	}
	source ~/.zsh/fsh/fast-syntax-highlighting.plugin.zsh

	# Prompt
	# setopt prompt_subst
	psvar[1]=${SSH_CONNECTION:-}
	PROMPT=$'%(1V.%M .)%(1j.%(?.%B%K{2}%F{16}.%B%K{1}%F{16}).%(?.%F{2}.%F{1}))%(!.#.$)%k%f%b\U00A0'
	RPROMPT="%F{242}%~%f"

	zle-keymap-select() {
		# 0 -> blinking block.
		# 1 -> blinking block (default).
		# 2 -> steady block.
		# 3 -> blinking underline.
		# 4 -> steady underline.
		# 5 -> blinking bar (xterm).
		# 6 -> steady bar (xterm).
		printf '\e[%s q' ${${KEYMAP/vicmd/2}/(main|viins)/6}
	}
	zle -N zle-keymap-select

	zle-line-init() {
		zle reset-prompt
		zle zle-keymap-select
	}
	zle -N zle-line-init

	function vi-yank-xclip {
		zle vi-yank
		echo -n "$CUTBUFFER" | (xsel -ipb || pbcopy) 2>/dev/null
	}
	zle -N vi-yank-xclip

	# Vi
	bindkey -v

	# Yank to the system clipboard
	bindkey -M vicmd "y" vi-yank-xclip

	# Vi normal mode
	bindkey -s "jj" "^["

	# Edit in $EDITOR
	autoload -Uz edit-command-line
	zle -N edit-command-line
	bindkey -M vicmd "^V" edit-command-line

	# Emacs
	bindkey "^A" beginning-of-line
	bindkey "^W" backward-kill-word
	bindkey "^E" end-of-line
	bindkey "^Y" yank
	bindkey "^D" delete-char
	bindkey "^H" backward-delete-char
	bindkey "^C" kill-buffer

	# This mimics to vicmd in ins mode
	bindkey "^[h" backward-char
	bindkey "^[l" forward-char

	# Smart history lookup
	autoload -U up-line-or-beginning-search
	autoload -U down-line-or-beginning-search
	zle -N up-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "^P" up-line-or-beginning-search
	bindkey "^N" down-line-or-beginning-search

	# Repeat last command
	bindkey -M vicmd -s "." "^P^M"
	bindkey          -s "^K" "^[[A^M"

	# Exit
	bindkey -M vicmd -s "q" "i^D"

	# Midnight Commander
	bindkey -s "^O" "n^M"

	# man page
	bindkey -M vicmd -s "K" "Iman ^M"

	# Do show hidden files
	setopt globdots

	# Display items after <tab> and reprint prompt after them
	unsetopt always_last_prompt

	# Allow to add few more symbols to type before inserting the first match
	unsetopt menu_complete

	# Show completions menu
	setopt auto_menu

	# No beep on tab
	unsetopt list_beep

	# More columns
	setopt list_packed

	# Disable start/stop characters in shell editor
	unsetopt flowcontrol

	# Complete from anywhere in a word
	# mk|dr --> mkdir|
	setopt complete_in_word

	# Move cursor to the end of a completed word
	setopt always_to_end

	# HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)"

	# Write session history after exit
	setopt append_history

	# Remove commands starting from space from history
	setopt hist_ignore_space

	# Allow comments in the commmand line
	setopt interactive_comments

	# cd acts as pushd
	setopt autopushd

	# Time and duration for history log
	# $ fc -l -i -D -2
	setopt extendedhistory

	# Completions
	# autoload -Uz compinit
	# compinit -i

	# Display menu
	# zstyle ':completion:*:*:*:*:*' menu

	# Default to file completion
	# zstyle ':completion:*' completer _files _complete # _expand _complete _files # _correct _approximate

	# Default colors
	# via https://stackoverflow.com/a/16149200
	# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'

	# Via Jonathan Hayase https://superuser.com/a/815317
	# - smart case completion (abc => Abc)
	# - word flex completion (abc => A-big-Car)
	# - full flex completion (abc => ABraCadabra)
	# zstyle ':completion:*' matcher-list \
	#  'm:{a-z\-}={A-Z\_}' \
	#  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
	#  'r:|?=** m:{a-z\-}={A-Z\_}'

	# Magic man
	# zstyle ':completion:*:manuals' separate-sections true
	# zstyle ':completion:*:manuals.*' insert-sections true
	# zstyle ':completion:*:man:*' menu select

	# zprof
}
