-- telescope-file-browser
vim.keymap.set("n", "<leader>oo", function()
  vim.cmd.Telescope('file_browser')
end, { silent = true, noremap = true, })

-- nvim-tree
vim.keymap.set("n", "<leader>pp", function()
  vim.cmd.NvimTreeFindFile()
end, { silent = true, noremap = true, })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

-- Do not yank with x
vim.keymap.set('n', 'x', '"_x')

-- Delete word backward
vim.keymap.set('n', 'dw', 'vb"_d')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")

vim.keymap.set({ "c", "i", "l", "n", "o", "s", "t", "v", "x" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- disable recording macros
vim.keymap.set("n", "q", "<nop>")

-- Quick quit
vim.keymap.set("n", "<leader>wq", function()
  pcall(function()
    vim.cmd('exe "normal \\<CR>\\<CR>"')
  end)

  vim.schedule(vim.cmd.wqa)
end, { silent = true })

-- Restart
vim.keymap.set('n', '<leader>qq', function()
  pcall(function()
    vim.cmd('exe "normal \\<CR>\\<CR>"')
  end)
  vim.cmd.bufdo('bd')
  vim.schedule(vim.cmd.NvimTreeOpen)
  vim.schedule(function()
    vim.cmd.wincmd('h')
    vim.schedule(vim.cmd.q)
  end)
end, { noremap = true })

vim.keymap.set("n", "<CR><CR>", function()
  local filepath = vim.fn.expand('%:p')
  vim.cmd('w ' .. filepath)
  vim.cmd('e ' .. filepath)
  vim.cmd('wa')
end)
