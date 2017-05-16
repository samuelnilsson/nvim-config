setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

set ts=2 sw=2 et

nnoremap <F12> :TernDef<cr>
nnoremap <c-F12> :TernRefs<cr>
nnoremap <Leader>rn :TernRename

let g:formatters_javascript = ['eslint_local']
