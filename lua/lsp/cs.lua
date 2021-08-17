local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local pid = vim.fn.getpid()
local omnisharp_bin = (os.getenv('OMNISHARP_DIRECTORY') .. '/OmniSharp.exe')

lsp_config.omnisharp.setup{
    cmd = { omnisharp_bin, '--languageserver' , "--hostPID", tostring(pid) };
}
