# Make italic and reverse work in iTerm2

## Generate terminfo DB records. Example:
tic -o ~/.terminfo tmux-256color

## Test
```
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```

## V1
- in iTerm2 preferences TERM should be `tmux-256color`
- in tmux `set -g default-terminal "tmux"` will set TERM=tmux
- both terminal capabilities must present in the system:
  - download terminfo.src database from https://invisible-island.net/ncurses/
  - compile `tmux` and `tmux-256color` profiles into $HOME/.terminfo
    Ex.: $ TERMINFO=~/.terminfo tic -x -e tmux terminfo.src

## V2
- tic -o ~/.terminfo xterm-256color
- iTerm2 > Profile > Terminal > xterm-256color
- .tmux.conf xterm-256color
