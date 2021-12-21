local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'       -- Package manager
  use 'tpope/vim-surround'
  use 'mattn/emmet-vim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- UI to select things (files, grep results, open buffers...)
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  -- Add indentation guides even on blank lines
  use { 'lukas-reineke/indent-blankline.nvim' }
  -- Add git related info in the signs columns and popups
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
    end 
  }
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require('gitlinker').setup()
    end
  }

  use 'neovim/nvim-lspconfig'        -- Collection of configurations for built-in LSP client
  use 'folke/tokyonight.nvim'
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function() require'nvim-tree'.setup {} end}
  use 'nvim-telescope/telescope-symbols.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use 'tpope/vim-rails'


  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Database Manage
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  -- use 'kristijanhusak/vim-dadbod-completion'  -- Currently not working, solve it later

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)