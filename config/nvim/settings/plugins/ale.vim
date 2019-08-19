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
