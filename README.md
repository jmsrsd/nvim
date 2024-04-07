# Neovim Configuration

This repository contains my custom Neovim configuration. The configuration is
based on a variety of plugins that provide a rich set of features and
enhancements to the Neovim editor.

![Screenshot](/screenshots/20240407200832.png)

## Plugins

The following plugins are installed and configured in this Neovim setup:

- autopairs.lua  : Automatically close brackets and quotes.
- barbecue.lua   : Enhance the status line with diagnostics and git information.
- blankline.lua  : Adds blank lines for better visual separation.
- bufremove.lua  : Easily remove buffers.
- close_buffers/ : Enable quickly delete multiple buffers based on the conditions provided.
- cmp/           : Autocompletion with support for various sources.
- colorizer.lua  : Syntax highlighting for various file types.
- colorscheme/   : Custom color schemes including Catppuccin, Tokyo Night, and Vitesse.
- comment.lua    : Easy commenting and uncommenting of code blocks.
- compiler.lua   : Integration with compilers for various programming languages.
- conform.lua    : Automatically format code according to style guidelines.
- dressing.lua   : Enhance the appearance of Neovim with themes and icons.
- fidget/        : Asynchronous progress reporting for long-running tasks.
- git/           : Integration with Git for version control.
- incline/       : Improve code readability with automatic formatting.
- lsp/           : Language Server Protocol support for enhanced code intelligence.
- lualine.lua    : A customizable status line.
- luasnip.lua    : Snippet support for faster coding.
- oil.lua        : Operator-pending mode mappings.
- telescope/     : Fuzzy finding and file navigation.
- tmux.lua       : Integration with Tmux for terminal multiplexing.
- treesitter.lua : Syntax highlighting and code analysis.
- trim.lua       : Remove trailing whitespace and newlines.
- which_key.lua  : Show keybindings in a popup.
- zen.lua        : Distraction-free mode.

## Installation

1. Clone the repository into your Neovim configuration directory: ``` git clone
https://github.com/yourusername/jmsrsd.git ~/.config/nvim ```
3. Run Neovim to apply the configuration.
4. Restart Neovim to finish the installation.

## Usage

- **Keymaps**: Use the custom key mappings defined in `keymaps.lua` for
  efficient navigation and editing.
- **Options**: The `options.lua` file contains various Neovim settings for
  a streamlined editing experience.
- **Plugins**: Each plugin has its own configuration file within the `plugins`
  directory. Refer to the specific plugin documentation for usage instructions.

## Customization

To customize this configuration, you can modify the Lua files in the `configs`
directory. For plugin-specific customizations, refer to the plugin's
documentation and modify the corresponding Lua files in the `plugins`
directory.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open
issues for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for
details.
