local M = {}

M.bind = function(params) 
  vim.keymap.set(params.mode, params.lhs, params.rhs, params.opts)
end

return M
