require'nvim-treesitter.configs'.setup {
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
    "yaml"
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "kotlin", "latex" },  -- list of language that will be disabled
  },
}

