local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

local options = {
  ensure_installed = {
    "css",
    "eex",
    "elixir",
    "erlang",
    "heex",
    "html",
    "javascript",
    "json",
    "lua",
    "yaml",
  },
  highlight = {
    enable = true,
    use_languatetree = true,
  },
}

treesitter.setup(options)
