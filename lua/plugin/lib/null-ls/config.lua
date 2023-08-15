local M = {}

M.setup = function()
  local on_attach = require('plugin.lib.lsp-zero.keymap')
  -- local root_dir = require('null-ls.utils').root_pattern("package.json")
  -- local root_dir = require('null-ls.utils').root_pattern(".null-ls-root", "Makefile", ".git")
  -- local root_dir = vim.loop.cwd

  local root_dir  = require('null-ls.utils').root_pattern(
    'node_modules',
    'package.json'
  )

  -- local root_dir  = function(start_path)
  --   local find_dir = function(fname)
  --     return utils.root_pattern(fname)(start_path)
  --   end
  --
  --   local dirs = {
  --     -- eslint
  --     --
  --     find_dir('.eslintrc.js'),
  --     find_dir('.eslintrc.cjs'),
  --     find_dir('.eslintrc.yaml'),
  --     find_dir('.eslintrc.yml'),
  --     find_dir('.eslintrc.json'),
  --
  --     -- prettier
  --     --
  --     find_dir('.prettierrc.cjs'),
  --     find_dir('.prettierrc.js'),
  --     find_dir('.prettierrc.json'),
  --     find_dir('.prettierrc.json5'),
  --     find_dir('.prettierrc.mjs'),
  --     find_dir('.prettierrc.toml'),
  --     find_dir('.prettierrc.yaml'),
  --     find_dir('.prettierrc.yml'),
  --
  --     find_dir('prettier.config.cjs'),
  --     find_dir('prettier.config.js'),
  --     find_dir('prettier.config.mjs'),
  --
  --     -- etc
  --     --
  --     find_dir(".git"),
  --     find_dir("node_modules"),
  --     find_dir("package.json"),
  --   }
  --
  --   for _, dir in ipairs(dirs) do
  --     print(dir)
  --   end
  --
  --
  --   for _, dir in ipairs(dirs) do
  --     if dir and true then return dir end
  --   end
  --
  --   -- Fallback to the current file's directory
  --   --
  --   return vim.fn.expand("%:p:h")
  -- end

  require("null-ls").setup({
    -- update_in_insert = true,
    -- on_attach = require('plugin.lib.null-ls.keymap'),
    -- border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    root_dir = root_dir,
    on_attach = on_attach,
  })
end

return M
