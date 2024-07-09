local helper = {
	keymap = require("jmsrsd.helpers.keymap"),
}

local set = helper.keymap.set

local describe = helper.keymap.describe

return {

	"nvim-telescope/telescope.nvim",

	dependencies = {

		{ "nvim-lua/plenary.nvim" },

		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

		{ "rcarriga/nvim-notify", lazy = false, opts = {} },
	},

	config = function()
		local telescope = require("telescope")

		local builtin = require("telescope.builtin")

		local actions = require("telescope.actions")

		local sorters = require("telescope.sorters")

		local previewers = require("telescope.previewers")

		local create_buffer_previewer_maker = function()
			local Job = require("plenary.job")

			return function(filepath, bufnr, opts)
				filepath = vim.fn.expand(filepath) .. ""

				Job:new({
					command = "file",
					args = { "--mime-type", "-b", filepath },
					on_exit = function(j)
						local mime_type = vim.split(j:result()[1], "/")[1]

						if mime_type == "text" then
							previewers.buffer_previewer_maker(filepath, bufnr, opts)
						else
							--- Maybe we want to write something to the buffer here
							---
							vim.schedule(function()
								vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
									"   No preview available",
								})
							end)
						end
					end,
				}):sync()
			end
		end

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["<Esc>"] = false,
						["q"] = actions.close,
					},
				},

				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--no-ignore",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},

				prompt_prefix = "   ",

				selection_caret = "  ",

				entry_prefix = "  ",

				initial_mode = "insert",

				selection_strategy = "reset",

				sorting_strategy = "ascending",

				--- Can be set with:
				---
				--- "vertical", or "horizontal"
				---
				layout_strategy = "vertical",

				layout_config = {
					vertical = {
						preview_height = 0.6,
						results_height = 0.4,
					},
				},

				file_sorter = sorters.get_fuzzy_file,

				file_ignore_patterns = { "node_modules" },

				generic_sorter = sorters.get_generic_fuzzy_sorter,

				path_display = { "truncate" },

				--- UNUSED: winblend = 0,

				border = {},

				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

				color_devicons = true,

				--- DEFAULT: set_env = nil
				---
				set_env = { ["COLORTERM"] = "truecolor" },

				file_previewer = previewers.vim_buffer_cat.new,

				grep_previewer = previewers.vim_buffer_vimgrep.new,

				qflist_previewer = previewers.vim_buffer_qflist.new,

				buffer_previewer_maker = create_buffer_previewer_maker(),
			},
			pickers = {
				find_files = {
					--- `hidden = true` will still show the inside of `.git/` as it's not
					--- `.gitignore`d.
					---
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		--- Extensions
		---

		vim.tbl_map(telescope.load_extension, {
			"fzf",
			"notify",
		})

		--- Keymaps
		---

		set("n", "<leader>f", function()
			return builtin.find_files({
				follow = true,
				hidden = true,
				no_ignore = true,
				no_ignore_parent = true,
			})
		end, describe("Search for files"))

		set("n", "<leader>g", builtin.live_grep, describe("Search for a string and get results live as you type"))

		set(
			"n",
			"<leader>b",
			builtin.buffers,
			describe("Lists open buffers in current neovim instance, opens selected buffer on `<cr>`")
		)

		set(
			"n",
			"<leader>/",
			builtin.current_buffer_fuzzy_find,
			describe("Live fuzzy search inside of the currently open buffer")
		)
	end,
}
