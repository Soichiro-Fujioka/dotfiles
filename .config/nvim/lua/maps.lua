local keymap = vim.keymap

keymap.set('n', '<C-a>', 'gg<S-v>G')

keymap.set('n', 'x', '"_x')
keymap.set('n', 'd', '"_d')
keymap.set('n', 'D', '"_D')

keymap.set('v', 'x', '"_x')
keymap.set('v', 'd', '"_d')
keymap.set('v', 'D', '"_D')

keymap.set('v', 'x', '"_x')
keymap.set('x', 'd', '"_d')
keymap.set('x', 'p', '"_dP')


keymap.set('i', 'jj', '<ESC>')

keymap.set('n', 'te', ':tabedit')
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
