require('avante_lib').load()
require("avante").setup {
  provider = "copilot",
  auto_suggestions_provider = "copilot",
  copilot = {
    endpoint = "https://api.githubcopilot.com",
    -- model = "gpt-4o-2024-05-13",
    model = "claude-3.5-sonnet",
    proxy = nil,
    allow_insecure = false,
    timeout = 30000,
    temperature = 0,
    max_tokens = 4096,
  },
  build = "make",
  mappings = {
    ask = "<leader>aa",
    edit = "<leader>ae",
    refresh = "<leader>ar",
    diff = {
      ours = "co",
      theirs = "ct",
      none = "c0",
      both = "cb",
      next = "]x",
      prev = "[x",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
  },
  hints = { enabled = true },
  windows = {
    wrap = true,
    width = 30,
    sidebar_header = {
      align = "center",
      rounded = true,
    },
  },
  highlights = {
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  diff = {
    debug = false,
    autojump = true,
    list_opener = "copen",
  },
}
