local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

lsp_config.powershell_es.setup({
	bundle_path = '~/PowerShellEditorServices',
	cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command', "~/PowerShellEditorServices/PowerShellEditorServices/Start-EditorServices.ps1 ..."},
    on_attach = function(client)
        on_attach(client)
    end
})
