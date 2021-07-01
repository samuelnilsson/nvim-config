require'lualine'.setup{
	options = {
		theme = 'onedark'
	},
	sections = {
		lualine_x = {"os.data('%a')", 'data', require'lsp-status'.status}
	}
}
