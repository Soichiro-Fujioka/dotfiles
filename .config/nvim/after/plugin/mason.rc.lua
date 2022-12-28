local status, mason = pcall(require, "mason")
if (not status) then return end
local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      on_attach = on_attach, --keyバインドなどの設定を登録
      capabilities = capabilities, --cmpを連携
    }
  end,
}

mason_lspconfig.setup {
  automatic_installation = true
}
