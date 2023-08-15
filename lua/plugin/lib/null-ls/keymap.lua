local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"
local timeout_ms = 5000

return function(client, bufnr)
  -- if client.supports_method("textDocument/formatting") then
  pcall(function()
    vim.keymap.set("n", "<leader>fi", function()
      vim.lsp.buf.format({
        bufnr = vim.api.nvim_get_current_buf(),
        timeout_ms = timeout_ms
      })
    end, { buffer = bufnr, desc = "[f]ormat [i]t" })

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
      desc = "Format on Save",
    })
  end)
  -- end

  -- if client.supports_method("textDocument/rangeFormatting") then
  pcall(function()
    vim.keymap.set("x", "<leader>fi", function()
      vim.lsp.buf.format({
        bufnr = vim.api.nvim_get_current_buf(),
        timeout_ms = timeout_ms
      })
    end, { buffer = bufnr, desc = "[f]ormat [i]t" })
  end)
  -- end
end
