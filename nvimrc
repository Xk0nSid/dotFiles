"
" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
"

" Plugins {{{1

call plug#begin('~/.config/nvim/plugged')

Plug 'fatih/vim-go'
Plug 'nsf/gocode'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug '/home/shopclues/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'

Plug 'junegunn/vim-easy-align'
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Tags sidebar
Plug 'majutsushi/tagbar'
" Ctrl+T -> Toggles the tagbar
map <C-t> :TagbarToggle<CR>


" Display vertical line for indentation levels
Plug 'Yggdroot/indentLine'
let g:indentLine_faster = 1
let g:indentLine_char = '┃'
let g:indentLine_first_char = '┃'
let g:indentLine_showFirstIndentLevel = 1

Plug 'joshdick/onedark.vim'
let g:onedark_terminal_italics = 1
let g:onedark_termcolors = 256

" Simple status lines
Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

" Add nice font icons
Plug 'ryanoasis/vim-devicons'

" Used to display the active branch in lightline
Plug 'itchyny/vim-gitbranch'

" System explorer
Plug 'scrooloose/nerdtree'
" Ctrl+N -> Map open/close NERDTree to Ctrl+N
map <C-n> :NERDTreeToggle<CR>
" Ctrl+Alt+N -> Focus NERDTree window (open it if it's closed)
map <C-A-n> :NERDTreeFocus<CR>
" Start NERDTree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Start NERDTree when a directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
    \ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open files with split
let NERDTreeMapOpenSplit = 'h'
let NERDTreeMapOpenVSplit = 'v'


call plug#end()

" }}}
" General {{{1

if &compatible
    set nocompatible
endif

filetype indent plugin on

set shell=/bin/zsh
let mapleader = "\<Space>"

set t_Co=256

set backspace=indent,eol,start

set termguicolors
set title                                                                       "change the terminal's title
set splitbelow                                                                  "Horizontally split on left
set splitright                                                                  "Vertically split on right
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set guicursor=a:blinkon500-blinkwait500-blinkoff500                             "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
" set cursorcolumn                                                                "Highlight current column
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set hidden                                                                      "Hide buffers in background
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set grepprg=rg\ --vimgrep                                                "Use ripgrep for grepping
set tagcase=smart                                                        "Use smarcase for tags
set updatetime=500                                                          "Cursor hold timeout
set synmaxcol=300                                                          "Use syntax highlighting only for 300 columns
set shortmess+=c                                                            "Disable completion menu messages in command line
set pastetoggle=<F2>
set path+=**                                                           "Allow recursive search
set conceallevel=2
set concealcursor=i                                                            "neosnippets conceal marker
set listchars=tab:\ \ ,trail:·                                             "Set trails for tabs and spaces
set history=500                                                          "Store lots of :cmdline history
set mouse=a                                                            "Enable mouse usage
set timeoutlen=1000
set ttimeoutlen=0                                                            "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                        "Set utf-8 encoding on write
set inccommand=nosplit                                                      "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                      "Make vertical split separator full line
set pumheight=15                                                           "Maximum number of entries in autocomplete popup
set visualbell

" }}}
" ================ Turn Off Swap Files ============== {{{

set noswapfile
set nobackup
set nowritebackup

" }}}
" ================ Indentation ===================== {{{

set autoindent
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set shiftround
set breakindent
set smartindent
set nofoldenable
set colorcolumn=80
set foldmethod=syntax

" }}}
" ============= Competion ================ {{{

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                  "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif"

" }}}
" =========== User Interface ============ {{{

syntax on
set background=dark
colorscheme onedark
hi Normal ctermbg=NONE
" Remove highlighting of Operator because it is reversed with cursorline
" enabled
hi! Operator guifg=NONE guibg=NONE

" Fixes methods' arguments color in the Tagbar
hi TagbarSignature guifg=#80AAFF

" Disables color-scheme background color
hi Normal guibg=NONE

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Have italic comments
hi Comment cterm=italic gui=italic
hi htmlArg gui=italic cterm=italic

" Set a syntax for some extenstions
au BufReadPost *.opml setlocal syntax=xml | setlocal filetype=xml
au BufReadPost *.rasi setlocal syntax=css | setlocal filetype=css
au BufReadPost *.vue setlocal syntax=html

set relativenumber

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" }}}
" =========== Mappings =================== {{{

" Jump to start and end of line using the home row keys
map H ^
map L $

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Toggle buffer list
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

nnoremap <Leader>/ :FlyGrep<CR>

nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bn :bnext<CR>

nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wh :split<CR>
nnoremap <Leader>wc :bd<CR>
nnoremap <Leader>wk :q<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" ============ Plugins ================== {{{

" Golang

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1
let g:deoplete#sources = {}

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

call deoplete#custom#option('sources', {
    \ 'python': ['LanguageClient'],
    \ 'rust': ['LanguageClient'],
    \ 'go': ['LanguageClient'],
\})

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'go': ['~/workspace/go/bin/go-langserver']
    \ }

let g:LanguageClient_autoStart = 1

let g:LanguageClient_diagnosticsDisplay = {
    \     1: {
    \         "name": "Error",
    \         "texthl": "ALEError",
    \         "signText": "✖",
    \         "signTexthl": "ErrorMsg",
    \         "virtualTexthl": "WarningMsg",
    \     },
    \     2: {
    \         "name": "Warning",
    \         "texthl": "ALEWarning",
    \         "signText": "⚠",
    \         "signTexthl": "ALEWarningSign",
    \         "virtualTexthl": "Todo",
    \     },
    \     3: {
    \         "name": "Information",
    \         "texthl": "ALEInfo",
    \         "signText": "ℹ",
    \         "signTexthl": "ALEInfoSign",
    \         "virtualTexthl": "Todo",
    \     },
    \     4: {
    \         "name": "Hint",
    \         "texthl": "ALEInfo",
    \         "signText": "➤",
    \         "signTexthl": "ALEInfoSign",
    \         "virtualTexthl": "Todo",
    \     },
    \ }

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'


" Python
" Limit lines to 79 characters and toggle the coloring of the 80th column
" au FileType python
"     \ setlocal textwidth=79 |
"     \ setlocal fileformat=unix |
"     \ :call ToggleCC()

" Javascript, HTML, CSS and XML
" Change the indent width to 2 spaces
au FileType javascript,html,css,xml
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2

" }}}
