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
    dependencies = { "vim-denops/denops.vim" },
  },
}
