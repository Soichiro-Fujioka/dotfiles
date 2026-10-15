local biome_fts = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "json",
  "jsonc",
  "css",
  "graphql",
}

return {
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = { ensure_installed = { "biome" } },
  },
  {
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
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- ["python"] = { "ruff" },
      opts.formatters_by_ft["markdown"] = { "prettier" }
      -- override LazyVim prettier extra for biome-supported filetypes
      for _, ft in ipairs(biome_fts) do
        opts.formatters_by_ft[ft] = { "biome" }
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        condition = function()
          local local_prettier = "./node_modules/.bin/prettier"
          if vim.fn.filereadable(local_prettier) == 1 then
            return { command = local_prettier }
          end
          return true -- use mason
        end,
      }
    end,
  },
}
