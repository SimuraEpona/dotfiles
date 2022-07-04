-- This Neovim config file is inspired by
-- https://github.com/LunarVim/Neovim-from-scratch
-- https://github.com/tjdevries/config_manager
--

require("core")
require("core.options")

vim.defer_fn(function()
  require("core.utils").load_mappings()
end, 0)

require("plugins")

vim.cmd([[colorscheme edge]])

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]] ,
  false
)
