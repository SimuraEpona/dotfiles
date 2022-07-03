local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local M = {}

local utils = require("core.utils")

require("ui.lsp")

M.on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  local lsp_mappings = require("core.mappings").lspconfig
  utils.load_mappings({ lsp_mappings }, { buffer = bufnr })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local servers = {
  "sumneko_lua",
  "elixirls",
  "cssls",
  "tsserver",
  "tailwindcss",
  "erlangls",
  "jsonls",
}

local merge_tb = vim.tbl_deep_extend

for _, server in ipairs(servers) do
  local opts = {
    on_attach = M.on_attach,
    capabilities = capabilities,
  }

  if server == "jsonls" then
    local jsonls_opts = require("plugins.configs.lsp.jsonls")
    opts = merge_tb("force", jsonls_opts, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require("plugins.configs.lsp.sumneko_lua")
    opts = merge_tb("force", sumneko_opts, opts)
  end

  lspconfig[server].setup(opts)

end

return M
