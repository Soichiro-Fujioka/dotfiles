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
  {
    "vim-skk/skkeleton",
    enabled = true,
    config = function()
      vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(skkeleton-enable)", { noremap = true, silent = false })
      vim.api.nvim_set_keymap("c", "<C-j>", "<Plug>(skkeleton-enable)", { noremap = true, silent = false })
      vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(skkeleton-disable)", { noremap = true, silent = false })
      vim.api.nvim_set_keymap("c", "<C-l>", "<Plug>(skkeleton-disable)", { noremap = true, silent = false })
      vim.fn["skkeleton#config"]({
        globalDictionaries = {
          "~/.config/nvim/skk/skk-jisyo",
        },
        eggLikeNewline = true,
        keepState = true,
        showCandidatesCount = 3,
        -- registerConvertResult = true,
      })
    end,
    dependencies = { "vim-denops/denops.vim" },
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
