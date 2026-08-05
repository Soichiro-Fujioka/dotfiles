local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- PJルートからの相対パスを返す
local function get_project_relative_path()
  local filepath = vim.fn.expand("%:p")
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
  if git_root and git_root ~= "" then
    return filepath:sub(#git_root + 2)
  end
  return vim.fn.expand("%")
end

-- ファイルパス:行番号 + コードブロックで囲ったテキストを組み立てる
local function build_copy_content(path_with_line, text)
  local ext = vim.fn.expand("%:e")
  return path_with_line .. "\n```" .. ext .. "\n" .. text .. "\n```\n"
end

-- Y (normal): ファイルパス:行番号 + カーソル下の単語をコピー
keymap.set("n", "Y", function()
  local path = get_project_relative_path()
  local path_with_line = path .. ":" .. vim.fn.line(".")
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("+", build_copy_content(path_with_line, word))
  vim.notify("Copied: " .. path_with_line, vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Copy filepath:line + word in code block" })

-- Y (visual): ファイルパス:行番号範囲 + 選択テキストをコピー
keymap.set("v", "Y", function()
  local path = get_project_relative_path()
  local start_line, end_line = vim.fn.line("v"), vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local path_with_line = path .. ":" .. start_line .. "-" .. end_line
  local saved, saved_type = vim.fn.getreg("z"), vim.fn.getregtype("z")
  vim.cmd('noautocmd normal! "zy')
  local selection = vim.fn.getreg("z")
  vim.fn.setreg("z", saved, saved_type)
  vim.fn.setreg("+", build_copy_content(path_with_line, selection))
  vim.notify("Copied: " .. path_with_line, vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Copy filepath:line-range + selection in code block" })

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

keymap.set("n", "q", "<Nop>", { noremap = true })

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
