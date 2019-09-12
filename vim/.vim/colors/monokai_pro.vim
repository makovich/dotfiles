set background=dark
highlight clear

if exists('syntax_on')
  syntax reset
endif

set t_Co=256
let g:colors_name = 'monokai_pro'

"highlight WhiteSpaceBol cterm=NONE ctermfg=237 ctermbg=NONE
"highlight WhiteSpaceMol cterm=NONE ctermfg=0 ctermbg=NONE
"match WhiteSpaceMol / /
"2match WhiteSpaceBol /^ \+/

hi Normal                   ctermfg=231  ctermbg=NONE cterm=NONE
hi Visual                   ctermfg=NONE ctermbg=237  cterm=NONE

hi TabLineFill              ctermfg=237  ctermbg=237
hi TabLine                  ctermfg=237  ctermbg=237
hi TabLineSel               ctermfg=231  ctermbg=NONE

hi Cursor                   ctermfg=NONE ctermbg=231  cterm=NONE
hi CursorLine               ctermfg=NONE ctermbg=233  cterm=NONE
hi CursorLineNR             ctermfg=11   ctermbg=233  cterm=NONE
hi LineNr                   ctermfg=237  ctermbg=NONE cterm=NONE
hi SignColumn               ctermfg=NONE ctermbg=NONE cterm=NONE
hi FoldColumn               ctermfg=14   ctermbg=NONE cterm=NONE
hi CursorColumn             ctermfg=NONE ctermbg=233  cterm=NONE
hi ColorColumn              ctermfg=NONE ctermbg=233  cterm=NONE
hi VertSplit                ctermfg=242  ctermbg=NONE cterm=NONE
hi MatchParen               ctermfg=11   ctermbg=NONE cterm=underline
hi StatusLine               ctermfg=231  ctermbg=242  cterm=bold
hi StatusLineNC             ctermfg=231  ctermbg=242  cterm=NONE
hi Pmenu                    ctermfg=NONE ctermbg=235  cterm=NONE
hi PmenuSel                 ctermfg=NONE ctermbg=59   cterm=NONE
hi IncSearch                ctermfg=16   ctermbg=11   cterm=NONE
hi Search                   ctermfg=16   ctermbg=11   cterm=NONE
hi QuickFixLine             ctermfg=NONE ctermbg=233  cterm=NONE
hi Sneak                    ctermfg=11   ctermbg=NONE cterm=underline
hi Folded                   ctermfg=242  ctermbg=235  cterm=NONE

hi ALEErrorSign             ctermfg=1    ctermbg=NONE cterm=NONE
hi ALEWarningSign           ctermfg=214  ctermbg=NONE cterm=NONE
hi ALEError                 ctermfg=NONE ctermbg=NONE cterm=NONE
hi ALEWarning               ctermfg=NONE ctermbg=NONE cterm=NONE
hi ALEVirtualTextError      ctermfg=231  ctermbg=NONE cterm=italic
hi ALEVirtualTextWarning    ctermfg=231  ctermbg=NONE cterm=italic

hi DiffAdd                  ctermfg=231  ctermbg=28   cterm=NONE
hi DiffDelete               ctermfg=231  ctermbg=52   cterm=NONE
hi DiffChange               ctermfg=231  ctermbg=NONE cterm=NONE
hi DiffText                 ctermfg=231  ctermbg=166  cterm=NONE

hi Boolean                  ctermfg=141  ctermbg=NONE cterm=NONE
hi Character                ctermfg=141  ctermbg=NONE cterm=NONE
hi Comment                  ctermfg=242  ctermbg=NONE cterm=italic
hi SpecialComment           ctermfg=237  ctermbg=NONE cterm=italic
hi Directory                ctermfg=141  ctermbg=NONE cterm=NONE
hi Conditional              ctermfg=204  ctermbg=NONE cterm=NONE
hi Constant                 ctermfg=NONE ctermbg=NONE cterm=NONE
hi Define                   ctermfg=204  ctermbg=NONE cterm=NONE
hi ErrorMsg                 ctermfg=231  ctermbg=204  cterm=NONE
hi WarningMsg               ctermfg=231  ctermbg=204  cterm=NONE
hi Float                    ctermfg=141  ctermbg=NONE cterm=NONE
hi Function                 ctermfg=81   ctermbg=NONE cterm=NONE
hi Identifier               ctermfg=81   ctermbg=NONE cterm=NONE
hi Keyword                  ctermfg=204  ctermbg=NONE cterm=NONE
hi Label                    ctermfg=204  ctermbg=NONE cterm=NONE
hi NonText                  ctermfg=59   ctermbg=NONE cterm=NONE
hi Number                   ctermfg=141  ctermbg=NONE cterm=NONE
hi Operator                 ctermfg=204  ctermbg=NONE cterm=NONE
hi PreProc                  ctermfg=155  ctermbg=NONE cterm=NONE
hi Special                  ctermfg=81   ctermbg=NONE cterm=NONE
hi SpecialKey               ctermfg=59   ctermbg=NONE cterm=NONE
hi Statement                ctermfg=204  ctermbg=NONE cterm=NONE
hi StorageClass             ctermfg=81   ctermbg=NONE cterm=NONE
hi String                   ctermfg=221  ctermbg=NONE cterm=NONE
hi Tag                      ctermfg=204  ctermbg=NONE cterm=NONE
hi Title                    ctermfg=255  ctermbg=NONE cterm=bold
hi Todo                     ctermfg=11   ctermbg=NONE cterm=NONE
hi Type                     ctermfg=81   ctermbg=NONE cterm=NONE
hi Underlined               ctermfg=NONE ctermbg=NONE cterm=underline

hi def VimwikiHeader1       ctermfg=252               cterm=bold
hi def VimwikiHeader2       ctermfg=249               cterm=bold
hi def VimwikiHeader3       ctermfg=246               cterm=bold
hi def VimwikiHeader4       ctermfg=243               cterm=bold
hi def VimwikiHeader5       ctermfg=240               cterm=bold
hi def VimwikiHeader6       ctermfg=237               cterm=bold

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

let s:active = [ [ s:mode_fg, s:mode_bg, 'bold' ] ]
let s:inactive = [ [ s:base2_fg, s:base2_bg ] ]

let g:lightline#colorscheme#monokai_pro#palette = lightline#colorscheme#flatten({
    \ 'normal': {
    \   'left': copy(s:active),
    \   'middle': [ [ s:base1_fg, s:base1_bg ] ],
    \   'right': [ [ s:base3_fg, s:base3_bg ], [ s:warn_fg, s:warn_bg ], [ s:err_fg, s:err_bg ] ],
    \},
    \ 'inactive': {
    \   'left': copy(s:inactive),
    \},
    \ 'insert': {
    \   'left': copy(s:active),
    \},
    \ 'visual': {
    \   'left': copy(s:active),
    \},
    \ 'replace': {
    \   'left': copy(s:active),
    \}})
