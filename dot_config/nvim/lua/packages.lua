-- Import module
return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Syntax/language plugins
  use "alaviss/nim.nvim"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "https://tildegit.org/sloum/gemini-vim-syntax"
  use {
    "nvim-neorg/neorg",
    requires = {"nvim-lua/plenary.nvim", "vhyrro/neorg-telescope"},
  }
  use {"lervag/vimtex", ft = "tex"}
  use {"mlochbaum/BQN", rtp = "editors/vim"}

  -- Styling plugins
  use "folke/tokyonight.nvim"
  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require("lualine").setup {options = {theme = "tokyonight"}}
    end,
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
  }
  use {
    "romgrk/barbar.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
  }

  -- Feature Plugins
  use "b3nj5m1n/kommentary"
  use "junegunn/vim-easy-align"
  use "machakann/vim-sandwich"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"},
  }

  use "editorconfig/editorconfig-vim"

  use {"neovim/nvim-lspconfig", opt = true}
  use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
    },
  }
end)
