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
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = os.getenv("OBSIDIAN_VAULT_PATH"),
          strict = true,
        },
      },
      ui = { enable = false }, -- use render-markdown.nvim
    },
    keys = {
      {
        ";oc",
        "<cmd>ObsidianCommit<Return>",
      },
    },
  },
}
