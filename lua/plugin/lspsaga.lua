local saga = require('lspsaga')
local map = require('helper').map

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

map("n", "<leader>fn", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
map("n", "<leader>sd", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>sd", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
map("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>")
map("n","<leader>o", "<cmd>LSoutlineToggle<CR>")
map("n", "<leader>dc", "<cmd>Lspsaga hover_doc<CR>")

map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
map("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

map("n", "<C-g>", "<cmd>Lspsaga open_floaterm lazygit<CR>")
map("t", "<C-g>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
