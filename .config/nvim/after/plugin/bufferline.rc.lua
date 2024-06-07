local keymap = vim.keymap
local opts = { noremap = true, silent = true }

bufferline = require("bufferline")

bufferline.setup{
  options = {
    indicator = {style = 'underline'},
    close_icon = "",
    buffer_close_icon = "",
    style_preset = bufferline.style_preset.minimal
  }
}
keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
keymap.set('n', '<C-Tab>', ':bp|bd #<CR>')
