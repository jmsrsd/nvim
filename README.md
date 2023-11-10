# Jmsrsd's Neovim Configuration

🔧 This is my maintained configuration for the Neovim text editor, which includes various modules and dependencies. I regularly update it, focusing on improvements, new features, and bug fixes.

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
ln -s neovim-config $HOME/.config/nvim
```

## Usage

This configuration includes various plugins and settings for different purposes. Some of them are:

- [cmp](https://github.com/hrsh7th/nvim-cmp) for autocompletion
- [lsp](https://neovim.io/doc/user/lsp.html) for language server protocol support
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting and code understanding
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) for a beautiful status line

## Configuration Files

This configuration is organized into multiple Lua files in the `configs` directory:

- `cmp.lua`: Configuration for the `cmp` plugin
- `lsp.lua`: Configuration for the `lsp` plugin
- `treesitter.lua`: Configuration for the `treesitter` plugin
- `telescope.lua`: Configuration for the `telescope.nvim` plugin
- `lualine.lua`: Configuration for the `lualine.nvim` plugin
- `autopairs.lua`: Configuration for the `autopairs` plugin
- `blankline.lua`: Configuration for the `blankline` plugin
- `catppuccin.lua`: Configuration for the `catppuccin` theme
- `close_buffers.lua`: Configuration for the `close_buffers` plugin
- `comment.lua`: Configuration for the `comment` plugin
- `conform.lua`: Configuration for the `conform` plugin
- `dressing.lua`: Configuration for the `dressing` plugin
- `fidget.lua`: Configuration for the `fidget` plugin
- `gitsigns.lua`: Configuration for the `gitsigns` plugin
- `notify.lua`: Configuration for the `notify` plugin
- `oil.lua`: Configuration for the `oil` plugin
- `which_key.lua`: Configuration for the `which_key` plugin
