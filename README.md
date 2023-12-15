# Jmsrsd's Neovim Configuration

This repository contains my personal Neovim configuration files, also known as
dotfiles. The configuration is written in Lua and is organized into several
modules, each responsible for a specific feature or plugin.

![Screenshot](/screenshots/202311201429.png)

The main configuration file is `init.lua`, which initializes the Neovim
environment and loads the rest of the configuration files. The `lua` directory
contains the main configuration files for the Neovim setup, including key
mappings, options, and plugins.

The `lua/jmsrsd/configs` directory contains configuration files for various
plugins, such as `autopairs.lua`, `barbecue.lua`, `blankline.lua`,
`catppuccin.lua`, `comment.lua`, `conform.lua`, `dressing.lua`, `fidget`,
`git`, `incline`, `lsp`, `lualine.lua`, `luasnip.lua`, `oil.lua`, `telescope`,
`tmux.lua`, `treesitter.lua`, `which_key.lua`, and `zen.lua`.

The `lua/jmsrsd/utils` directory contains utility files for the configuration,
such as `array.lua`, `buffer.lua`, `catch.lua`, `cmd.lua`, `import_all.lua`,
`import.lua`, `keymap.lua`, `lsp.lua`, `number.lua`, `path.lua`,
`priority.lua`, and `string.lua`.

This repository is a work in progress and is continually updated as I add new
plugins and features to my Neovim setup. Feel free to clone, fork, or
contribute to this repository. Pull requests are welcome for any fixes or
features you want to add.

To clone this repository, you can use the following command:

```bash
git clone https://github.com/jmsrsd/nvim.git
```

To use this configuration, you can copy the `init.lua` file and the `lua`
directory to your Neovim configuration directory (usually `~/.config/nvim`).

Please note that this configuration is highly personalized and may not work out
of the box for others. It is intended as a reference and starting point for
your own Neovim configuration.
