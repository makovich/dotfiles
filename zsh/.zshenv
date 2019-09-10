# Source shared environment variables
[[ -L $HOME/.env ]] && source $HOME/.env
[[ -L $HOME/.alias ]] && source $HOME/.alias

export HISTFILE=~/.zhistory
export HISTSIZE=50000
export SAVEHIST=50000

export KEYTIMEOUT=15
