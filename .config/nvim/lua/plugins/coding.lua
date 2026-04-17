return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  {
    "keaising/im-select.nvim",
    cond = function()
      return vim.fn.executable("im-select") == 1
    end,
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      set_default_events = { "VimEnter", "InsertEnter", "InsertLeave" },
      set_previous_events = {},
    },
  },
  -- {
  --   "folke/sidekick.nvim",
  --   opts = {
  --     cli = {
  --       tools = {
  --         codex = { cmd = { "codex", "--enable", "web_search" } },
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       ";c",
  --       function()
  --         -- Use codex CLI flag (--enable web_search); avoid deprecated web_search_request mapping.
  --         require("sidekick.cli").toggle({ name = "codex", focus = true })
  --       end,
  --       desc = "Sidekick aider",
  --       mode = { "n" },
  --     },
  --     {
  --       ";a",
  --       function()
  --         -- Use codex CLI flag (--enable web_search); avoid deprecated web_search_request mapping.
  --         require("sidekick.cli").toggle({ name = "aider", focus = true })
  --       end,
  --       desc = "Sidekick Codex",
  --       mode = { "n" },
  --     },
  --   },
  -- },
}
