-- GitSigns integration for Noctis themes

local M = {}

-- Apply GitSigns highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight
  
  highlight("GitSignsAdd", { fg = c.string })
  highlight("GitSignsChange", { fg = c.misc })
  highlight("GitSignsDelete", { fg = c.invalid })
end

return M
