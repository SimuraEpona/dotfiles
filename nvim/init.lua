-- This Neovim config file is inspired by
-- https://github.com/LunarVim/Neovim-from-scratch
-- https://github.com/tjdevries/config_manager
--

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.lsp"

-- Turn off builtin plugins I do not use.
require "user.disable_builtin"

vim.g.dbs = {
  dev =  'postgres://postgres:secret@127.0.0.1:5432/comiru'
}

vim.api.nvim_command('autocmd BufRead,BufNewFile *.blade.php set filetype=blade')

vim.wo.signcolumn="yes"

--Map blankline
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)


require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
}

-- Emmet config
vim.g.user_emmet_leader_key=','

