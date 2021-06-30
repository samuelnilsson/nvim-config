local map = require('helper').map

vim.cmd 'colorscheme base16-tomorrow-night'

vim.g.mapleader = ','
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true

map('', '<Leader>y', '"+y') -- copy to clipboard
map('', '<Leader>p', '"+p') -- paste from clipboard
map('n', '<Space>', ':nohlsearch<Bar>:echo<CR>', {silent = true}) -- Hide search highlight
