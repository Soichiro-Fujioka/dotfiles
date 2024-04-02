local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'romgrk/barbar.nvim'
  use 'simeji/winresizer'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'sotte/presenting.vim'
  use 'folke/zen-mode.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvimtools/none-ls.nvim'
  use 'nvimtools/none-ls-extras.nvim'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'editorconfig/editorconfig-vim'

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    -- finder not work on latest version
    commit = "4f07"
  })
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'nvim-telescope/telescope.nvim',
  }
  use 'folke/trouble.nvim'

  use 'nvim-tree/nvim-tree.lua'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use {
    'svrana/neosolarized.nvim'
  }
  use "rafamadriz/neon"
  use 'folke/tokyonight.nvim'
  use 'bluz71/vim-nightfly-colors'
  use 'AlexvZyl/nordic.nvim'
  use 'tjdevries/colorbuddy.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'rcarriga/nvim-notify'
  use 'folke/noice.nvim'
  use 'MunifTanjim/nui.nvim'

  use 'kdheepak/lazygit.nvim'

end)
