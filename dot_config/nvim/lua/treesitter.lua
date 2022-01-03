local ts_parse = require("nvim-treesitter.parsers").get_parser_configs()
local ts_setup = require("nvim-treesitter.configs")

ts_parse.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = {"src/parser.c", "src/scanner.cc"},
    branch = "main",
  },
}

ts_setup.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "bash", "c", "css", "fish", "html", "javascript", "json", "jsonc", "lua",
    "markdown", "norg", "python", "regex", "rust", "toml", "vim", "yaml", "zig",
  },
  highlight = {enable = true},
  indent = {enable = true, disable = {"yaml"}},
}
