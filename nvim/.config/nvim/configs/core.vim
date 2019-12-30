" Core Settings

if &compatible
    set nocompatible
endif

filetype indent plugin on

set shell=/bin/zsh
let mapleader = "\<Space>"

set t_Co=256

set termguicolors
set title                                                                       "change the terminal's title
set splitbelow                                                                  "Horizontally split on left
set splitright                                                                  "Vertically split on right
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set showmatch                                                                   "Highlight matching bracket
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set list                                                                        "Enable listchars
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set grepprg=rg\ --vimgrep                                                "Use ripgrep for grepping
set tagcase=smart                                                        "Use smarcase for tags
set pastetoggle=<F2>
set history=500                                                          "Store lots of :cmdline history
set statusline+=%F
set textwidth=80


set undofile
set undodir=~/.config/nvim/undo

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
