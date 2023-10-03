return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup({
      background_colour = "#000000",
      timeout = 300,
      top_down = false,
    })

    local msg_blacklist = {
      "",
      "No information available",
    }

    vim.notify = function(msg, level, opts)
      --- Trim msg
      ---
      msg = msg:gsub("^%s*(.-)%s*$", "%1")

      --- Should not notify when msg is empty
      ---
      for _, blacklisted in ipairs(msg_blacklist) do
        if msg == blacklisted then
          return
        end
      end

      return notify(msg, level, opts)
    end
  end,
}
