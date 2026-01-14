-- Noctis for Neovim
-- Main module

local M = {}

-- Default configuration
local default_config = {
  theme = "noctis",
  integrations = {
    telescope = true,
    ["fzf-lua"] = true,
    ["nvim-tree"] = true,
    ["neo-tree"] = true,
    gitsigns = true,
    ["indent-blankline"] = true,
    ["which-key"] = true,
    lualine = true,
    alpha = true,
    notify = true,
  }
}

-- Global config storage
M.config = vim.deepcopy(default_config)

-- Setup configuration (does not load theme)
function M.setup(opts)
  opts = opts or {}

  -- Merge user config with defaults
  M.config.theme = opts.theme or default_config.theme
  M.config.integrations = vim.tbl_deep_extend(
    "force",
    default_config.integrations,
    opts.integrations or {}
  )
end

-- Load configured theme
function M.load()
  require("noctis.theme").load(M.config.theme)
end

return M
