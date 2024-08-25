require("avante").setup {
  -- provider = "claude",
  -- claude = {
  --   endpoint = "https://api.anthropic.com",
  --   model = "claude-3-5-sonnet-20240620",
  --   temperature = 0,
  --   max_tokens = 4096,
  -- },
  provider = "openai",
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o",
    timeout = 30000, -- Timeout in milliseconds
    temperature = 0,
    max_tokens = 4096,
    ["local"] = false,
  },
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
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      align = "center", -- left, center, right for title
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
