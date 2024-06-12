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
}
