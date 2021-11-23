vim.cmd [[autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 1000)]]

vim.api.nvim_set_keymap("n", "<leader>ta", ":!mix test<CR>", {}) -- test all
vim.api.nvim_set_keymap("n", "<leader>tc", ":!mix test %<CR>", {}) -- test current file
