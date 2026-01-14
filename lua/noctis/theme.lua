-- Noctis theme utility
local M = {}

-- Apply highlight groups
function M.highlight(group, color)
  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
  local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  vim.cmd(hl)
  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  end
end

-- Load theme
function M.load(theme_name)
  local colors = require("noctis.colors")
  local palette = colors[theme_name]

  if not palette then
    vim.notify("Theme '" .. theme_name .. "' not found", vim.log.levels.ERROR)
    return
  end

  -- Reset colors
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "noctis-" .. theme_name

  local c = palette

  -- Load integrations based on config
  local config = require("noctis").config
  local integrations = config.integrations

  for name, enabled in pairs(integrations) do
    if enabled then
      local ok, module = pcall(require, "noctis.integrations." .. name)
      if ok and module.apply_highlights then
        module.apply_highlights(c)
      end
    end
  end

  -- Editor highlights
  M.highlight("Normal", { fg = c.fg, bg = c.bg })
  M.highlight("NormalFloat", { fg = c.fg, bg = c.bg_alt })
  M.highlight("FloatBorder", { fg = c.border, bg = c.bg_alt })
  M.highlight("ColorColumn", { bg = c.bg_alt })
  M.highlight("Cursor", { fg = c.bg, bg = c.cursor or c.fg })
  M.highlight("CursorLine", { bg = c.bg_highlight })
  M.highlight("CursorLineNr", { fg = c.func, bg = c.bg_highlight })
  M.highlight("LineNr", { fg = c.fg_gutter })
  M.highlight("SignColumn", { fg = c.fg_gutter, bg = c.bg })
  M.highlight("Visual", { bg = c.selection or c.bg_highlight })
  M.highlight("VisualNOS", { bg = c.selection or c.bg_highlight })
  M.highlight("MatchParen", { fg = c.keyword, style = "bold,underline" })
  M.highlight("Search", { fg = c.bg, bg = c.misc })
  M.highlight("IncSearch", { fg = c.bg, bg = c.keyword })
  M.highlight("Substitute", { fg = c.bg, bg = c.keyword })

  -- Statusline
  M.highlight("StatusLine", { fg = c.fg, bg = c.bg_alt })
  M.highlight("StatusLineNC", { fg = c.fg_gutter, bg = c.bg_alt })
  M.highlight("VertSplit", { fg = c.border })
  M.highlight("WinSeparator", { fg = c.border })

  -- Tabline
  M.highlight("TabLine", { fg = c.fg_gutter, bg = c.bg_alt })
  M.highlight("TabLineFill", { bg = c.bg_alt })
  M.highlight("TabLineSel", { fg = c.func, bg = c.bg })

  -- Pmenu (popup menu)
  M.highlight("Pmenu", { fg = c.fg, bg = c.bg_alt })
  M.highlight("PmenuSel", { fg = c.bg, bg = c.func })
  M.highlight("PmenuSbar", { bg = c.bg_highlight })
  M.highlight("PmenuThumb", { bg = c.fg_gutter })

  -- Diff
  M.highlight("DiffAdd", { fg = c.string, bg = c.bg_highlight })
  M.highlight("DiffChange", { fg = c.misc, bg = c.bg_highlight })
  M.highlight("DiffDelete", { fg = c.invalid, bg = c.bg_highlight })
  M.highlight("DiffText", { fg = c.keyword, bg = c.bg_highlight, style = "bold" })

  -- Syntax highlighting
  M.highlight("Comment", { fg = c.comment, style = "italic" })
  M.highlight("Constant", { fg = c.constant })
  M.highlight("String", { fg = c.string })
  M.highlight("Character", { fg = c.string })
  M.highlight("Number", { fg = c.number })
  M.highlight("Boolean", { fg = c.constant })
  M.highlight("Float", { fg = c.number })

  M.highlight("Identifier", { fg = c.variable })
  M.highlight("Function", { fg = c.func })

  M.highlight("Statement", { fg = c.keyword })
  M.highlight("Conditional", { fg = c.keyword })
  M.highlight("Repeat", { fg = c.keyword })
  M.highlight("Label", { fg = c.keyword })
  M.highlight("Operator", { fg = c.keyword })
  M.highlight("Keyword", { fg = c.keyword })
  M.highlight("Exception", { fg = c.keyword })

  M.highlight("PreProc", { fg = c.annotation })
  M.highlight("Include", { fg = c.keyword })
  M.highlight("Define", { fg = c.annotation })
  M.highlight("Macro", { fg = c.annotation })
  M.highlight("PreCondit", { fg = c.annotation })

  M.highlight("Type", { fg = c.support })
  M.highlight("StorageClass", { fg = c.keyword })
  M.highlight("Structure", { fg = c.support })
  M.highlight("Typedef", { fg = c.support })

  M.highlight("Special", { fg = c.misc })
  M.highlight("SpecialChar", { fg = c.stringInterpolated })
  M.highlight("Tag", { fg = c.tag })
  M.highlight("Delimiter", { fg = c.fg })
  M.highlight("SpecialComment", { fg = c.comment, style = "italic" })
  M.highlight("Debug", { fg = c.invalid })

  M.highlight("Underlined", { style = "underline" })
  M.highlight("Ignore", {})
  M.highlight("Error", { fg = c.invalid })
  M.highlight("Todo", { fg = c.keyword, style = "bold,italic" })

  -- Treesitter highlights
  M.highlight("@variable", { fg = c.variable })
  M.highlight("@variable.builtin", { fg = c.constant })
  M.highlight("@variable.parameter", { fg = c.variable })
  M.highlight("@variable.member", { fg = c.variable })

  M.highlight("@constant", { fg = c.constant })
  M.highlight("@constant.builtin", { fg = c.constant })
  M.highlight("@constant.macro", { fg = c.annotation })

  M.highlight("@module", { fg = c.support })
  M.highlight("@label", { fg = c.keyword })

  M.highlight("@string", { fg = c.string })
  M.highlight("@string.regexp", { fg = c.stringInterpolated })
  M.highlight("@string.escape", { fg = c.stringInterpolated })
  M.highlight("@string.special", { fg = c.stringInterpolated })
  M.highlight("@character", { fg = c.string })
  M.highlight("@number", { fg = c.number })
  M.highlight("@boolean", { fg = c.constant })
  M.highlight("@float", { fg = c.number })

  M.highlight("@function", { fg = c.func })
  M.highlight("@function.builtin", { fg = c.support })
  M.highlight("@function.macro", { fg = c.annotation })
  M.highlight("@function.method", { fg = c.func })
  M.highlight("@constructor", { fg = c.support })

  M.highlight("@keyword", { fg = c.keyword })
  M.highlight("@keyword.function", { fg = c.keyword })
  M.highlight("@keyword.operator", { fg = c.keyword })
  M.highlight("@keyword.return", { fg = c.keyword })
  M.highlight("@keyword.exception", { fg = c.keyword })

  M.highlight("@operator", { fg = c.keyword })

  M.highlight("@type", { fg = c.support })
  M.highlight("@type.builtin", { fg = c.support })
  M.highlight("@type.qualifier", { fg = c.keyword })

  M.highlight("@property", { fg = c.variable })
  M.highlight("@field", { fg = c.variable })

  M.highlight("@parameter", { fg = c.variable })

  M.highlight("@comment", { fg = c.comment, style = "italic" })

  M.highlight("@punctuation.delimiter", { fg = c.fg })
  M.highlight("@punctuation.bracket", { fg = c.fg })
  M.highlight("@punctuation.special", { fg = c.keyword })

  M.highlight("@tag", { fg = c.tag })
  M.highlight("@tag.attribute", { fg = c.variable })
  M.highlight("@tag.delimiter", { fg = c.fg })

  M.highlight("@namespace", { fg = c.support })

  M.highlight("@annotation", { fg = c.annotation })
  M.highlight("@attribute", { fg = c.annotation })

  M.highlight("@text.title", { fg = c.keyword, style = "bold" })
  M.highlight("@text.literal", { fg = c.string })
  M.highlight("@text.uri", { fg = c.misc, style = "underline" })
  M.highlight("@text.reference", { fg = c.func })
  M.highlight("@text.emphasis", { style = "italic" })
  M.highlight("@text.strong", { style = "bold" })

  -- LSP semantic tokens
  M.highlight("@lsp.type.namespace", { fg = c.support })
  M.highlight("@lsp.type.type", { fg = c.support })
  M.highlight("@lsp.type.class", { fg = c.support })
  M.highlight("@lsp.type.enum", { fg = c.support })
  M.highlight("@lsp.type.interface", { fg = c.support })
  M.highlight("@lsp.type.struct", { fg = c.support })
  M.highlight("@lsp.type.parameter", { fg = c.variable })
  M.highlight("@lsp.type.variable", { fg = c.variable })
  M.highlight("@lsp.type.property", { fg = c.variable })
  M.highlight("@lsp.type.enumMember", { fg = c.constant })
  M.highlight("@lsp.type.function", { fg = c.func })
  M.highlight("@lsp.type.method", { fg = c.func })
  M.highlight("@lsp.type.macro", { fg = c.annotation })
  M.highlight("@lsp.type.decorator", { fg = c.annotation })
  M.highlight("@lsp.typemod.variable.readonly", { fg = c.constant })

  -- LSP diagnostics
  M.highlight("DiagnosticError", { fg = c.invalid })
  M.highlight("DiagnosticWarn", { fg = c.constant })
  M.highlight("DiagnosticInfo", { fg = c.misc })
  M.highlight("DiagnosticHint", { fg = c.string })

  M.highlight("DiagnosticUnderlineError", { sp = c.invalid, style = "underline" })
  M.highlight("DiagnosticUnderlineWarn", { sp = c.constant, style = "underline" })
  M.highlight("DiagnosticUnderlineInfo", { sp = c.misc, style = "underline" })
  M.highlight("DiagnosticUnderlineHint", { sp = c.string, style = "underline" })
end

return M
