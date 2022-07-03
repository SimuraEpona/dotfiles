local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use({
    "wbthomason/packer.nvim"
  })

  use({
    "nvim-lua/plenary.nvim",
    module = "plenary",
  })

  use({
    "kyazdani42/nvim-web-devicons",
    moduel = "nvim-web-devicons",
    config = function()
      require("plugins.configs.others").devicons()
    end
  })

  -- Add indentation guides even on blank lines
  use({
    "lukas-reineke/indent-blankline.nvim",
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open("indent-blankline.nvim")
    end,
    config = function()
      require("plugins.configs.others").blankline()
    end
  })

  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugins.configs.telescope")
    end
  })


  use({
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    run = ":TSUpdate",
    setup = function()
      require("core.lazy_load").on_file_open("nvim-treesitter")
    end,
    cmd = require("core.lazy_load").treesitter_cmds,
    config = function()
      require("plugins.configs.treesitter")
    end
  })

  use({
    "williamboman/nvim-lsp-installer",
    opt = true,
    cmd = require("core.lazy_load").lsp_cmds,
    setup = function()
      require("core.lazy_load").on_file_open("nvim-lsp-installer")
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    after = "nvim-lsp-installer",
    module = "lspconfig",
    config = function()
      require("plugins.configs.lsp_installer")
      require("plugins.configs.lspconfig")
    end
  })

  -- load luasnips + cmp related in insert mode only
  use({
    "rafamadriz/friendly-snippets",
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  })

  use({
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("plugins.configs.cmp")
    end
  })

  use({
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").luasnip()
    end,
  })

  use({
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
  })

  use({
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip",
  })

  use({
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua",
  })

  use({
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lua",
  })

  use({
    "hrsh7th/cmp-path",
    after = "cmp-nvim-lua",
  })

  use({
    "kyazdani42/nvim-tree.lua",
    ft = "alpha",
    cmd = {"NvimTreeToggle", "NvimTreeFocus"},
    config = function()
      require("plugins.configs.nvimtree")
    end
  })

  use({
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gc", "gb" },
    config = function()
      require("plugins.configs.others").comment()
    end,
  })

  use({
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").autopairs()
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    opt = true,
    setup = function()
      require("core.lazy_load").gitsigns()
    end,
    config = function()
      require("plugins.configs.others").gitsigns()
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.configs.lualine")
    end
  })

  use("mattn/emmet-vim")

  use("sainnhe/edge") -- Color Scheme

  -- tpope
  use("tpope/vim-surround")
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb") -- github extension for vim-fugitive, :GBrose





  use("akinsho/toggleterm.nvim")



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
