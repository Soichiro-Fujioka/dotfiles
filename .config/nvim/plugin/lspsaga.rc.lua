local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    colors = {
      normal_bg = "NONE",
      title_bg = "NONE"
    }
  },
  symbol_in_winbar = {
    enable = false
  },
  lightbulb = {
    enable = false
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opt)
vim.keymap.set("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
vim.keymap.set("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opt)
vim.keymap.set("n", "gR", "<cmd>Lspsaga rename ++project<CR>", opt)
vim.keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opt)

vim.keymap.set("n", "<C-t>", "<cmd>Lspsaga open_floaterm<CR>")
-- vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>")
vim.keymap.set("t", "<C-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])

