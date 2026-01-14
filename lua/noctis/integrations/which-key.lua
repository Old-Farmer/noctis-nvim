-- Which-key integration for Noctis themes

local M = {}

-- Apply Which-key highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight
  
  highlight("WhichKey", { fg = c.keyword })
  highlight("WhichKeyGroup", { fg = c.func })
  highlight("WhichKeyDesc", { fg = c.fg })
  highlight("WhichKeySeparator", { fg = c.comment })
  highlight("WhichKeyFloat", { bg = c.bg_alt })
end

return M
