local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

lsp_config.pyright.setup({
    on_attach = function(client)
        on_attach(client)
    end
})
