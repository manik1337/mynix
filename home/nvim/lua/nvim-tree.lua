require 'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw  = true,
  open_on_tab   = false,
  hijack_cursor = false,
  update_cwd    = false,
  diagnostics = {
    enable = true,
    icons = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    side = 'right',
  }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>pp', ':NvimTreeFindFileToggle <CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>pP', ':NvimTreeFindFile <CR>', opts)
