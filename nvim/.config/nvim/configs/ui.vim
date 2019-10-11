" User Interface

" au Colorscheme * hi Keyword gui=italic cterm=italic ctermfg='#f78c6c'

syntax on
set background=dark
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1
colorscheme material
" hi Normal ctermbg=NONE
" Remove highlighting of Operator because it is reversed with cursorline
" enabled
" hi! Operator guifg=NONE guibg=NONE

" Fixes methods' arguments color in the Tagbar
" hi TagbarSignature guifg=#80AAFF

" Disables color-scheme background color
" hi Normal guibg=NONE

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

" Have italic comments
hi Comment cterm=italic gui=italic
hi htmlArg gui=italic cterm=italic

" Set a syntax for some extenstions
au BufReadPost *.rasi setlocal syntax=css | setlocal filetype=css

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=5
