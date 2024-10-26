local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "d", '"_d')
keymap.set("n", "D", '"_D')

keymap.set("v", "d", '"_d')
keymap.set("v", "D", '"_D')

keymap.set("x", "d", '"_d')
keymap.set("x", "p", '"_dP')

keymap.set("i", "jj", "<ESC>")

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "<C-Tab>", ":bp|bd #<Return>", opts)

keymap.set("n", "<Space>", "<C-w>w")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set("n", ";s", ":w<Return>", opts)

keymap.set("x", 'a"', '2i"')
keymap.set("x", "a'", "2i'")
keymap.set("x", "a`", "2`")
keymap.set("o", 'a"', '2i"')
keymap.set("o", "a'", "2i'")
keymap.set("o", "a`", "2`")
