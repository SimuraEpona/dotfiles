local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
 return
end

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    file_ignore_patterns = {
       "node_modules/.*",
       "deps/.*",
       "_build/.*",
       "dotbot/.*",
       ".git/*"
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
} 

local keymap = vim.api.nvim_set_keymap
local builtin = require("telescope.builtin")
local options = { noremap = true, silent = true}

--Add leader shortcuts
keymap('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
keymap('n', '<leader><space>', "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap('n', '<leader>l', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", options)
keymap('n', '<leader>r', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", options)
keymap('n', '<leader>?', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
keymap('n', '<leader>sd', "<cmd>lua require('telescope.builtin').grep_string()<cr>", options)
keymap('n', '<leader>sp', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap('n', '<leader>gc', "<cmd>lua require('telescope.builtin').git_commits()<jr>", options)
keymap('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", options)
keymap('n', '<leader>gs', "<cmd>lua require('telescope.builtin').git_status()<cr>", options)
keymap('n', '<leader>gp', "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", options)
