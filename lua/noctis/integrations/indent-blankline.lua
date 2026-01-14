-- Indent Blankline integration for Noctis themes

local M = {}

-- Apply Indent Blankline highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight

  highlight("IndentBlanklineChar", { fg = c.border })
  highlight("IndentBlanklineContextChar", { fg = c.fg_gutter })
  highlight("IblIndent", { fg = c.border })
  highlight("IblScope", { fg = c.fg_gutter })
end

return M
