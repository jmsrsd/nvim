# Jmsrsd's Neovim Configuration

🔧 This is my maintained configuration for the Neovim text editor, which includes various modules and dependencies. I regularly update it, focusing on improvements, new features, and bug fixes.

**Neovim is a highly configurable text editor built to enable efficient text editing. This configuration aims to enhance the out-of-the-box experience of Neovim by providing a set of pre-configured modules and dependencies.***


## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration Files](#configuration-files)

## Requirements

To use this configuration, you need to have the following programs installed:

- Neovim
- Git
- Python3
- Node.js
- npm
- pip3

## Installation

To install this configuration, clone this repository to your local machine:

```bash
git clone https://github.com/jmsrsd/nvim.git
```

Then, create a symbolic link to the cloned repository:

```bash
ln -s nvim $HOME/.config/nvim
```

## Usage

This configuration includes various plugins and settings for different purposes. Here's how to use some of them:

- [cmp](https://github.com/hrsh7th/nvim-cmp) for autocompletion: After installation, you can trigger autocompletion by pressing `<Ctrl-Space>`.
- [lsp](https://neovim.io/doc/user/lsp.html) for language server protocol support: After installation, you can use features like go-to-definition and hover by pressing `gd` and `K`, respectively.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding: After installation, you can trigger fuzzy finding by pressing `<Space>f`.

## Configuration Files

This configuration is organized into multiple Lua files in the `configs` directory:

- [`cmp.lua`](https://github.com/hrsh7th/nvim-cmp): Configuration for the `nvim-cmp` plugin
- [`lsp.lua`](https://github.com/neovim/nvim-lspconfig): Configuration for the `nvim-lspconfig` plugin
- [`treesitter.lua`](https://github.com/nvim-treesitter/nvim-treesitter): Configuration for the `nvim-treesitter` plugin
- [`telescope.lua`](https://github.com/nvim-telescope/telescope.nvim): Configuration for the `telescope.nvim` plugin
- [`lualine.lua`](https://github.com/hoob3rt/lualine.nvim): Configuration for the `lualine.nvim` plugin
- [`autopairs.lua`](https://github.com/windwp/nvim-autopairs): Configuration for the `nvim-autopairs` plugin
- [`blankline.lua`](https://github.com/lukas-reineke/indent-blankline.nvim): Configuration for the `indent-blankline.nvim` plugin
- [`catppuccin.lua`](https://github.com/catppuccin/nvim): Configuration for the `catppuccin` theme
- [`close_buffers.lua`](https://github.com/kazhala/close-buffers.nvim): Configuration for the `close-buffers.nvim` plugin
- [`comment.lua`](https://github.com/numToStr/Comment.nvim): Configuration for the `Comment.nvim` plugin
- [`conform.lua`](https://github.com/stevearc/conform.nvim): Configuration for the `conform.nvim` plugin
- [`dressing.lua`](https://github.com/stevearc/dressing.nvim): Configuration for the `dressing.nvim` plugin
- [`fidget.lua`](https://github.com/j-hui/fidget.nvim): Configuration for the `fidget` plugin
- [`gitsigns.lua`](https://github.com/lewis6991/gitsigns.nvim): Configuration for the `gitsigns.nvim` plugin
- [`notify.lua`](https://github.com/rcarriga/nvim-notify): Configuration for the `nvim-notify` plugin
- [`oil.lua`](https://github.com/stevearc/oil.nvim): Configuration for the `oil.nvim` plugin
- [`which_key.lua`](https://github.com/folke/which-key.nvim): Configuration for the `which-key.nvim` plugin
