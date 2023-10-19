--- Language:
---
--- Lua
---
--- Prerequisite:
---
--- brew install lua-language-server
---

local lspconfig = require 'lspconfig'

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      --- Disable telemetry
      ---
      telemetry = {
        enable = false,
      },

      runtime = {
        --- Tell the language server which version of
        ---
        --- Lua you're using
        ---
        --- (most likely LuaJIT in the case of Neovim)
        ---
        version = "LuaJIT",
        path = runtime_path,
      },

      diagnostics = {
        --- Get the language server to recognize the `vim` global
        ---
        globals = { "vim" },
      },

      workspace = {
        checkThirdParty = false,
        library = {
          --- Make the server aware of Neovim runtime files
          ---
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("config") .. "/lua",
        },
      },
    }
  }
}
