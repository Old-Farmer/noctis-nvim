# Noctis for Neovim

A collection of balanced light & dark themes for Neovim, ported from the [Noctis VSCode theme](https://github.com/liviuschera/noctis).

Noctis features a well-balanced blend of warm and cold colors that are carefully designed to be easy on the eyes.

## 🎨 Available Themes

### Light Themes
- **noctis-lux** - Clean light theme
- **noctis-hibernus** - Soft light theme  
- **noctis-lilac** - Purple-tinted light theme

### Dark Themes
- **noctis** - Classic dark theme
- **noctis-azureus** - Blue-tinted dark theme
- **noctis-bordo** - Burgundy-tinted dark theme
- **noctis-obscuro** - Deep dark theme
- **noctis-sereno** - Calm dark theme
- **noctis-uva** - Purple-tinted dark theme
- **noctis-viola** - Violet-tinted dark theme
- **noctis-minimus** - Minimalist dark theme

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "noctis-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme noctis]])
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "noctis-nvim",
  config = function()
    vim.cmd([[colorscheme noctis]])
  end
}
```

### Using vim-plug

```vim
Plug 'noctis-nvim'
```

## 🚀 Usage

Add this to your `init.lua`:

```lua
vim.cmd([[colorscheme noctis]])
```

Or in `init.vim`:

```vim
colorscheme noctis
```

You can use any of the available themes:
```lua
vim.cmd([[colorscheme noctis-lux]])      -- Light theme
vim.cmd([[colorscheme noctis-azureus]])  -- Dark blue theme
vim.cmd([[colorscheme noctis-uva]])      -- Dark purple theme
-- etc.
```

## 🎯 Features

- ✅ Full Treesitter support
- ✅ LSP semantic highlighting
- ✅ Popular plugin support:
  - Telescope
  - NvimTree / Neo-tree
  - GitSigns
  - Indent Blankline
  - Lualine
  - Which-key
  - And more!

## 📝 Credits

Original theme by [Liviu Schera](https://github.com/liviuschera/noctis) for Visual Studio Code.
Ported to Neovim with love.

## 📄 License

MIT
