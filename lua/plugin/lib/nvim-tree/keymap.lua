-- Open project pane
--
vim.keymap.set('n', '<leader>pp', function()
  pcall(function() vim.cmd('exe "normal \\<CR>"') end)

  if vim.g.loaded_netrw ~= 1 then
    pcall(vim.cmd.Ex)
  else
    pcall(vim.cmd.NvimTreeFindFile)
  end
end, { noremap = true, desc = '[p]roject [p]ane' })
