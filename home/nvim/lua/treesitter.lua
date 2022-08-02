require'nvim-treesitter.configs'.setup {
  ensure_installed = { "elixir", "rust", "go" },
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
