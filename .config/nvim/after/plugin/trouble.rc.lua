local trouble = require("trouble")

trouble.setup {
  position = "right"
}

vim.keymap.set("n", ";e", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", ";q", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", ";l", function() require("trouble").toggle("loclist") end)
