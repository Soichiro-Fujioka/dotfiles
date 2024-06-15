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
  -- use rest nvim
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
    keys = {
      {
        "rr",
        "<cmd>Rest run<cr>",
        "Run request under the cursor",
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
}
