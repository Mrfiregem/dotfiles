local cmp = require("cmp")

cmp.setup {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources {
    { name = "nvim_lua" }, -- For neovim's Lua API
    { name = "nvim_lsp" }, -- For LSP completions
    { name = "buffer" },
  },
}
