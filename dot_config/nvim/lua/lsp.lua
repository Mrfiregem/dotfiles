-- Import module
vim.cmd("packadd! nvim-lspconfig")

local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local lsp_caps = vim.lsp.protocol.make_client_capabilities()
local cmp_caps = cmp_lsp.update_capabilities(lsp_caps)
local null_ls = require("null-ls")

--[ LSPconfig setup ]

lspconfig.jedi_language_server.setup { capabilities = cmp_caps }
lspconfig.nimls.setup { capabilities = cmp_caps }
lspconfig.rust_analyzer.setup { capabilities = cmp_caps }
lspconfig.texlab.setup { capabilities = cmp_caps }
lspconfig.zls.setup { capabilities = cmp_caps }
lspconfig.sumneko_lua.setup {
  capabilities = cmp_caps,
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      runtime = { version = "5.4", path = "lua" },
      diagnostics = { globals = { "vim" } },
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

--[ Null-LS ]
local nl_format = null_ls.builtins.formatting
local nl_diag = null_ls.builtins.diagnostics
local nl_action = null_ls.builtins.code_actions
local nl_complete = null_ls.builtins.completion
null_ls.setup {
  diagnostics_format = "#{m} (#{s})",
  sources = {
    -- Formatting
    nl_format.black,
    nl_format.fish_indent,
    nl_format.isort,
    nl_format.nimpretty,
    nl_format.prettier,
    nl_format.shfmt,
    nl_format.stylua,
    nl_format.taplo,
    nl_format.zigfmt,
    -- Diagnostics
    nl_diag.flake8,
    nl_diag.shellcheck,
    nl_diag.teal,
    -- Code actions
    nl_action.gitsigns,
    nl_action.shellcheck,
    -- Completion
    nl_complete.luasnip,
  },
}
