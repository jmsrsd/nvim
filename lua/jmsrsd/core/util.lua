local M = {}

M.is_on_windows = string.find(vim.loop.os_uname().sysname, 'windows') ~= nil

return M
