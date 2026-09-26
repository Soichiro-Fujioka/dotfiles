-- https://iwe.md/docs/editors/neovim/
return {
  {
    "iwe-org/iwe.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("iwe").setup()
    end,
  },
}
