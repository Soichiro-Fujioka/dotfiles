local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set('n', '<S-Tab>', ':BufferPrevious<CR>', opts)
keymap.set('n', '<Tab>', ':BufferNext<CR>', opts)
keymap.set('n', '<C-Tab>', ':BufferClose<CR>', opts)

require'barbar'.setup {
  clickable = false,
  icons = {
    button = '',
    separator = {left = '', right = ''},
  },
  animation = false
}
