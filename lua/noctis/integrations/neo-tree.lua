-- Neo-tree integration for Noctis themes

local M = {}

-- Apply Neo-tree highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight

  highlight("NeoTreeNormal", { fg = c.fg, bg = c.bg_alt })
  highlight("NeoTreeNormalNC", { fg = c.fg, bg = c.bg_alt })
  highlight("NeoTreeDirectoryName", { fg = c.func })
  highlight("NeoTreeDirectoryIcon", { fg = c.misc })
  highlight("NeoTreeRootName", { fg = c.keyword, style = "bold" })
  highlight("NeoTreeGitModified", { fg = c.constant })
  highlight("NeoTreeGitAdded", { fg = c.string })
  highlight("NeoTreeGitDeleted", { fg = c.invalid })
end

return M
