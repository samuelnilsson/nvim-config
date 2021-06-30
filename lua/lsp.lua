local map = require('helper').map

local function setup_servers()
	require'lspinstall'.setup()
	local servers = require'lspinstall'.installed_servers()
	for _, server in pairs(servers) do
		require'lspconfig'[server].setup{}
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
	setup_servers()
	vim.cmd("bufdo e")
end

map('n', '<Leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<Leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<Leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>')
