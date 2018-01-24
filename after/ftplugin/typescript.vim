let g:ale_linters = {
\  'typescript': ['tslint'],
\}

if !has("nvim")
  if has("lua")
    let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
  endif
endif
