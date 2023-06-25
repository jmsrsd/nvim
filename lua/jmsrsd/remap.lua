---@diagnostic disable: undefined-global

vim.keymap.set("n", "<leader>pp", function()
  -- vim.cmd.NvimTreeFocus()
  vim.cmd('NvimTreeFindFile')
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set({ "n", "i" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader><leader>", vim.cmd.LspZeroFormat)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({ 'n', 'v' }, '<Space>', '<nop>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Insert mode navigation
vim.keymap.set({ 'i', 'c' }, "<C-h>", "<Left>")
vim.keymap.set({ 'i', 'c' }, "<C-j>", "<Down>")
vim.keymap.set({ 'i', 'c' }, "<C-k>", "<Up>")
vim.keymap.set({ 'i', 'c' }, "<C-l>", "<Right>")

vim.keymap.set({ 'i', 'c' }, "<C-H>", "<C-Left>")
vim.keymap.set({ 'i', 'c' }, "<C-J>", "<C-Down>")
vim.keymap.set({ 'i', 'c' }, "<C-K>", "<C-Up>")
vim.keymap.set({ 'i', 'c' }, "<C-L>", "<C-Right>")

vim.keymap.set({ 'i', 'c' }, "<C-e>", "<Backspace>")

vim.keymap.set("n", "<leader>wq", "<cmd>wqa<CR>", { silent = true })

-- Remap format on current buffer
local save_all = function()
  vim.cmd("w | wa | e")
end

local is_using_prettier = function()
  local prettier_filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  }

  local current_filetype = vim.bo.filetype

  for _, filetype in ipairs(prettier_filetypes) do
    if filetype == current_filetype then
      return true
    end
  end

  return false
end

local format = function(callback)
  callback = callback ~= nil and callback or function() end

  if is_using_prettier() then
    require('prettier').format(nil, function()
      save_all()
      callback()
    end)
  else
    vim.lsp.buf.format()
    save_all()
    callback()
  end
end

vim.keymap.set("n", "<CR><CR>", format)

-- disable recording macros
vim.keymap.set("n", "q", "<nop>")

-- save all and quit
vim.keymap.set("n", "<leader>qq", function()
  vim.cmd("NvimTreeClose")
  format(function()
    vim.cmd('bufdo bd | NvimTreeOpen')
    vim.cmd.wincmd('h')
    vim.cmd('q')

    local base_path = os.getenv('localappdata')
    local file_path = '/nvim/after/plugin/lsp-setup.lua'
    vim.cmd.so(base_path .. file_path)
  end)
end)
