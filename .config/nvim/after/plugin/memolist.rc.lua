vim.g.memolist_memo_suffix = "md"
vim.g.memolist_filename_prefix_none = 1
vim.g.memolist_path = '$HOME/.config/memo/_posts'
vim.keymap.set("n", ";m", ":Telescope memo list<CR>")
