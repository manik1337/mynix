require("copilot").setup {
  panel = {
    auto_refresh = true,
  },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<M-j>",
      accept_line = "<M-k>",
      accept_word = "<M-l>",
    },
  },
  filetypes = {
    yaml = true,
  },
}
