local options = require("prettier.options")
local null_ls = require("prettier.null-ls")
local utils = require("prettier.utils")

local M = {
  config_exists = utils.config_exists,
}

function M.setup(user_options)
  options.setup(user_options)
  null_ls.setup()
end

function M.format(method, on_post_callback)
  on_post_callback = on_post_callback ~= nil and on_post_callback or function() end
  null_ls.format(method, on_post_callback)
end

return M
