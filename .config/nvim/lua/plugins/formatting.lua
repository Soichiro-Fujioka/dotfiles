return {
  "stevearc/conform.nvim",
  keys = {
    {
      "gf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- ["python"] = { "ruff" },
      ["markdown"] = { "prettier" },
      ["typescript"] = { "prettier" },
      ["typescriptreact"] = { "prettier" },
    },
    formatters = {
      prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        condition = function()
          local local_prettier = "./node_modules/.bin/prettier"
          if vim.fn.filereadable(local_prettier) == 1 then
            return { command = local_prettier }
          end
          return true -- use mason
        end,
      },
    },
  },
}
