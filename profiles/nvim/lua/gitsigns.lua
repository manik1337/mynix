require('gitsigns').setup {
  signcolumn = false,
  numhl = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 0,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>gp', gs.preview_hunk)
  end
}
