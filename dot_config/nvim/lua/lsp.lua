-- Import module
vim.cmd("packadd! nvim-lspconfig")

local lspconfig = require("lspconfig")
local cmp_caps = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol
                                                               .make_client_capabilities())

-- LSPconfig setup --
---------------------

lspconfig.jedi_language_server.setup {capabilities = cmp_caps}

lspconfig.rust_analyzer.setup {capabilities = cmp_caps}

lspconfig.nimls.setup {capabilities = cmp_caps}

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

local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local lua_format = {formatCommand = "lua-format", formatStdin = true}
local shfmt = {formatCommand = "shfmt -ci -s -i 2", formatStdin = true}
local shellcheck = {
  lintCommand = "shellcheck -f gcc -x",
  lintFormats = {
    "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m",
  },
}
local latexindent = {formatCommand = "latexindent", formatStdin = true}
local chktex = {
  lintCommand = "chktex -q -s: -v7",
  lintFormats = {
    "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tessage: %m",
  },
  lintStdin = true,
  lintIgnoreExitCode = true,
  listCategoryMap = {M = "I"},
}

lspconfig.efm.setup {
  capabilities = cmp_caps,
  init_options = {documentFormatting = true},
  filetypes = {"lua", "python", "sh", "tex"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = {yapf},
      lua = {lua_format},
      sh = {shfmt, shellcheck},
      tex = {latexindent, chktex},
    },
  },
}
