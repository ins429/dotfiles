" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

"Pathogen configuration
execute pathogen#infect()

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

" Setting shell for vim
set shell=sh

" Syntax Completion
filetype plugin on
set ofu=syntaxcomplete#Complete

" syntastic
let g:syntastic_go_checkers = []
let g:syntastic_javascript_checkers = ['eslint']

" Supertab
let g:SuperTabDefaultCompletionType = "context"

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=.,$TEMP  " Keep swap files in one location
set backupdir=.,$TEMP  " Keep swap files in one location

" UNCOMMENT TO USE
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" NERDTree
let NERDTreeShowHidden=0

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
set t_Co=256
color Tomorrow-Night
hi Search term=reverse cterm=reverse gui=reverse ctermfg=237

" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" Splitting
map <Leader>- :split<CR>
map <Leader><bar> :vsplit<CR>

map <leader>n :NERDTreeToggle<cr>
map <leader>g :Git<Space>
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

" Zencoding
let g:user_zen_expandabbr_key='<C-e>'
let g:user_zen_settings = { 'erb': { 'extends': 'html' } }

" disable arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Relative line numbers
function! NumberToggle()
        if(&relativenumber == 1)
                set number
        else
                set relativenumber
        endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" disable swap files
set noswapfile

autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:ackprg = 'ag --nogroup --nocolor --column'

" jsx:react
let g:jsx_ext_required = 0

" format json
com! Prettyjson %!python -m json.tool

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('')

" default indent..
set shiftwidth=4
set softtabstop=4
set expandtab
