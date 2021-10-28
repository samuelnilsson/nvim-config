local map = require("helper").map

map("n", "<Leader>sf", '<cmd>lua require("plugin.telescope_config").project_files()<CR>')
map("n", "<Leader>sg", '<cmd>lua require("telescope.builtin").live_grep()<CR>')
map("n", "<Leader>sb", '<cmd>lua require("telescope.builtin").buffers()<CR>')
map("n", "<Leader>sh", '<cmd>lua require("telescope.builtin").help_tags()<CR>')
