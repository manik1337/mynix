require'nvim-treesitter.configs'.setup {
  parser_install_dir = "~/.local/share/nvim/site",
  ensure_installed = {
    "elixir",
    "erlang",
    "rust",
    "go",
    "javascript",
    "python",
    "typescript",
    "solidity",
    "ocaml",
    "haskell",
    "scala",

    "nix",
    "lua",
    "dockerfile",
    "json",
    "markdown"
  },
  sync_install = false,

  highlight = {
    enable = true,
    use_languagetree = false,
    additional_vim_regex_highlighting = false,
  }
}
