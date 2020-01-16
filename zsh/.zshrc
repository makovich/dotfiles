# Syntax
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Prompt
# setopt prompt_subst
PROMPT="%(1j.%(?.%B%K{2}%F{16}.%B%K{1}%F{16}).%(?.%F{2}.%F{1}))%(!.#.$)%k%f%b "
RPROMPT="%F{242}%~%f %B%K{242}%F{232} %n@%m %f%k%b"

# Node Version Manager
# source "$NVM_DIR/nvm.sh"

zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  zle reset-prompt
  echo -ne '\e[6 q'
}
zle -N zle-line-init


# Share commands history between shell instances
setopt share_history

# Record commands only after shell's exit
# setopt append_history

# change dir without cd
setopt autocd

# Record command every time
setopt inc_append_history

# Allow commenting commands out
setopt interactivecomments

# Give us access to ^Q
# via https://github.com/thoughtbot/dotfiles/blob/21055dff633feea87bc9526efb5b2fcc04bc025e/zsh/configs/keybindings.zsh
stty -ixon

# Vi
bindkey -v
bindkey -M vicmd "jj" vi-insert           # right arm and same as in .vimrc

# Edit in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# Freeing vi-mode forward/reverse history search
bindkey -r "^[/"
bindkey -r "^[,"

# Minimal's magic enter only for vicmd mode
# bindkey -M vicmd "^M" buffer-empty
# bindkey -M main "^M" accept-line

# Emacs
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^Y" yank
# 1) replcae with fuzzy-hs      "^R" redisplay // in default viins
# 2) replace / with fuzzy-hs    "/" vi-history-search-backward
# 3) if no hs found do fallback
# bindkey "^R" history-incremental-search-backward

skim-history-search() {
  local cmd
  cmd=$(fc -lnr 1 | sk) || return
  LBUFFER="${LBUFFER}${cmd}"
  zle reset-prompt
}
zle -N skim-history-search
bindkey "^R" skim-history-search

# Smart history lookup
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[OA" up-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Repeat last command
bindkey -M vicmd -s '.' '^P^M'
bindkey -M vicmd -s "^K" "^P^M"
bindkey -s "^K" "^[[A^M"

# Completions
autoload -Uz compinit
compinit -i

# Do show hidden files
setopt globdots

# Allow to add few more symbols to type before inserting the first match
unsetopt menu_complete

# Show completions menu
setopt auto_menu

# No beep on tab
unsetopt list_beep

# More columns
setopt list_packed

# Display items from left to right
setopt list_rows_first

# Disable start/stop characters in shell editor
unsetopt flowcontrol

# Complete from anywhere in a word
# mk|dr --> mkdir|
setopt complete_in_word

# Move cursor to the end of a completed word
setopt always_to_end

# Display menu
zstyle ':completion:*:*:*:*:*' menu

# Default to file completion
zstyle ':completion:*' completer _files _complete # _expand _complete _files # _correct _approximate

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
