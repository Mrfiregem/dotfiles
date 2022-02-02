local neorg = require("neorg")

neorg.setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.keybinds"] = {
      config = { default_keybinds = true, neorg_leader = "<Leader>o" },
    },
    ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
    ["core.norg.concealer"] = { config = { markup_preset = "dimmed" } },
    ["core.norg.dirman"] = {
      config = {
        workspaces = { main = "~/docs/neorg", school = "~/docs/school" },
        autodetect = true,
        autochdir = true,
      },
    },
    ["core.integrations.telescope"] = {},
  },
}
