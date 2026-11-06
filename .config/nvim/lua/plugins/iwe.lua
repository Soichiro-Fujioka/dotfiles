-- https://iwe.md/docs/editors/neovim/
return {
  {
    "iwe-org/iwe.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("iwe").setup({
        -- iwe's telescope setup overrides LazyVim's config and loads ui-select/emoji extensions
        telescope = { setup_config = false },
      })
    end,
  },
}
