-- NvimTree integration for Noctis themes

local M = {}

-- Apply NvimTree highlights
function M.apply_highlights(colors)
  local c = colors
  local highlight = require("noctis.theme").highlight

  highlight("NvimTreeNormal", { fg = c.fg, bg = c.bg_alt })
  highlight("NvimTreeFolderName", { fg = c.func })
  highlight("NvimTreeFolderIcon", { fg = c.misc })
  highlight("NvimTreeOpenedFolderName", { fg = c.func, style = "bold" })
  highlight("NvimTreeRootFolder", { fg = c.keyword, style = "bold" })
  highlight("NvimTreeSpecialFile", { fg = c.keyword })
  highlight("NvimTreeGitDirty", { fg = c.constant })
  highlight("NvimTreeGitNew", { fg = c.string })
  highlight("NvimTreeGitDeleted", { fg = c.invalid })
end

return M
