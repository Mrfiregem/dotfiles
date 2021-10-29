local cmp = require("cmp")

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<kUp>"] = cmp.mapping.scroll_docs(-4),
    ["<kDown>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({select = true}),
  },
  sources = {
    {name = "nvim_lua"}, -- For neovim's Lua API
    {name = "nvim_lsp"}, -- For LSP completions
    {name = "luasnip"}, -- For snippets
    {name = "neorg"}, -- For Neorg documents
  },
}
