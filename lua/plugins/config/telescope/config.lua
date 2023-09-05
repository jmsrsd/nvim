local M = {}

M.use = function()
	local sorters = require("telescope.sorters")
	local previewers = require("telescope.previewers")
	local actions = require("telescope.actions")

	return {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},

			prompt_prefix = "   ",

			selection_caret = "  ",

			entry_prefix = "  ",

			initial_mode = "insert",

			selection_strategy = "reset",

			sorting_strategy = "ascending",

			layout_strategy = "horizontal",

			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},

				vertical = {
					mirror = false,
				},

				width = 0.87,

				height = 0.80,

				preview_cutoff = 120,
			},

			file_sorter = sorters.get_fuzzy_file,

			file_ignore_patterns = { "node_modules" },

			generic_sorter = sorters.get_generic_fuzzy_sorter,

			path_display = { "truncate" },

			winblend = 0,

			border = {},

			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

			color_devicons = true,

			--- default = nil,
			---
			set_env = { ["COLORTERM"] = "truecolor" },

			file_previewer = previewers.vim_buffer_cat.new,

			grep_previewer = previewers.vim_buffer_vimgrep.new,

			qflist_previewer = previewers.vim_buffer_qflist.new,

			buffer_previewer_maker = previewers.buffer_previewer_maker,

			mappings = {
				n = { ["q"] = actions.close },
			},
		},

		extensions = {
			media_files = {
				--- filetypes whitelist
				--- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				---
				filetypes = {
					"ico",
					"gif",
					"jpeg",
					"jpg",
					"mp4",
					"png",
					"webm",
					"webp",
				},

				--- find command (defaults to `fd`)
				---
				find_cmd = "rg",
			},

			fzf = {
				--- false will only do exact matching
				---
				fuzzy = true,

				--- override the generic sorter
				---
				override_generic_sorter = true,

				--- override the file sorter
				---
				override_file_sorter = true,

				--- the default case_mode is "smart_case"
				--- or "ignore_case" or "respect_case"
				---
				case_mode = "smart_case",
			},
		},
	}
end

return M
