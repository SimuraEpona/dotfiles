-- `:h options` for more options
local options = {
  backup = false,                          -- creates a backup file 
  -- clipboard = "unnamed",                   -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  mouse = "a",                             -- allow the mouse to be used in neovim
  hidden = true,                           -- do not save when switching buffers
  pumheight = 10,                          -- pop up menu height
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  inccommand = "nosplit",                  -- incremental live completion
  fileencodings = "utf-8,sjis,default"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
