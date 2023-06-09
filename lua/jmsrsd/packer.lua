-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Colors
  use { 'marko-cerovac/material.nvim' }
  use { 'navarasu/onedark.nvim' }
  use { 'sainnhe/gruvbox-material' }
  use { 'tjdevries/colorbuddy.nvim' }
  use { 'tjdevries/gruvbuddy.nvim',
    requires = 'tjdevries/colorbuddy.nvim',
  }
  use { 'svrana/neosolarized.nvim',
    requires = 'tjdevries/colorbuddy.nvim',
  }

  -- Utils
  use { 'mbbill/undotree' }
  use { "nvim-lua/plenary.nvim" }
  use { 'kazhala/close-buffers.nvim' }

  -- Git
  use { 'tpope/vim-fugitive' }
  use { 'f-person/git-blame.nvim', }
  use { "petertriho/cmp-git",
    requires = "nvim-lua/plenary.nvim",
  }

  -- UIs
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'stevearc/dressing.nvim' }
  use { 'nvim-lualine/lualine.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  }
  use { 'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons', -- optional
  }
  use { "folke/which-key.nvim",
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

  -- Fuzzy Finder
  use { 'junegunn/fzf', run = function()
    pcall(function()
      require 'fzf'.install()
    end)
  end }
  use { 'nanotee/zoxide.vim' }

  -- Telescope
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release' ..
        ' && cmake --build build --config Release' ..
        ' && cmake --install build --prefix build',
  }
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    }
  }
  use { "nvim-telescope/telescope-file-browser.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    }
  }
  use { "gbrlsnchs/telescope-lsp-handlers.nvim",
    require = "nvim-telescope/telescope.nvim",
  }
  use { 'nvim-telescope/telescope-ui-select.nvim',
    require = "nvim-telescope/telescope.nvim",
  }
  use { 'jvgrootveld/telescope-zoxide',
    require = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    }
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter',
    run = function()
      local install = require 'nvim-treesitter.install'
      local update = install.update { with_sync = true }
      update()
    end,
  }
  use { 'nvim-treesitter/playground',
    require = 'nvim-treesitter/nvim-treesitter',
  }

  -- LSP
  use { 'j-hui/fidget.nvim', tag = 'legacy' }
  use { "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use { 'neovim/nvim-lspconfig' }
  use { 'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required

      {
        'williamboman/mason.nvim', -- Optional
        run = function()
          pcall(vim.cmd.MasonUpdate)
        end,
      },

      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      { 'j-hui/fidget.nvim', },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      {
        'L3MON4D3/LuaSnip',
        requires = {
          "rafamadriz/friendly-snippets",
          "honza/vim-snippets",
        },
      }, -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'onsails/lspkind-nvim' },
    }
  }

  -- Prettier
  use { 'MunifTanjim/prettier.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'jose-elias-alvarez/null-ls.nvim' },
    },
  }

  -- Flutter
  use { 'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  -- Autopair & Autotag
  use { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use { "windwp/nvim-ts-autotag",
    requires = {
      { "nvim-treesitter/nvim-treesitter" }
    },
  }
  use { "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  }

  -- DAP
  use { 'mfussenegger/nvim-dap' }
  use { "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap"
    }
  }

  -- Editing
  use { 'numToStr/Comment.nvim' }

  -- Motions
  use { "chrisgrieser/nvim-spider" }
  use { "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {}
    end,
  }
  use { 'toppair/peek.nvim',
    run = 'deno task --quiet build:fast',
  }
  use { 'justinmk/vim-sneak', }
  use { 'tpope/vim-repeat', }
end)
