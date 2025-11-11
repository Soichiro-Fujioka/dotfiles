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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = buf, silent = true, desc = desc })
    end

    map("K", "<cmd>Lspsaga hover_doc<CR>", "Hover (Saga)")
    map("gf", "<cmd>Lspsaga finder def+ref<CR>", "Finder def+ref (Saga)")
    map("ge", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics (Saga)")
    map("ga", "<cmd>Lspsaga code_action<CR>", "Code Action (Saga)")
    map("gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic (Saga)")
    map("gN", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic (Saga)")
    map("gp", "<cmd>Lspsaga peek_definition<CR>", "Peek Definition (Saga)")
    map("gr", "<cmd>Lspsaga rename<CR>", "Rename (Saga)")
    map("gR", "<cmd>Lspsaga rename ++project<CR>", "Project Rename (Saga)")
    map("go", "<cmd>Lspsaga outline<CR>", "Outline (Saga)")
  end,
})
