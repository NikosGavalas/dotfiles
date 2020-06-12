" General
set encoding=utf-8
set number
set clipboard=unnamed               " System clipboard
set fileformat=unix
set nowrap
set mouse=a
syntax on
set tabstop=4
set expandtab

" Splits
set splitbelow                      " :sp <filename>
set splitright                      " :vs <filename>
" Split navigations
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Move lines up and down
nnoremap <C-S-J> :m .+1<CR>==
nnoremap <C-S-K> :m .-2<CR>==
