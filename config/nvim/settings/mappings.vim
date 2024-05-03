" Splitting
map <Leader>- :split<CR>
map <Leader><bar> :vsplit<CR>

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

" fzf
" nnoremap <silent> <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <C-p> :Files<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden --path-to-ignore ~/.ignore'

" python formatter
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>
