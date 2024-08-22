return {
  {
    "kdheepak/lazygit.nvim",
    keys = {
      {
        "gs",
        "<cmd>LazyGit<Return>",
      },
    },
  },
  {
    "voldikss/vim-floaterm",
    keys = {
      { ";;", "<cmd>FloatermToggle --height=0.8 --width=0.8 <Return>", desc = "Show float term(toggle)" },
    },
    config = function()
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_width = 0.8
    end,
  },
  { "itchyny/calendar.vim" },
}
