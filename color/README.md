# Colorscheme

## Shell
- `for i in {0..255}; do printf '\e[48;5;%dm%3d ' $i $i; (((i+3) % 6)) || printf '\e[0m\n'; done`
- `showconsolefont`

## tmux
- black (colour0)
- red (colour1)
- cyan (colour6)
- white (colour7, colour15, colour231)
- colour214
- colour233
- colour235
- colour237
- colour242

## Vim Lightline
```vim
let s:mode_fg =  [ '#FFFFFF', 231 ]
let s:mode_bg =  [ '#E4E4E4', 235 ]
let s:base1_fg = [ '#3A3A3A', 237 ]
let s:base1_bg = [ '#000000',   0 ]
let s:base2_fg = [ '#808080', 244 ]
let s:base2_bg = [ '#121212', 233 ]
let s:base3_fg = [ '#262626', 235 ]
let s:base3_bg = [ '#6C6C6C', 242 ]
let s:warn_fg =  [ '#FFAF00', 214 ]
let s:warn_bg =  [ '#E4E4E4', 235 ]
let s:err_fg =   [ '#800000',   1 ]
let s:err_bg =   [ '#121212', 233 ]
```

## Vim Highlight
- Diff: 28, 52, 166
