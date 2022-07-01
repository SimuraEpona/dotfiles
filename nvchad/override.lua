local M = {}

M.treesitter = {
  ensure_installed = {
    "html",
    "css",
    "javascript",
    "json",
    "markdown",
    "lua",
    "eex",
    "elixir",
    "heex",
    "php",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = {
       "node_modules/.*",
       "deps/.*",
       "_build/.*",
       "vendor/.*",
       "dotbot/.*",
       ".git/*"
    },
  }
}

M.blankline = {
   filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "nvchad_cheatsheet",
      "lsp-installer",
      "norg",
      "",
   },
}

return M
