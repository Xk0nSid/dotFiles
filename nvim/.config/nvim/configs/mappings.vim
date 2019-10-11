" Key Mappings

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Toggle buffer list
nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fb :Buffers<CR>

nnoremap <Leader>/ :FlyGrep<CR>

nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bn :bnext<CR>

nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wh :split<CR>
nnoremap <Leader>wc :bd<CR>
nnoremap <Leader>wk :q<CR>

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
