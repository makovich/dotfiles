# zmodload zsh/zprof

# Syntax
source ~/.zsh/fsh/fast-syntax-highlighting.plugin.zsh

# Gives us access to ^Q
# via https://github.com/thoughtbot/dotfiles/blob/21055dff633feea87bc9526efb5b2fcc04bc025e/zsh/configs/keybindings.zsh
stty -ixon

# Prompt
# setopt prompt_subst
psvar[1]=${SSH_CONNECTION:-}
PROMPT="%(1V.%M .)%(1j.%(?.%B%K{2}%F{16}.%B%K{1}%F{16}).%(?.%F{2}.%F{1}))%(!.#.$)%k%f%b "
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

# Vi
bindkey -v

# Vi normal mode
bindkey -s "jj" "^["

# Edit in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

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

# Marks
bindkey -M vicmd -s "'h" "ddicd^M"
bindkey -M vicmd -s "'d" "ddicd ~/dotfiles^M"
bindkey -M vicmd -s "'D" "ddicd ~/dotfiles^Mfd^M"
bindkey -M vicmd -s "'w" "ddicd ~/warc^M"
bindkey -M vicmd -s "'W" "ddicd ~/warc^Mrg^M"
bindkey -M vicmd -s "'m" "ddicd ~/mem^M"
bindkey -M vicmd -s "'c" "ddicd ~/code^M"

# Midnight Commander
bindkey -s "^O" "mc^M"

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
