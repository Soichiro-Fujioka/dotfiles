local status, tabline = pcall(require, "tabline")
if (not status) then return end
local status, lualine = pcall(require, "lualine")
if (not status) then return end

tabline.setup {
  enable = false,
  options = {
    show_filename_only = true
  }
}

lualine.setup {
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
}

local keymap = vim.keymap
keymap.set('n', 'te', ':TablineTabNew')
keymap.set('n', '<S-Tab>', ':TablineBufferPrevious<Return>')
keymap.set('n', '<Tab>', ':TablineBufferNext<Return>')
keymap.set('n', '<C-w>', ':bp|bd #<Return>')
