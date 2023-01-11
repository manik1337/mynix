require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          personal = "~/ws/neorg",
          work = "~/ws/work/neorg",
        },
        index = "~/ws/index.norg",
      }
    }
  }
}
