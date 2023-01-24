local map = require('helper').map

map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

local lspconfig = require "lspconfig"
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

local on_attach = function(client, _)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup END]]
    end
end

lspconfig.csharp_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern('*.sln'),
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = { 'csharp-ls' }
		for dir in io.popen("ls -pa " .. new_root_dir .. " | grep -v /]]"):lines() do
			if dir:match(".sln") ~= nil then
				vim.list_extend(new_config.cmd, { '-s', dir })
				break
			end
		end
	end
}

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {documentFormatting = false},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT'},
            diagnostics = {globals = {'vim'}},
            workspace = {library = vim.api.nvim_get_runtime_file("", true)},
            telemetry = {enable = false}
        }
    }
}

lspconfig.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    settings = {
        languages = {
            lua = {{formatCommand = "lua-format -i", formatStdin = true}}
        }
    }
}
