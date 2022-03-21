local ts_configs = require("nvim-treesitter.parsers").get_parser_configs()
local ts_setup = require("nvim-treesitter.configs")

ts_setup.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "bash",
    "c",
    "css",
    "fish",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "python",
    "regex",
    "rust",
    "toml",
    "vim",
    "yaml",
    "zig",
  },
  highlight = { enable = true },
  indent = { enable = true },
}
