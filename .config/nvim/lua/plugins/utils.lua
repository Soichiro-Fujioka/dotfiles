return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        doc = {
          inline = true,
          float = true,
          max_width = 999,
          max_height = 80,
        },
        convert = {
          mermaid = function()
            local theme = vim.o.background == "light" and "neutral" or "dark"
            return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "5" }
          end,
        },
      },
      scroll = {},
    },
  },
}
