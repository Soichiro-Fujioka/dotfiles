-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.api.nvim_create_user_command("ObsidianCommit", function()
  local message = "vault backup: " .. os.date("%Y-%m-%d %H:%M:%S")
  local git_command = 'git add . && git commit -m "' .. message .. '"'
  os.execute(git_command)
end, { nargs = 0 })
