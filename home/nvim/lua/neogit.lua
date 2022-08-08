local neogit = require("neogit")

neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_insert_on_commit = false,
  auto_refresh = true,
  use_magit_keybindings = true,
  commit_popup = {
    kind = "split",
  },
  popup = {
    kind = "split",
  },
}
