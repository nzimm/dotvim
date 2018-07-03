""" setup pathogen
execute pathogen#infect()
let g:jsx_ext_required = 0 "Allow JSX in normal JS files

set nocompatible    " specify config to vim (not vi)
syntax on           " enable syntax highlighting
filetype plugin on  " detect filetypes

""" whitespace
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

""" wrapping behavior
set linebreak       " visually wrap lines
set textwidth=0     " stops automatic newline insertion
set wrapmargin=0

""" search behavior
set hlsearch
set incsearch

""" line numbers
set number
highlight LineNr cterm=NONE ctermfg=DarkGrey
set cursorline
highlight CursorLine cterm=NONE

set scrolloff=4     " lines displayed below cursor when scrolling

set belloff=all     " mute

set noswapfile      " disables .swp files
