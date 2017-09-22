" plugins
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown',     { 'for': 'markdown' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
call plug#end()

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set splitright                    " Default split to right side.

set shiftwidth=4                  " default indent
set softtabstop=4

set expandtab                     " Use spaces instead of tabs

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set laststatus=2                  " Show the status line all the time

set noswapfile                    " disable swap files

set noshowmode                    " No need to display current mode, Airline takes care this

" CtrlP
if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and
        " respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
endif

" Color Scheme
let g:seoul256_background = 233
colo seoul256

hi Search term=reverse cterm=reverse gui=reverse ctermfg=37

" Splitting
map <Leader>- :split<CR>
map <Leader><bar> :vsplit<CR>

map <leader>n :NERDTreeFind<cr>
map <leader>c :CtrlPClearAllCaches<cr>
map <leader>/ :Ack!<Space>

" Shortcut to yanking to the system clipboard
map <leader>y :w !pbcopy<CR><CR>
map <leader>p :r !pbpaste<CR>

" Removing search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR>

" split naviagation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:ackprg = 'ag --nogroup --nocolor --column'

" jsx:react
let g:jsx_ext_required = 0

" format json
com! Prettyjson %!python -m json.tool

" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" syntastic
let g:syntastic_go_checkers = []
let g:syntastic_javascript_checkers = ['eslint']

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Airline
let g:airline_theme='seoul256'
