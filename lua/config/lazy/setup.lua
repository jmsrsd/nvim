local lazy = require 'lazy'
local plugins = require 'plugin'

lazy.setup(
  plugins,
  {
    performance = {
      rtp = {
        disabled_plugins = {
          "2html_plugin",
          "bugreport",
          "compiler",
          "editorconfig",
          "ftplugin",
          "getscript",
          "getscriptPlugin",
          "gzip",
          "logipat",
          "matchit",
          "netrw",
          "netrwFileHandlers",
          "netrwPlugin",
          "netrwSettings",
          "optwin",
          "rplugin",
          "spellfile_plugin",
          "synmenu",
          "syntax",
          "tar",
          "tarPlugin", "rrhelper",
          "tohtml",
          "tutor",
          "vimball",
          "vimballPlugin",
          "zip",
          "zipPlugin",
        },
      },
    },
  }
)
