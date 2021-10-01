local map = require('helper').map

map('n', '<Leader>tt', '<cmd>:NvimTreeToggle<CR>')

require('nvim-tree').setup()
