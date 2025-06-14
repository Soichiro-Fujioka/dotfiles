local HOME = os.getenv("HOME")
return {
  {
    "nvimdev/lspsaga.nvim",
    event = "VeryLazy",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<Return>" }
      keys[#keys + 1] = { "gf", "<cmd>Lspsaga finder def+ref<Return>" }
      keys[#keys + 1] = { "ge", "<cmd>Lspsaga show_line_diagnostics<Return>" }
      keys[#keys + 1] = { "ga", "<cmd>Lspsaga code_action<Return>" }
      keys[#keys + 1] = { "gn", "<cmd>Lspsaga diagnostic_jump_next<Return>" }
      keys[#keys + 1] = { "gp", "<cmd>Lspsaga peek_definition<Return>" }
      keys[#keys + 1] = { "gr", "<cmd>Lspsaga rename<Return>" }
      keys[#keys + 1] = { "gR", "<cmd>Lspsaga rename ++project<Return>" }
      keys[#keys + 1] = { "go", "<cmd>Lspsaga outline<Return>" }

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
