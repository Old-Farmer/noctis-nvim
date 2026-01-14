-- Example configuration for Noctis colorscheme

-- Method 1: Using Lua setup function
require("noctis").setup({
  theme = "noctis" -- Options: noctis, lux, hibernus, lilac, minimus, azureus, bordo, obscuro, sereno, uva, viola
})

-- Method 2: Using vim.cmd (simple)
-- vim.cmd([[colorscheme noctis]])
-- vim.cmd([[colorscheme noctis-lux]])
-- vim.cmd([[colorscheme noctis-azureus]])

-- For lazy.nvim users
--[[
{
  "noctis-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("noctis").setup({
      theme = "noctis"
    })
  end,
}
]]--

-- For packer.nvim users
--[[
use {
  "noctis-nvim",
  config = function()
    vim.cmd([[colorscheme noctis]])
  end
}
]]--
