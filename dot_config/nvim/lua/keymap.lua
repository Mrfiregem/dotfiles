local map = vim.api.nvim_set_keymap
--[[
-- map('mode', 'key-seq', 'command', { options })
-- See `:h :map-arguments` -buffer +noremap
--]]

--[[
-- Replace vim escape codes with internal representation
local function term(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
--]]

local noremap = {noremap = true}
local nore_silent = {noremap = true, silent = true}
-- Map leader key
map("n", ",", "", {}) -- Disable comma for later
vim.g.mapleader = [[\]]
vim.g.maplocalleader = ","

-- Misc bindings
map("n", "<Leader> ", "<Cmd>nohlsearch<CR>", nore_silent)
map("i", "<C-s>", "<Cmd>update<CR>", noremap)

-- Window navigation
map("n", "<C-j>", "<C-w>j", noremap)
map("n", "<C-k>", "<C-w>k", noremap)
map("n", "<C-h>", "<C-w>h", noremap)
map("n", "<C-l>", "<C-w>l", noremap)

-- Buffer navigation
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", nore_silent)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", nore_silent)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", nore_silent)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", nore_silent)
map("n", "<A-c>", "<Cmd>BufferClose<CR>", nore_silent)
map("n", "<Leader>bp", "<Cmd>BufferPick<CR>", nore_silent)

-- nvim LSP functions
map("n", "<F12>", "<Cmd>lua vim.lsp.buf.definition()<CR>", nore_silent)
map("n", "<F2>", "<Cmd>lua vim.lsp.buf.rename()<CR>", nore_silent)
map("n", "<F3>", "<Cmd>lua vim.lsp.buf.formatting()<CR>", nore_silent)
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", nore_silent)

-- Plugin-specific mappings

-- Easy Align
map("x", "ga", "<Plug>(EasyAlign)", {})
map("n", "ga", "<Plug>(EasyAlign)", {})

-- Telescope menus
map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", noremap)
map("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", noremap)
map("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>", noremap)

-- Show docs for current word
function _G.show_documentation()
  local ft = vim.bo.filetype
  local cword = vim.fn.expand("<cword>")
  if ft == "help" or ft == "vim" then
    vim.fn.execute("help " .. cword)
  else
    vim.fn.execute(vim.o.keywordprg .. " " .. cword)
  end
end

map("n", "<C-m>", "<Cmd>call v:lua.show_documentation()<CR>", nore_silent)
