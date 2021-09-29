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
    ["<kEnter>"] = cmp.mapping.confirm({select = true}),
  },
  sources = {
    {name = "buffer"}, -- For words in opened buffers
    {name = "luasnip"}, -- For snippets
    {name = "neorg"}, -- For Neorg documents
    {name = "nvim_lsp"}, -- For LSP completions
    {name = "nvim_lua"}, -- For neovim's Lua API
  },
}
