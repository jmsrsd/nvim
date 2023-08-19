local bind = require 'util.bind'
local create_augroup = vim.api.nvim_create_augroup
local lsp = vim.lsp.buf

local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"
local timeout_ms = 5000

local group = create_augroup(
  "lsp_format_on_save",
  {
    clear = false
  }
)

return function(client, bufnr)
  local key = '<leader>fi'

  local action = function()
    lsp.format {
      bufnr = bufnr,
      -- bufnr = vim.api.nvim_get_current_buf(),
      async = async,
      timeout_ms = timeout_ms
    }
  end

  local opts = {
    buffer = bufnr,
    desc = '[f]ormat [i]t'
  }

  -- if client.supports_method("textDocument/formatting") then
  bind {
    mode = { 'n' },
    lhs = key,
    rhs = action,
    opts = opts,
  }

  -- format on save
  vim.api.nvim_clear_autocmds {
    buffer = bufnr,
    group = group,
  }

  vim.api.nvim_create_autocmd(
    event,
    {
      buffer = bufnr,
      group = group,
      callback = action,
      desc = "Format on Save",
    }
  )
  -- end

  -- if client.supports_method("textDocument/rangeFormatting") then
  bind {
    mode = { 'x' },
    lhs = key,
    rhs = action,
    opts = opts
  }
  -- end
end
