setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

set ts=2 sw=2 et

nnoremap <F12> :TsuDefinition<cr>
nnoremap <c-F12> :TsuReferences<cr>
nnoremap <Leader>rn :TsuRenameSymbol<cr>

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
