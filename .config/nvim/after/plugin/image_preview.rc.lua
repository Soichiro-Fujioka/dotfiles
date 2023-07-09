require("image_preview").setup({})

vim.keymap.set('n', ';p',
  function()
    require('image_preview').PreviewImageOil()
  end
)
