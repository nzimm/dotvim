set nocompatible    " specify config to vim (not vi)
syntax on           " enable syntax highlighting
filetype plugin on  " detect filetypes

set noswapfile
set textwidth=180
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4 
autocmd FileType make setlocal noexpandtab
