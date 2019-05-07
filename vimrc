" plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown',     { 'for': 'markdown' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'

Plug 'avdgaag/vim-phoenix'

Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'w0rp/ale'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-system-copy'
call plug#end()

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

runtime macros/matchit.vim        " Load the matchit plugin.

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

set shiftwidth=2                  " default indent
set softtabstop=2
set tabstop=2

set expandtab                     " Use spaces instead of tabs

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set laststatus=2                  " Show the status line all the time

set noswapfile                    " disable swap files

set noshowmode                    " No need to display current mode, Lightline takes care this
set cursorline                    " Set background cursorline
set colorcolumn=100               " Set background vertical line

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

" redraw
map <leader>r :redraw!<CR>

" Removing search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-c><C-c> :nohlsearch<CR>

" split naviagation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:ackprg = 'ag --nogroup --nocolor --column --path-to-ignore ~/.ignore'

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

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Lightline
let g:lightline = { 'colorscheme': 'seoul256' }

" Lightline tabline
:set showtabline=2
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Emmet
let g:user_emmet_leader_key='<C-e>'

" Whitespace highlighting
highlight ExtraWhitespace ctermbg=red


" ale config
let g:ale_linters = {
\  'graphql': [],
\  'ruby': [],
\  'javascript': ['eslint']
\}

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'graphql': ['prettier'],
\  'elixir': ['mix_format']
\}

let g:ale_fix_on_save = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = "⨉"
let g:ale_sign_warning = "⚠"

" Linting on all changes felt too aggressive. The below settings calls lint on
" certain events, either when I stop interacting or when entering / leaving
" insert mode - ref: Chris Toomey's vimrc
set updatetime=1000
autocmd CursorHold * call ale#Lint()
autocmd CursorHoldI * call ale#Lint()
autocmd InsertLeave * call ale#Lint()
autocmd TextChanged * call ale#Lint()
let g:ale_lint_on_text_changed = 0

" fzf
" nnoremap <silent> <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <C-p> :Files<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden --path-to-ignore ~/.ignore'

" python formatter
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>

" ruby path
let g:ruby_path = system('echo $HOME/.asdf/shims/ruby')

let g:polyglot_disabled = ['ruby']
