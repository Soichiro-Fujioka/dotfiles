local actions = require("diffview.actions")
require("diffview").setup({
  keymaps = {
     file_panel = {
      { "n", "s", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry" } },
    }
  }
})
