set nocompatible    " specify config to vim (not vi)
syntax on           " enable syntax highlighting
filetype plugin on  " detect filetypes

""" help identify unique filetypes
au BufNewFile,BufFilePre,BufRead *.html set filetype=htmldjango

""" leader key customizations
set showcmd
let mapleader = ' '

""" default whitespace, overwritten by specific filetype settings
set expandtab
set shiftwidth=4
set softtabstop=4
"set autoindent

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
"set nomodeline
"set modelines=0

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


""" NERDTree
map <F2> :NERDTreeToggle<CR>


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
\   'python': ['pylint', 'flake8'],
\   'go': ['golint', 'gofmt'],
\}

let g:ale_python_pylint_options = '--rcfile ~/.pylintrc
                                 \ --load-plugins pylint_django'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt'],
\   }

let g:ale_fix_on_save = 1


"""vim-go
map <C-m> :cnext<CR>
map <C-n> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" write the buffer when calling GoBuild, skips having to save manually
set autowrite

" tell :cnext and :cprevious to select errors from quickfix
let g:go_list_type = "quickfix"

" run :GoBuild or :GoTestCompile depending on filetype
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
