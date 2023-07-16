require("copilot").setup {
  panel = {
    auto_refresh = true,
  },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = false,
      accept_word = "<M-l>",
      accept_line = "<M-j>",
    },
  },
}
