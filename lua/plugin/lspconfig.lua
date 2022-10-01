local map = require('helper').map

map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

local lspconfig = require"lspconfig"
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.csharp_ls.setup{
	capabilities = capabilities,
}

lspconfig.sumneko_lua.setup{
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
