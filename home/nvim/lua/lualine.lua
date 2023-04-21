require('lualine').setup {
  -- lualine_c = { 'filename', 'g:metals_status', 'lsp-progress' },
  options = {
    theme = 'auto';
    globalstatus = true;
  },
  extensions = { 'nvim-tree' },
}
