local M = {}
local api = vim.api

local merge_tb = vim.tbl_deep_extend

M.load_config = function()
  local config = require("core.default_config")
  return config
end

M.load_mappings = function(mappings, mapping_opt)
  -- set mapping function with/without whichkey
  local map_func
  local whichkey_exists, wk = pcall(require, "which-key")

  if whichkey_exists then
    map_func = function(keybind, mapping_info, opts)
      wk.register({ [keybind] = mapping_info }, opts)
    end
  else
    map_func = function(keybind, mapping_info, opts)
      local mode = opts.mode
      opts.mode = nil
      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end

  mappings = mappings or vim.deepcopy(M.load_config().mappings)
  mappings.lspconfig = nil

  for _, section_mappings in pairs(mappings) do
    -- skip mapping this as its mapppings are loaded in lspconfig
    for mode, mode_mappings in pairs(section_mappings) do
      for keybind, mapping_info in pairs(mode_mappings) do
        -- merge default + user opts

        local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
        local opts = merge_tb("force", default_opts, mapping_info.opts or {})

        if mapping_info.opts then
          mapping_info.opts = nil
        end

        map_func(keybind, mapping_info, opts)
      end
    end
  end

end

return M
