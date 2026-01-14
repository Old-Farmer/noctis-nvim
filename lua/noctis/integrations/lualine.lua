-- Lualine integration for Noctis themes

local M = {}

-- Apply Lualine highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight
  
  highlight("LualineNormal", { fg = c.fg, bg = c.bg_alt })
  highlight("LualineInsert", { fg = c.bg, bg = c.string })
  highlight("LualineVisual", { fg = c.bg, bg = c.keyword })
  highlight("LualineReplace", { fg = c.bg, bg = c.invalid })
  highlight("LualineCommand", { fg = c.bg, bg = c.misc })
end

return M
