local saga = require('lspsaga')
local keymap = vim.keymap.set

saga.init_lsp_saga({
	border_style = "rounded",
	code_action_icon = "",
})

local signs = {
    Error = " ",
    Warning = " ",
    Hint = "",
    Information = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

keymap("n", "<leader>fn", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "<leader>sd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>sd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })
keymap("n", "<leader>dc", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

keymap("n", "<C-g>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
keymap("t", "<C-g>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
