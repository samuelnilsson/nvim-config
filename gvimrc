set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set anti enc=utf-8
if has("win32")
  set guifont=DejaVu_Sans_Mono:h11:cANSI
else
  set guifont=DejaVu\ Sans\ Mono\ 11
endif

"Start as maximized window
autocmd GUIEnter * simalt ~x
