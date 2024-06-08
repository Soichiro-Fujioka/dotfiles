return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "sf",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "right",
          })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
    },
    opts = {
      close_if_last_window = true,
      use_default_mappings = false,
      filesystem = {
        filtered_items = {
          visible = false,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
      window = {
        mappings = {
          ["<Return>"] = "open",
          ["n"] = "add",
          ["r"] = "rename",
          ["d"] = "delete",
          ["c"] = {
            "copy",
            config = {
              show_path = "none",
            },
          },
          ["y"] = "copy_to_clipboard",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
            file_ignore_patterns = { ".git/" },
          })
        end,
        desc = "Find Files (Root Dir)",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({
            additional_args = { "--hidden" },
          })
        end,
        desc = "Grep (Root Dir)",
      },
    },
  },
  {
    "folke/trouble.nvim",
    keys = {
      { ";e", "<cmd>Trouble diagnostics toggle<Return>", desc = "Diagnostics (Trouble)" },
    },
  },
}
