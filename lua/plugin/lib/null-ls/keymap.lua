local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"
local timeout_ms = 5000

return function(client, bufnr)
  pcall(function()
    vim.keymap.set("n", "<leader>fj", function()
      vim.lsp.buf.format({
        bufnr = vim.api.nvim_get_current_buf(),
        timeout_ms = timeout_ms
      })
    end, { buffer = bufnr, desc = "[lsp] format" })

    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          async = async,
          timeout_ms = timeout_ms
        })
      end,
      desc = "[lsp] format on save",
    })
  end)

  pcall(function()
    vim.keymap.set("x", "<leader>fj", function()
      vim.lsp.buf.format({
        bufnr = vim.api.nvim_get_current_buf(),
        timeout_ms = timeout_ms
      })
    end, { buffer = bufnr, desc = "[lsp] format" })
  end)

  -- if client.supports_method("textDocument/formatting") then
  --   vim.keymap.set("n", "<leader>fj", function()
  --     vim.lsp.buf.format({
  --       bufnr = vim.api.nvim_get_current_buf(),
  --       timeout_ms = timeout_ms
  --     })
  --   end, { buffer = bufnr, desc = "[lsp] format" })
  --
  --   -- format on save
  --   vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
  --   vim.api.nvim_create_autocmd(event, {
  --     buffer = bufnr,
  --     group = group,
  --     callback = function()
  --       vim.lsp.buf.format({
  --         bufnr = bufnr,
  --         async = async,
  --         timeout_ms = timeout_ms
  --       })
  --     end,
  --     desc = "[lsp] format on save",
  --   })
  -- end
  --
  -- if client.supports_method("textDocument/rangeFormatting") then
  --   vim.keymap.set("x", "<leader>fj", function()
  --     vim.lsp.buf.format({
  --       bufnr = vim.api.nvim_get_current_buf(),
  --       timeout_ms = timeout_ms
  --     })
  --   end, { buffer = bufnr, desc = "[lsp] format" })
  -- end
end
