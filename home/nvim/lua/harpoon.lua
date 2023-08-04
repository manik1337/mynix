local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<Leader>hh', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>hj', '<cmd>lua require("harpoon.ui").nav_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>hk', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', opts)
