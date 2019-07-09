set nocompatible    " specify config to vim (not vi)
syntax on           " enable syntax highlighting
filetype plugin on  " detect filetypes

""" default whitespace, overwritten by specific filetype settings
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
set ignorecase
set smartcase
highlight Search ctermbg=Yellow
highlight Search ctermfg=Black

""" line numbers
set number
highlight LineNr cterm=NONE ctermfg=DarkGrey
set cursorline
highlight CursorLine cterm=NONE

set laststatus=2    " enable status for itchyny/lightline plugin
set noshowmode      " disable redundancy for lightline
set scrolloff=3     " display 3 lines above/below cursor
set belloff=all     " mute
set noswapfile      " disables .swp files

""" more natural split navigation & opening
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

""" Disable modelines, see CVE-2019-12735
set nomodeline
set modelines=0

""" Install & run vim-plug (curl may require `--insecure` if behind an HTTP proxy)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.vim/plugins.vim

""" lightline
let g:lightline = {
\   'colorscheme': 'jellybeans',
\   'active': {
\       'left': [ [ 'mode', 'paste' ],
\                 [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\   },
\   'component_function': {
\       'gitbranch': 'fugitive#head'
\   },
\}

""" ale

" unset default gutter color
highlight SignColumn ctermbg=NONE

" disable highlighting
let g:ale_set_highlights = 0

" only lint when buffer is saved
let g:ale_lint_on_text_changed = 'never'

" don't lint when file is loaded
"let g:ale_lint_on_enter = 0

let g:ale_linters = {
\   'python': ['pylint'],
\}

let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   }

let g:ale_fix_on_save = 1
