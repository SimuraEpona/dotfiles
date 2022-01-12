local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Leader>r", ":SymbolsOutline<CR>", opts)
