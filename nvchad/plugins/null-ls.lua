local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),

  -- Lua
  b.formatting.stylua,
}

null_ls.setup({
  debug = true,
  sources = sources,
  -- format on save
  -- on_attach = function(client)
  --   if client.resolved_capabilities.document_formatting then
  --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  --   end
  -- end,
})
