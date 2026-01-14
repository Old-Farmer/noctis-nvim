-- Notify integration for Noctis themes

local M = {}

-- Apply Notify highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight

  highlight("NotifyERRORBorder", { fg = c.invalid })
  highlight("NotifyWARNBorder", { fg = c.constant })
  highlight("NotifyINFOBorder", { fg = c.misc })
  highlight("NotifyDEBUGBorder", { fg = c.comment })
  highlight("NotifyTRACEBorder", { fg = c.keyword })
  highlight("NotifyERRORTitle", { fg = c.invalid })
  highlight("NotifyWARNTitle", { fg = c.constant })
  highlight("NotifyINFOTitle", { fg = c.misc })
  highlight("NotifyDEBUGTitle", { fg = c.comment })
  highlight("NotifyTRACETitle", { fg = c.keyword })
end

return M
