" General
set encoding=utf-8
set number
set clipboard=unnamed         " System clipboard
set fileformat=unix
set nowrap
"set mouse=a

" Plugins
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin manager
Plugin 'gmarik/Vundle.vim'
" Line folding
Plugin 'tmhedberg/SimpylFold'
" Indentation
Plugin 'vim-scripts/indentpython.vim'
" Code completion
Bundle 'Valloric/YouCompleteMe'
" Check syntax 
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
" Color scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" File Browsing
Plugin 'scrooloose/nerdtree'
" Tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Search
Plugin 'kien/ctrlp.vim'
" Git integration
Plugin 'tpope/vim-fugitive'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()            " required
filetype plugin indent on    " required

" Splits
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Trailing whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe plugin
" Close the autocomplete window when done with it
let g:ycm_autoclose_preview_window_after_completion=1
" Shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax Highlighting
let python_highlight_all=1
syntax on

" Colorscheme ('ron' is good too)
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" <F5> to toggle light/dark theme
call togglebg#map("<F5>")

" Nerdtree files to ignore
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" HTML, CSS, JS
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

