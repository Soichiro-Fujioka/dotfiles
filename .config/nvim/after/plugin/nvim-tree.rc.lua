-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  remove_keymaps = {
		's','<Tab>'
	},
  sort_by = "case_sensitive",
  renderer = {
    group_empty = false,
  },
  filters = {
    dotfiles = false,
  },
  view = {
    width = 35,
    mappings = {
      list = {
        { key = "n", action = "create" },
      },
    },
  },
  git = {
    ignore = false
  },
  update_focused_file = {
    enable = true
  }
})

-- open nvim tree
vim.keymap.set('n', 'sf', ':NvimTreeToggle<CR>')
vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]] -- background transparent
