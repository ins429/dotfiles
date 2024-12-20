" nnoremap <silent> <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <C-p> :Files<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden --path-to-ignore ~/.ignore'
