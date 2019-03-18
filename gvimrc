if has('nvim')
	if exists('g:GtkGuiLoaded')
		set linespace=3
		call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
		call rpcnotify(1, 'Gui', 'Font', 'DejaVuSansMono Nerd Font 11')
	endif
else
	set linespace=3

	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar

	set antialias enc=utf-8
	if has('win32')
		set guifont=DejaVu_Sans_Mono:h11:cANSI
	else
		set guifont=DejaVu\ Sans\ Mono\ 11
	endif

	"Start as maximized window
	augroup window_size
		autocmd GUIEnter * simalt ~x
	augroup END
endif
