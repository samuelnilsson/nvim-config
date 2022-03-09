vim.g.coc_global_extensions = {
	"coc-tsserver",
	"coc-eslint",
	"coc-prettier",
	"coc-css",
	"coc-powershell",
	"coc-omnisharp",
	"coc-json",
	"coc-lists",
	"coc-snippets",
	"coc-sumneko-lua"
}

vim.api.nvim_set_keymap("n", "<Leader>rn", "<Plug>(coc-rename)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>dn", "<Plug>(coc-diagnostic-next)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>ca", "<Plug>(coc-code-action)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>gd", "<Plug>(coc-definition)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>gi", "<Plug>(coc-implementation)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>f", "<Plug>(coc-format-selected)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>rn", "<Plug>(coc-rename)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>rf", "<Plug>(coc-references)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>qf", "<Plug>(coc-fix-current)", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>cf", "<cmd>:CocFix<CR>", { noremap = false })

-- Snippets

vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(coc-snippets-expand)", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-j>", "<Plug>(coc-snippets-select)", { noremap = false })
vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)", { noremap = false })

-- Outline

vim.api.nvim_set_keymap("n", "<Leader>ss", "<cmd>:CocOutline<CR>", { noremap = false })
