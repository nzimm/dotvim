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
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey

set belloff=all     " no noise please

set noswapfile      " disables .swp files
