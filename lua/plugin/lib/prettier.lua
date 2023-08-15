return {
  'MunifTanjim/prettier.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'jose-elias-alvarez/null-ls.nvim' },
  },
  config = function()
    local prettier = require("prettier")

    prettier.setup({
      bin = 'prettierd', -- npm install -g @fsouza/prettierd
      -- bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "astro",
        "css",
        "graphql",
        "html",
        "javascript",
        "javascript.jsx",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "yaml",
      },
      ["null-ls"] = {
        condition = function()
          return prettier.config_exists({
            -- if `false`, skips checking `package.json` for `"prettier"` key
            check_package_json = true,
          })
        end,
        runtime_condition = function(params)
          -- return false to skip running prettier
          return true
        end,
        timeout = 5000,
      },
      cli_options = {
        -- https://prettier.io/docs/en/cli.html#--config-precedence
        config_precedence = "prefer-file", -- or "cli-override" or "file-override"
      },
    })
  end,
}
