if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

for config_file in split(glob('~/.config/nvim/settings/**/*'), '\n')
  if filereadable(config_file)
    execute 'source' config_file
  endif
endfor

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" lua require("ins429")
