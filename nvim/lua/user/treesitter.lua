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
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "kotlin" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "kotlin", "latex" },  -- list of language that will be disabled
  },
}

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

