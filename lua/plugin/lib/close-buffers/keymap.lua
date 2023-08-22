local bind = require 'util.bind'

bind {
  mode = { 'n' },
  lhs = '<leader>qq',
  rhs = function()
    pcall(require 'util.save')

    pcall(function()
      local close_buffers = require 'close_buffers'
      close_buffers.wipe { type = 'other' }
    end)
  end,
  opts = {
    noremap = true,
    desc = 'Delete all buffers except the current focused',
  }
}

-- function limit_buffers(max_buffers)
--   local buffers = vim.api.nvim_list_bufs()
--   if #buffers > max_buffers then
--     local buffer_to_delete = buffers[1]
--     vim.api.nvim_buf_delete(buffer_to_delete, { force = true })
--   end
-- end

-- vim.api.nvim_exec([[
--   autocmd BufEnter * lua limit_buffers(10)
-- ]], false)
