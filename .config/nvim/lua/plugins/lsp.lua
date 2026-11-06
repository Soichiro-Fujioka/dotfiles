local HOME = os.getenv("HOME")
return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = function()
      return {
        ui = {
          colors = {
            normal_bg = "NONE",
            title_bg = "NONE",
          },
        },
        symbol_in_winbar = {
          enable = false,
        },
        lightbulb = {
          enable = false,
        },
        diagnostic = {
          on_insert_follow = true,
        },
        definition = {
          width = 0.75,
          height = 0.75,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          -- TODO not work
          args = { "--config", HOME .. "/.config/nvim/markdownlint-cli2.yaml", "--" },
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          typos_lsp = {},
        },
      },
    },
  },
}
