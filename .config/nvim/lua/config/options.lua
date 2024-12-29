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
vim.g.python3_host_prog = vim.env.PYENV_ROOT

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

-- added extras
-- ● coding.nvim-cmp  cmp-buffer  cmp-nvim-lsp  cmp-path  friendly-snippets  nvim-cmp  nvim-snippets
-- ● editor.dial    dial.nvim
--   Increment and decrement numbers, dates, and more
-- ● editor.telescope  dressing.nvim  nvim-lspconfig  telescope-fzf-native.nvim  telescope.nvim
-- ● formatting.black  mason.nvim  conform.nvim  none-ls.nvim
-- ● formatting.prettier  mason.nvim  conform.nvim  none-ls.nvim
-- ● test.core    neotest  nvim-nio  nvim-dap
--   Neotest support. Requires language specific adapters to be configured. (see lang extras)
-- ● ui.dashboard-nvim  dashboard-nvim  snacks.nvim
-- ● ui.indent-blankline  indent-blankline.nvim  snacks.nvim
-- ● ui.treesitter-context  nvim-treesitter-context
-- ● util.rest  kulala.nvim  nvim-treesitter
--
-- Enabled Languages: (7)
-- ● lang.docker  mason.nvim  nvim-lspconfig  nvim-treesitter  none-ls.nvim  nvim-lint
-- ● lang.json    SchemaStore.nvim  nvim-lspconfig  nvim-treesitter
-- ● lang.markdown    markdown-preview.nvim  mason.nvim  nvim-lspconfig  render-markdown.nvim  conform.nvim  none-ls.nvim  nvim-lint
-- ● lang.python  neotest-python  nvim-dap-python  nvim-lspconfig  nvim-treesitter  venv-selector.nvim  mason-nvim-dap.nvim  neotest  nvim-cmp  nvim-dap
-- ● lang.tailwind  nvim-lspconfig  tailwindcss-colorizer-cmp.nvim  nvim-cmp
-- ● lang.toml    nvim-lspconfig
-- ● lang.typescript  mason.nvim  mini.icons  nvim-lspconfig  nvim-dap
