let b:ale_linters = ['OmniSharp']
let b:OmniSharp_highlight_types = 1

" Update the highlighting whenever leaving insert mode
autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

" The following commands are contextual, based on the cursor position.
autocmd FileType cs nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

" Finds members in the current buffer
autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" Navigate up and down by method/property/field
autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>rn :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
