local highlight = {
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "0", { fg = "#71C4C2" })
    vim.api.nvim_set_hl(0, "1", { fg = "#E8D8D2" })
    vim.api.nvim_set_hl(0, "2", { fg = "#71C4C2" })
    vim.api.nvim_set_hl(0, "3", { fg = "#F7F7F7" })
    vim.api.nvim_set_hl(0, "4", { fg = "#E3BCB5" })
    vim.api.nvim_set_hl(0, "5", { fg = "#4a708b" })
    vim.api.nvim_set_hl(0, "6", { fg = "#ffe9cf" })
end)

require("ibl").setup { scope = { highlight = highlight }, char = "│" }
