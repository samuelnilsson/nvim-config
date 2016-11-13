setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

set ts=4 sw=4 et

nnoremap <c-f> :OmniSharpCodeFormat<cr>
nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap <c-F12> :OmniSharpFindUsages<cr>
nnoremap <Leader>rn :OmniSharpRenameTo 
