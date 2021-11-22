vim.cmd [[autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 1000)]]
