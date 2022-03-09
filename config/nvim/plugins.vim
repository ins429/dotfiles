call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} 
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown',     { 'for': 'markdown' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'

Plug 'avdgaag/vim-phoenix'

" Plug 'leafgarland/typescript-vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'jparise/vim-graphql'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'OmniSharp/omnisharp-vim'
" Plug 'dense-analysis/ale'

call plug#end()
