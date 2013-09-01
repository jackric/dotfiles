"" Load pathogen first
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set mouse=a
set nocompatible
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

let g:molokai_original=1
set t_Co=256
colorscheme molokai

"" Tab completion
set wildmenu                " Show what matches
set wildmode=list:full   " Only complete to point of amibguity

"" Show extra whitespace
"highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace:
"match ExtraWhitespace /\s\+$/
"

"" Disable colorcolumn - at global, 80 chars is not enforced
"au FileType python set colorcolumn=80


"" Configure ack plugin
let g:ackprg="ack -H --nocolor --nogroup --column"

"" Disable arrow keys to force learning of hjkl
"" noremap <Up> <nop>
"" noremap <Down> <nop>
"" noremap <Left> <nop>
"" noremap <Right> <nop>


map <C-L> :bnext<cr>
map <C-H> :bprevious<cr>
noremap <C-J>J a<CR><Esc>k$

"" Yank and paste from system clipboard by default
set clipboard=unnamed

"" Hide some stuff from NERDTree
let NERDTreeIgnore=['\.pyc$']

"" Statusline
"define 3 custom highlight groups
hi User1 ctermbg=black ctermfg=white   guibg=black guifg=white
hi User2 ctermbg=blue   ctermfg=white  guibg=blue   guifg=white
hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green
set statusline=%F%m%r%h%w\ %=
set statusline+=%l,%v\ [%p%%]
" always show the status line
set laststatus=2

" More colorful hilighting
let NERDChristmasTree=1

nnoremap gp `[v`]


""" Break up long lines visually, i.e. don't alter the file
set showbreak=>>>
set wrap

"" Hide the top toolbar in gvim/mvim
set guioptions-=T
let g:pyflakes_use_quickfix = 0

set cursorline

"" Pythom-mode settings
let g:pymode_folding=0
let g:pymode_lint_checker="pyflakes"
let g:pymode_lint=1
"let g:pymode_lint_onfly=1

let g:pymode_breakpoint_key = '<leader>p'
let g:pymode_utils_whitespaces = 0

autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()
    call ExtractSnips("~/.vim/snippets/", "python")
endfunction

" Sandbox any directory-include vimrc files
set secure
