local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true,
    disable_commit_confirmation = false
  },
  mappings = {
    status = {}
  }
}

local keymap = vim.keymap
keymap.set('n', 'gs', ':Neogit<CR>', { silent = true })
