vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)]])
