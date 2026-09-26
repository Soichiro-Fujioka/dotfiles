vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.scrolloff = 10
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.shell = "fish"
vim.opt.swapfile = false
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.formatoptions:append({ "r" })
vim.opt.signcolumn = "yes"
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.spelllang = { "en", "cjk" }
-- vim.opt.clipboard = "unnamedplus"

local is_termux = vim.env.TERMUX_VERSION ~= nil
  or vim.env.PREFIX == "/data/data/com.termux/files/usr"
  or vim.fn.isdirectory("/data/data/com.termux") == 1

if is_termux and vim.fn.executable("curl") == 1 then
  vim.g.clipboard = {
    name = "termux-clipboard-bridge",
    copy = {
      ["+"] = "curl -fsS --data-binary @- http://127.0.0.1:8765/set",
      ["*"] = "curl -fsS --data-binary @- http://127.0.0.1:8765/set",
    },
    paste = {
      ["+"] = "curl -fsS http://127.0.0.1:8765/get",
      ["*"] = "curl -fsS http://127.0.0.1:8765/get",
    },
  }
end

-- vim.opt.conceallevel = 0
-- vim.g.python3_host_prog = vim.env.PYENV_ROOT

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true
