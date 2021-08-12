local map = require('helper').map

local function on_attach(client)
    map('n', '<Leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', '<Leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n', '<Leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>')

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
        vim.api.nvim_command [[augroup END]]
    end
end

return on_attach
