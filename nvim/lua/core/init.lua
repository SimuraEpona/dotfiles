-- autocmds
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

vim.t.bufs = vim.api.nvim_list_bufs()
