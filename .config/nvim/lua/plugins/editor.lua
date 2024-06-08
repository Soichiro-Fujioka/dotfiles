return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            {
                "sf",
                function()
                  require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
                end,
                desc = "Explorer NeoTree (Root Dir)",
              }
        },
        opt = {
            filesystem = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false
            }
        }
    }
}