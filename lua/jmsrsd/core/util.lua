local M = {}

M.is_on_windows = string.find(vim.loop.os_uname().sysname, 'windows') ~= nil

M.getrelpath = function(str)
  str = vim.fn.expand(tostring(str))
  local cwd = vim.fn.getcwd()
  local result = str:sub(#cwd + 1)
  print(tostring(result))
  return tostring(result)
end

M.getmodpath = function()
  local curpath = vim.fn.expand('%:p')
  local configpath = vim.fn.stdpath('config')
  local relpath = curpath:sub(#configpath + 6, #curpath - 4)
  local modpath = relpath:gsub('\\', '.')

  return modpath
end

return M
