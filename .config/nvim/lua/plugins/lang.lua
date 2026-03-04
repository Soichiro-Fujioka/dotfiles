return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/markdown-preview.css"
      vim.g.mkdp_port = "3333"
    end,
    ft = { "markdown" },
  },
  {
    "vinnymeller/swagger-preview.nvim",
    config = function()
      require("swagger-preview").setup({
        port = 8111,
        host = "localhost",
      })
    end,
    cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
    build = "npm i && npm install swagger-ui-watcher -g",
  },
}
