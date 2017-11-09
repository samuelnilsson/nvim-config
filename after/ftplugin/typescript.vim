setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

set ts=2 sw=2 et

function! neomake#makers#ft#typescript#EnabledMakers() abort
    return ['tsc', 'tslint']
endfunction

function! neomake#makers#ft#typescript#tsc() abort
    " tsc should not be passed a single file.
    let maker = {
        \ 'args': ['--noEmit', '--watch', 'false', '--pretty', 'false'],
        \ 'append_file': 0,
        \ 'errorformat':
            \ '%E%f %#(%l\,%c): error %m,' .
            \ '%E%f %#(%l\,%c): %m,' .
            \ '%Eerror %m,' .
            \ '%C%\s%\+%m'
        \ }
    let config = neomake#utils#FindGlobFile('tsconfig.json')
    if !empty(config)
        let maker.args += ['--project', config]
    endif
    return maker
endfunction

function! neomake#makers#ft#typescript#tslint() abort
    let maker = {
        \ 'errorformat': '%EERROR: %f[%l\, %c]: %m,%E%f[%l\, %c]: %m',
        \ }
    let config = neomake#utils#FindGlobFile('tsconfig.json')
    if !empty(config)
        let maker.args = ['--type-check --project', config]
        let maker.cwd = fnamemodify(config, ':h')
    endif
    return maker
endfunction

if !has("nvim")
  if has("lua")
    set nocompatible
    set completeopt+=menuone
    set rtp+=~/work/neocomplete.vim/
    set rtp+=~/work/vimproc.vim/
    set rtp+=~/.cache/neobundle/tsuquyomi/

    filetype plugin indent on
    let g:neocomplete#enable_at_startup = 1
    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
  endif
endif
