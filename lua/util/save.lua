return function()
  local filepath = vim.fn.expand '%:p'

  pcall(function() vim.cmd('w ' .. filepath) end)
  pcall(function() vim.cmd('wa') end)
end
