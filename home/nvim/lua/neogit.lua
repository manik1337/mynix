local neogit = require('neogit')

neogit.setup {
  kind = "replace",
  integrations = {
    diffview = true
  }
}

vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit <CR>', { noremap = true, silent = true })
