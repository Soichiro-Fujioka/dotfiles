local function set_ui_overrides()
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#fabd2f", bold = true })
end

set_ui_overrides()

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.wo.cursorline = false
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_ui_overrides,
})

return {
  {
    "craftzdog/solarized-osaka.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        theme = "wave",
        background = {
          -- dark = "wave",
          dark = "dragon",
          light = "lotus",
        },
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        transparent_mode = true,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
