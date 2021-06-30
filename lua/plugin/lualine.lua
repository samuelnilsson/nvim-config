require'lualine'.setup{
	sections = {
		lualine_x = {"os.data('%a')", 'data', require'lsp-status'.status}
	}
}
