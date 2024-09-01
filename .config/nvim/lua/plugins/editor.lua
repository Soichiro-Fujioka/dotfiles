-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/dial.lua
local M = {}
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

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
    config = function()
      vim.keymap.set("n", "<leader><space>", "<Nop>")
    end,
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
  {

    "monaqa/dial.nvim",
    keys = {
      {
        "<C-d>",
        function()
          return M.dial(true)
        end,
        expr = true,
        desc = "Increment",
        mode = { "n", "v" },
      },
      {
        "<C-s>",
        function()
          return M.dial(false)
        end,
        expr = true,
        desc = "Decrement",
        mode = { "n", "v" },
      },
    },
  },
}
