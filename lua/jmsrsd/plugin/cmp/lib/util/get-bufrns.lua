return function()
  local buf = vim.api.nvim_get_current_buf()
  local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))

  -- if byte_size > 1024 * 1024 * 1024 then -- 1 Gigabyte max
  if byte_size > 1024 * 1024 then -- 1 Megabyte max
    return {}
  end

  return { buf }
end
