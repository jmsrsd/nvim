local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"

  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      'stevearc/oil.nvim',

      dependencies = { 
        "nvim-tree/nvim-web-devicons" 
      },

      config = function()
        local oil = require "oil"

        oil.setup {}

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      end
    }
  },
})
