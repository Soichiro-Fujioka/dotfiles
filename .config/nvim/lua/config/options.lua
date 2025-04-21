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
-- vim.opt.conceallevel = 0
-- vim.g.python3_host_prog = vim.env.PYENV_ROOT

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true
