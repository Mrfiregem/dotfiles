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

lspconfig.texlab.setup {
  capabilities = cmp_caps,
  settings = {
    build = {
      args = {"-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f"},
    },
    chktex = {onOpenAndSave = true},
    latexindent = {modifyLineBreaks = true},
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
local taplofmt = {formatCommand = "taplo format --silent -", formatStdin = true}
local nimpretty = {formatCommand = "nimpretty --out:/dev/stdout"}

lspconfig.efm.setup {
  capabilities = cmp_caps,
  init_options = {documentFormatting = true},
  filetypes = {"lua", "nim", "python", "sh", "toml"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {lua_format},
      nim = {nimpretty},
      python = {yapf},
      sh = {shfmt, shellcheck},
      toml = {taplofmt},
    },
  },
}
