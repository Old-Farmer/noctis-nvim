-- FZF-lua integration for Noctis themes

local M = {}

-- Apply FZF-lua highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight

  highlight("FzfLuaBorder", { fg = c.border, bg = c.bg_alt })
  highlight("FzfLuaNormal", { fg = c.fg, bg = c.bg_alt })
  highlight("FzfLuaHeader", { fg = c.func, bg = c.bg_alt, style = "bold" })
  highlight("FzfLuaTitle", { fg = c.keyword, bg = c.bg_alt, style = "bold" })
  highlight("FzfLuaPreviewBorder", { fg = c.border, bg = c.bg })
  highlight("FzfLuaPreviewNormal", { fg = c.fg, bg = c.bg })
  highlight("FzfLuaPreviewScrollbar", { fg = c.fg_gutter, bg = c.bg })
  highlight("FzfLuaPreviewCursorLine", { bg = c.bg_highlight })
  highlight("FzfLuaCursor", { fg = c.bg, bg = c.keyword })
  highlight("FzfLuaCursorLine", { bg = c.bg_highlight })
  highlight("FzfLuaSearch", { fg = c.keyword, style = "bold" })
  highlight("FzfLuaScrollBorder", { fg = c.border })
end

return M
