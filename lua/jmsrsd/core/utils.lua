local M = {}

M.prettier_filetypes = {
  "css",
  "graphql",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "less",
  "markdown",
  "scss",
  "typescript",
  "typescriptreact",
  "yaml",
}

M.config_init_filepath = (function()
  local base_path = vim.fn.stdpath('config')
  local file_path = '/init.lua'
  return base_path .. file_path
end)()

M.plugin_init_filepath = (function()
  local base_path = vim.fn.stdpath('config')
  local file_path = '/after/plugin/init.lua'
  return base_path .. file_path
end)()

function M.save_all()
  pcall(vim.cmd.w)
  pcall(vim.cmd.wa)
  pcall(vim.cmd.e)
end

function M.array_contains(array, value)
  for _, element in ipairs(array) do
    if element == value then
      return true
    end
  end

  return false
end

function M.format(callback)
  local _format = function()
    vim.lsp.buf.format()
    pcall(M.save_all)
    pcall(function() callback() end)
  end

  local prettier_enabled = M.array_contains(
    M.prettier_filetypes,
    vim.bo.filetype
  )

  if prettier_enabled then
    pcall(function()
      require("prettier").format(nil, _format)
    end)
  else
    pcall(_format)
  end
end

function M.restart()
  pcall(vim.cmd.NvimTreeClose)
  pcall(function()
    M.format(function()
      pcall(function() vim.cmd('bufdo bd') end)
      pcall(vim.cmd.NvimTreeOpen)
      pcall(function() vim.cmd.wincmd('h') end)
      pcall(vim.cmd.q)
      pcall(function()
        vim.cmd.so(M.config_init_filepath)
        vim.cmd.so(M.plugin_init_filepath)
      end)
    end)
  end)
end

return M
