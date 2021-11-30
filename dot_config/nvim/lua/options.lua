vim.opt.completeopt = {"menu", "menuone", "noselect"}

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.hidden = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  extends = "›",
  precedes = "‹",
  nbsp = "·",
  trail = "·",
}

vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- PACKAGES
-- Colorscheme
vim.opt.termguicolors = true
vim.api.nvim_command[[colorscheme tokyonight]]

vim.g.vimtex_compiler_latexmk_engines = {_ = "-xelatex"}
