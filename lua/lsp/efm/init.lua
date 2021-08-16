local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')
local eslint = require('lsp.efm.eslint')
local prettier = require('lsp.efm.prettier')
local luaformat = require('lsp.efm.luaformat')

local efm_root_markers = {'package.json', '.git'}
local efm_languages = {
    yaml = {prettier},
    json = {prettier},
    markdown = {prettier},
    javascript = {eslint, prettier},
    javascriptreact = {eslint, prettier},
    typescript = {eslint, prettier},
    typescriptreact = {eslint, prettier},
    css = {prettier},
    scss = {prettier},
    sass = {prettier},
    less = {prettier},
    json = {prettier},
    graphql = {prettier},
    vue = {prettier},
    html = {prettier},
    lua = {luaformat}
}

lsp_config.efm.setup({
    cmd = {"efm-langserver"},
    filetypes = vim.tbl_keys(efm_languages),
    on_attach = on_attach,
    root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),
    init_options = {documentFormatting = true},
    settings = {rootMarkers = efm_root_markers, languages = efm_languages}
})
