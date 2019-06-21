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
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
" Plug 'ehamberg/vim-cute-python'
Plug 'kizza/KizzaCandyPaper.vim'
Plug 'chriskempson/base16-vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color Schemes
Plug 'mkarmona/materialbox'
Plug 'morhetz/gruvbox'


call plug#end()

" }}}
" General {{{1

if &compatible
    set nocompatible
endif

filetype indent plugin on

set shell=/bin/bash
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
set cursorcolumn                                                                "Highlight current column
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
set background=dark                                                         "Set background to dark
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
let base16colorspace=256
colorscheme base16-atelier-dune
hi Normal ctermbg=NONE
" Remove highlighting of Operator because it is reversed with cursorline
" enabled
hi! Operator guifg=NONE guibg=NONE

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

" Merlin for OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" OCP Indent
" Indentation for OCaml
set rtp^="/home/xk0nsid/.opam/default/share/ocp-indent/vim"

let g:airline#extensions#tabline#enabled=2
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=' '
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1

let g:airline_left_sep=' '
let g:airline_left_alt_sep='|'
let g:airline_right_sep=' '
let g:airline_right_alt_sep='|'
let g:airline_theme='base16'

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
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" }}}
