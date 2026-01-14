-- Telescope integration for Noctis themes

local M = {}

-- Apply Telescope highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight

  highlight("TelescopeBorder", { fg = c.border, bg = c.bg_alt })
  highlight("TelescopeNormal", { fg = c.fg, bg = c.bg_alt })
  highlight("TelescopeSelection", { fg = c.fg, bg = c.bg_highlight })
  highlight("TelescopeMatching", { fg = c.keyword })
  highlight("TelescopePromptPrefix", { fg = c.func })
end

return M
