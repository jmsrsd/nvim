-- Alias to vim.keymap.set
--
-- Binding structure:
--
-- [1] mode,
-- [2] lhs,
-- [3] rhs,
-- [4] opts,
--
return function(config)
  vim.keymap.set(
    config.mode,
    config.lhs,
    config.rhs,
    config.opts
  )
end
