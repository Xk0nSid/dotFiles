" Plugins

" Install vim-plugged if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'


" Display vertical line for indentation levels
Plug 'Yggdroot/indentLine'

" Color Scheme
Plug 'simonsmith/material.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Smart completion (to work with CoC)
" Plug 'zxqfl/tabnine-vim'

" Tagbar
Plug 'liuchengxu/vista.vim'

call plug#end()
