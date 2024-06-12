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
}
