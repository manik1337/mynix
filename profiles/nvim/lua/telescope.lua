local telescope = require('telescope')

telescope.setup {
  defaults = {
    prompt_prefix = "λ "
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}

telescope.load_extension('fzf')

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
