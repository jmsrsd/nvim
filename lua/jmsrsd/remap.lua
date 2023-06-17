---@diagnostic disable: undefined-global

vim.keymap.set("n", "<leader>pp", function()
  -- vim.cmd.NvimTreeFocus()
  vim.cmd.NvimTreeFindFile()
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

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap format on current buffer
vim.keymap.set("n", "<CR><CR>", function()
  local prettier_file_extensions = {
    'css',
    'html',
    'js',
    'json',
    'jsx',
    'md',
    'scss',
    'ts',
    'tsx',
    'yaml',
  }

  local current_file = vim.fn.expand('%')
  local file_extension = vim.fn.fnamemodify(current_file, ':e')

  if vim.tbl_contains(prettier_file_extensions, file_extension) then
    pcall(require("prettier").format)
  else
    pcall(vim.cmd.LspZeroFormat)
    pcall(vim.cmd.w)
    pcall(vim.cmd.wa)
  end
end, opts)

-- disable recording macros
vim.keymap.set("n", "q", "<nop>")

-- save all and quit
vim.keymap.set("n", "<leader>qq", function()
  vim.cmd("wqa")
end)
