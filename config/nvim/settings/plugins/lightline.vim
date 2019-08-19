let g:lightline = { 'colorscheme': 'seoul256' }

" tabline
:set showtabline=2
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
