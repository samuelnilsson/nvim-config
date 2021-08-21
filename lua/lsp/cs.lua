local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local omnisharp_dir = os.getenv('OMNISHARP_DIRECTORY')

if omnisharp_dir then
    local pid = vim.fn.getpid()
    local omnisharp_bin = (omnisharp_dir .. '/OmniSharp.exe')

    lsp_config.omnisharp.setup {
        cmd = {omnisharp_bin, '--languageserver', "--hostPID", tostring(pid)}
    }
end
