---@diagnostic disable: undefined-global

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    }
  }

  use 'navarasu/onedark.nvim'

  use 'sainnhe/gruvbox-material'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({
        with_sync = true,
      })
      ts_update()
    end,
  }

  use 'nvim-treesitter/playground'

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'

  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
  }

  use('neovim/nvim-lspconfig')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        -- run = ":MasonUpdate",
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',                opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'saadparwaiz1/cmp_luasnip' },
    }
  }

  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "windwp/nvim-ts-autotag",
    requires = {
      { "nvim-treesitter/nvim-treesitter" }
    },
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    },
  }

  use 'nvim-tree/nvim-web-devicons'

  use 'mfussenegger/nvim-dap'

  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
          term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
          inactive = false,    -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 10,          -- amount of lines we will try to show around the current line
        treesitter = true,     -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      }
    end
  }

  use { "chrisgrieser/nvim-spider" }

  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {}
    end,
  }

  use 'marko-cerovac/material.nvim'

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup {}
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use('MunifTanjim/prettier.nvim')

  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })

  use 'karb94/neoscroll.nvim'

  use {
    "yuchanns/phpfmt.nvim",
    config = function()
      require("phpfmt").setup({
        -- Default configs
        cmd = "phpcbf",
        standard = "PSR12",
        auto_format = true,
        -- auto_format = false,
      })
    end
  }
end)
