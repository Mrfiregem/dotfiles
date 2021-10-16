local neorg = require("neorg")

neorg.setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.completion"] = {config = {engine = "nvim-cmp"}},
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          main = "~/docs/neorg",
          school = "~/docs/school",
        },
        autodetect = true,
        autochdir = true,
      },
    },
    ["core.integrations.telescope"] = {},
  },

  hook = require("neorgconf.keybinds"),
}

