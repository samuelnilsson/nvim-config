let g:ale_linters = {'typescript': ['tslint', 'tsserver']}
let g:ale_fixers = {'typescript': ['tslint', 'prettier']}

set tabstop=2
set shiftwidth=2
set expandtab

augroup filetype_typescript
	autocmd!
	autocmd Filetype typescript nnoremap <buffer> <Leader>gd :TSDef<CR>
	autocmd Filetype typescript nnoremap <buffer> <Leader>fd :TSDefPreview<CR>
	autocmd Filetype typescript nnoremap <buffer> <Leader>ft :TSType<CR>

	autocmd Filetype typescript nnoremap <buffer> <Leader>dc :TSDoc<CR>

	autocmd FileType typescript nnoremap <Leader>rn :TSRename<CR>
augroup END
