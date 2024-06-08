local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  diagnostics_format = "#{m} (#{s}: #{c})",
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      condition = function(utils)
        return not utils.root_has_file({ ".prettierrc", ".prettierrc.json" })
      end,
    }),
    null_ls.builtins.formatting.prettier.with({
      only_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.black,
    require("none-ls.diagnostics.flake8"),
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    -- require("none-ls.diagnostics.eslint").with({
    --   only_local = "node_modules/.bin",
    -- }),
    -- require("none-ls.code_actions.eslint").with({
    --   only_local = "node_modules/.bin",
    -- }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)

vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = true } end)
