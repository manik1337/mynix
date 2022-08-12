require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "elixir",
    "erlang",
    "rust",
    "go",
    "javascript",
    "python",
    "typescript",
    "solidity",

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
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },

    smart_rename = {
      enable = false,
      keymaps = {
        -- mapping to rename reference under cursor
        smart_rename = "grr",
      },
    },

    navigation = {
      enable = false,
      keymaps = {
        goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD", -- mapping to list all definitions in current file
      },
    },
  },
}
