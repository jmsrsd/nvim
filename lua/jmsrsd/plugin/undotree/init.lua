-- Enable persistent undo
if vim.fn.has('persistent_undo') then
  local target_path = vim.fn.stdpath('config') .. "/undodir/"

  if vim.fn.isdirectory(target_path) then
    vim.fn.mkdir(target_path, 'p', 0700)
  end

  vim.opt.undodir = target_path
  vim.opt.undofile = true
end

-- Undotree is currently broken
-- vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
