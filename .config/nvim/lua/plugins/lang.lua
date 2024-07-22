return {
  {
    "vinnymeller/swagger-preview.nvim",
    config = function()
      require("swagger-preview").setup({
        port = 8111,
        host = "localhost",
      })
    end,
    cmd = { "SwaggerPreview" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
