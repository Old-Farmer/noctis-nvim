-- Alpha (Dashboard) integration for Noctis themes

local M = {}

-- Apply Alpha highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight
  
  highlight("AlphaHeader", { fg = c.keyword })
  highlight("AlphaButtons", { fg = c.func })
  highlight("AlphaShortcut", { fg = c.misc })
  highlight("AlphaFooter", { fg = c.comment, style = "italic" })
end

return M
