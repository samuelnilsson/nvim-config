set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set anti enc=utf-8
if has('nvim')
  Guifont Dejavu Sans Mono:h11
else
  set guifont=DejaVu_Sans_Mono:h11:cANSI
endif
"Start as mazimized window
autocmd GUIEnter * simalt ~x
