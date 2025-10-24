return {
  -- {
  --   "indent-blankline.nvim",
  --   enabled = false,
  -- },
  {
    "folke/noice.nvim",
    -- borrowed from https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/plugins/ui.lua
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      stages = "fade",
      top_down = false,
      timeout = 1000,
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        close_icon = "",
        buffer_close_icon = "",
        style_preset = function()
          local bufferline = require("bufferline")
          return bufferline.style_preset.minimal
        end,
      },
    },
  },
  {
    "kazhala/close-buffers.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<C-c>",
        function()
          require("close_buffers").delete({ type = "hidden" })
        end,
        desc = "Remove buffers",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
                  _____                    _____                    _____            _____                   _______                   _____                    _____          
                /\    \                  /\    \                  /\    \          /\    \                 /::\    \                 /\    \                  /\    \         
                /::\____\                /::\    \                /::\____\        /::\    \               /::::\    \               /::\____\                /::\    \        
              /:::/    /               /::::\    \              /:::/    /       /::::\    \             /::::::\    \             /::::|   |               /::::\    \       
              /:::/   _/___            /::::::\    \            /:::/    /       /::::::\    \           /::::::::\    \           /:::::|   |              /::::::\    \      
            /:::/   /\    \          /:::/\:::\    \          /:::/    /       /:::/\:::\    \         /:::/~~\:::\    \         /::::::|   |             /:::/\:::\    \     
            /:::/   /::\____\        /:::/__\:::\    \        /:::/    /       /:::/  \:::\    \       /:::/    \:::\    \       /:::/|::|   |            /:::/__\:::\    \    
          /:::/   /:::/    /       /::::\   \:::\    \      /:::/    /       /:::/    \:::\    \     /:::/    / \:::\    \     /:::/ |::|   |           /::::\   \:::\    \   
          /:::/   /:::/   _/___    /::::::\   \:::\    \    /:::/    /       /:::/    / \:::\    \   /:::/____/   \:::\____\   /:::/  |::|___|______    /::::::\   \:::\    \  
        /:::/___/:::/   /\    \  /:::/\:::\   \:::\    \  /:::/    /       /:::/    /   \:::\    \ |:::|    |     |:::|    | /:::/   |::::::::\    \  /:::/\:::\   \:::\    \ 
        |:::|   /:::/   /::\____\/:::/__\:::\   \:::\____\/:::/____/       /:::/____/     \:::\____\|:::|____|     |:::|    |/:::/    |:::::::::\____\/:::/__\:::\   \:::\____\
        |:::|__/:::/   /:::/    /\:::\   \:::\   \::/    /\:::\    \       \:::\    \      \::/    / \:::\    \   /:::/    / \::/    / ~~~~~/:::/    /\:::\   \:::\   \::/    /
        \:::\/:::/   /:::/    /  \:::\   \:::\   \/____/  \:::\    \       \:::\    \      \/____/   \:::\    \ /:::/    /   \/____/      /:::/    /  \:::\   \:::\   \/____/ 
          \::::::/   /:::/    /    \:::\   \:::\    \       \:::\    \       \:::\    \                \:::\    /:::/    /                /:::/    /    \:::\   \:::\    \     
          \::::/___/:::/    /      \:::\   \:::\____\       \:::\    \       \:::\    \                \:::\__/:::/    /                /:::/    /      \:::\   \:::\____\    
            \:::\__/:::/    /        \:::\   \::/    /        \:::\    \       \:::\    \                \::::::::/    /                /:::/    /        \:::\   \::/    /    
            \::::::::/    /          \:::\   \/____/          \:::\    \       \:::\    \                \::::::/    /                /:::/    /          \:::\   \/____/     
              \::::::/    /            \:::\    \               \:::\    \       \:::\    \                \::::/    /                /:::/    /            \:::\    \         
              \::::/    /              \:::\____\               \:::\____\       \:::\____\                \::/____/                /:::/    /              \:::\____\        
                \::/____/                \::/    /                \::/    /        \::/    /                 ~~                      \::/    /                \::/    /        
                ~~                       \/____/                  \/____/          \/____/                                           \/____/                  \/____/         
                                                                                                                                                                              
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      opts.config.center = {
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          icon = " ",
          key = "f",
        },
        {
          action = "ene | startinsert",
          desc = " New File",
          icon = " ",
          key = "n",
        },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = " Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = 'lua LazyVim.pick("live_grep")()',
          desc = " Find Text",
          icon = " ",
          key = "g",
        },
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
        {
          action = "Lazy",
          desc = " Lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>qa<cr>")
          end,
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      }
    end,
  },
  {
    "nvim-mini/mini.animate",
    enabled = false,
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "VeryLazy",
    opts = {
      chunk = {
        enable = true,
      },
      indent = {
        enable = true,
        use_treesitter = true,
      },
      line_num = {
        enable = true,
        use_treesitter = true,
      },
      blank = {
        enable = false,
      },
    },
  },
  {
    "simeji/winresizer",
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_z = {
          function()
            return " " .. os.date("%T")
          end,
        },
      },
    },
  },
}
