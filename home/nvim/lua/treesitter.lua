require'nvim-treesitter.configs'.setup {
  parser_install_dir = "~/.local/share/nvim/site",
  sync_install = false,

  highlight = {
    enable = true,
    use_languagetree = false,
    additional_vim_regex_highlighting = false,
  }
}
