return {
  ["mattn/emmet-vim"] = {},
  ["tpope/vim-surround"] = {},
  ["tpope/vim-fugitive"] = {},
  ["tpope/vim-rhubarb"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls")
    end,
  },
}
