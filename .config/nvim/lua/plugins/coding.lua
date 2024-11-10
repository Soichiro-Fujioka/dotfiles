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
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      set_default_events = { "VimEnter", "InsertEnter", "InsertLeave" },
      set_previous_events = {},
    },
  },
  {
    "vim-skk/skkeleton",
    enabled = false,
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
}
