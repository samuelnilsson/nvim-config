local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local pid = vim.fn.getpid()
local home = os.getenv('HOME')
local omnisharp_bin = (home .. '/scoop/apps/omnisharp/current/OmniSharp.exe')

lsp_config.omnisharp.setup{
    cmd = { omnisharp_bin, '--languageserver' , "--hostPID", tostring(pid) };
}
