local keys = {
	{
		lhs = "<leader>fl",
		mode = { "n", "x", "o" },
		rhs = function()
			require("flash").jump()
		end,
		desc = "Flash",
	},
	{
		lhs = "<leader>fL",
		mode = { "n", "o", "x" },
		rhs = function()
			require("flash").treesitter()
		end,
		desc = "Flash Treesitter",
	},
	{
		lhs = "<leader>fr",
		mode = "o",
		rhs = function()
			require("flash").remote()
		end,
		desc = "Remote Flash",
	},
	{
		lhs = "<leader>fR",
		mode = { "o", "x" },
		rhs = function()
			require("flash").treesitter_search()
		end,
		desc = "Flash Treesitter Search",
	},
	{
		lhs = "<C-s>",
		mode = { "c" },
		rhs = function()
			require("flash").toggle()
		end,
		desc = "Toggle Flash Search",
	},
}

for _, key in ipairs(keys) do
	vim.keymap.set(key.mode, key.lhs, key.rhs, { noremap = true, desc = key.desc })
end
