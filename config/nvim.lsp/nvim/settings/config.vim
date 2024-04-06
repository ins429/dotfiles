filetype plugin indent on
syntax enable

set autoindent
set autoread
set clipboard=unnamed
set colorcolumn=100
set cursorline
set expandtab
set guicursor=
set hidden
set hlsearch
set incsearch
set ignorecase
set lazyredraw
set nobackup
set noswapfile
set number
set nowrap
set ruler
set scrolloff=4
set sidescrolloff=5
set shiftround
set shiftwidth=2
set showcmd
set smartcase
set smarttab
set splitright
set splitbelow
set softtabstop=2
set tabstop=2
set visualbell
set wildmenu
set wildmode=list:longest
set updatetime=100
set noshowmode                    " No need to display current mode, Lightline takes care this

" Color Scheme
let g:seoul256_background = 233
colo seoul256

" Split borders
set fillchars+=vert:\ 
hi VertSplit guibg=bg guifg=bg

" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"

" lsp
autocmd CursorHold * lua vim.diagnostic.open_float({focus=false,scope="cursor"})
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
