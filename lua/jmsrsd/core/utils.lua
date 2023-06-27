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

M.lsp_setup_path = (function()
  local base_path = os.getenv('localappdata')
  local file_path = '/nvim/after/plugin/lsp-setup.lua'
  return base_path .. file_path
end)()

function M.save_all()
  pcall(vim.cmd.w)
  pcall(vim.cmd.e)
  pcall(vim.cmd.wa)
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

  local is_using_prettier = M.array_contains(
    M.prettier_filetypes,
    vim.bo.filetype
  )

  if is_using_prettier then
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
      pcall(function() vim.cmd.so(M.lsp_setup_path) end)
    end)
  end)
end

return M
