local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- keymap.set('n', 'te', ':TablineTabNew')
keymap.set('n', '<S-Tab>', ':BufferPrevious<CR>', opts)
keymap.set('n', '<Tab>', ':BufferNext<CR>', opts)
keymap.set('n', '<C-w>', ':BufferClose<CR>', opts)
