""" install & run vim-plug (curl may require `--insecure` if behind an HTTP proxy)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" enable plugins
source ~/.vim/plugins.vim

""" general settings
set paste
set nocompatible                " specify config to vim (not vi)
syntax on                       " enable syntax highlighting
filetype plugin on              " detect filetypes
set backspace=indent,eol,start  " make backspace act normally

""" set gruvbox dark colorscheme & transparent background
colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=NONE

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
"highlight Search ctermbg=Black
"highlight Search ctermfg=Yellow

""" line numbers
set number
set nocursorline
"highlight LineNr cterm=NONE term=NONE ctermfg=LightGrey
"highlight CursorLine cterm=NONE

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


""" lightline
let g:lightline = {
\   'colorscheme': 'gruvbox',
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


""" vim-markdown
let g:vim_markdown_folding_disabled = 1


""" ale
" unset default gutter background color
highlight SignColumn guibg=NONE ctermbg=NONE

" unset warning & error background color
highlight ALEErrorSign guibg=NONE ctermbg=NONE
highlight ALEWarningSign guibg=NONE ctermbg=NONE

" keep gutter open
"let g:ale_sign_column_always = 1

" disable highlighting
let g:ale_set_highlights = 0

" only lint when buffer is saved
let g:ale_lint_on_text_changed = 'never'

" don't lint when file is loaded
"let g:ale_lint_on_enter = 0

let g:ale_linters = {
\   'python': ['pylint', 'flake8'],
\   'go': ['golint', 'gofmt'],
\   }

let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt'],
\   'typescript': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   }

let g:ale_fix_on_save = 1


""" python-mode
" color column at max line length
let g:pymode_options_colorcolumn = 0


""" vim-go
map <C-m> :cnext<CR>
map <C-n> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader><TAB>  :GoAlternate<CR>
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

""" x86 nasm filetype
autocmd BufNewFile,BufRead *.nasm set filetype=nasm

""" JavaScript/TypeScript
" if syntax in large files is getting out of sync
"autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
"autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Prettier and ESLint
"if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"  let g:coc_global_extensions += ['coc-prettier']
"endif
"
"if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"  let g:coc_global_extensions += ['coc-eslint']
"endif
