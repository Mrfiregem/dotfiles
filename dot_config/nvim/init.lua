-- Packages installed with paq
require("packages")

-- Neovim LSP configuration
require("lsp")

-- Treesitter setup
require("treesitter")

-- Completion plugin settings
require("completion")

-- Nvim and package key bindings
require("keymap")

-- [Options]
-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = "a"
vim.opt.title = true

-- Allow switching from unsaved buffers
vim.opt.hidden = true

-- Open split windows differently
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Buffer between mouse and edge when scrolling.
vim.opt.scrolloff = 4

-- Gutter to the left of linenumber
vim.opt.signcolumn = "yes"

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  extends = "›",
  precedes = "‹",
  nbsp = "·",
  trail = "·",
}

-- Use 2 spaces for indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- [ Packages ]
-- Colorscheme
require("kanagawa").setup { transparent = true }
vim.api.nvim_command("colorscheme kanagawa")
require("lualine").setup { options = { theme = "kanagawa" } }

-- nvim-cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" }

