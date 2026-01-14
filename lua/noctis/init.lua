-- Noctis for Neovim
-- Main module

local M = {}

-- Load a specific theme
function M.setup(opts)
  opts = opts or {}
  local theme = opts.theme or "noctis"
  
  require("noctis.theme").load(theme)
end

return M
