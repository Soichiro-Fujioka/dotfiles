local status, mason = pcall(require, "mason")
if (not status) then return end
local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local opts = { noremap = true, silent = true }
-- end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {
      -- on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}

mason_lspconfig.setup {
  automatic_installation = true
}
