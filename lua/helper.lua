local helper = {}

function helper.map(mode, key, fn, opts)
	local options = {noremap = true, silent = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, key, fn, options)
end

return helper
