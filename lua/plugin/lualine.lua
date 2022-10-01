local sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch", "diff", "require'lsp-status'.status()" },
	lualine_c = { "filename" },
	lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
}

require("lualine").setup({
	options = { theme = "onedark" },
	sections = sections
})
