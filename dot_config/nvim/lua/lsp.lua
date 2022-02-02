-- Import module
vim.cmd("packadd! nvim-lspconfig")

local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local lsp_caps = vim.lsp.protocol.make_client_capabilities()
local cmp_caps = cmp_lsp.update_capabilities(lsp_caps)

--[ LSPconfig setup ]

lspconfig.jedi_language_server.setup {capabilities = cmp_caps}

lspconfig.rust_analyzer.setup {capabilities = cmp_caps}

lspconfig.nimls.setup {capabilities = cmp_caps}

lspconfig.zls.setup {capabilities = cmp_caps}

lspconfig.sumneko_lua.setup {
  capabilities = cmp_caps,
  cmd = {"lua-language-server"},
  settings = {
    Lua = {
      runtime = {version = "5.4", path = "lua"},
      diagnostics = {globals = {"vim"}},
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.expand("$PWD/lua_modules/lib/lua")] = true,
          [vim.fn.expand("$PWD/lua_modules/share/lua")] = true,
        },
      },
    },
  },
}
