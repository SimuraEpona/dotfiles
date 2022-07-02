local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require("lspconfig")

  -- lspservers with default config
  local servers = {
    "html",
    "cssls",
    "elixirls",
    "sumneko_lua",
    "erlangls",
    "jsonls",
  }

  for _, lsp in ipairs(servers) do
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
    }

    if lsp == "sumneko_lua" then
      local sumneko_opts = require("custom.plugins.sumneko_lua")
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    lspconfig[lsp].setup(opts)
  end
end

return M
