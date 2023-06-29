local fb_actions = require "telescope._extensions.file_browser.actions"

local M = {}

function M.load()
  require('telescope').load_extension 'file_browser'
end

M.config = {
  -- path
  -- cwd
  cwd_to_path = false,
  grouped = false,
  files = true,
  add_dirs = true,
  depth = 1,
  auto_depth = false,
  select_buffer = false,
  hidden = { file_browser = false, folder_browser = false },
  -- respect_gitignore
  -- browse_files
  -- browse_folders
  hide_parent_dir = false,
  collapse_dirs = false,
  prompt_path = false,
  quiet = false,
  dir_icon = "",
  dir_icon_hl = "Default",
  display_stat = { date = true, size = true, mode = true },
  hijack_netrw = false,
  use_fd = true,
  git_status = true,
  mappings = {
    ["i"] = {
      ["<A-c>"] = fb_actions.create,
      ["<S-CR>"] = fb_actions.create_from_prompt,
      ["<A-r>"] = fb_actions.rename,
      ["<A-m>"] = fb_actions.move,
      ["<A-y>"] = fb_actions.copy,
      ["<A-d>"] = fb_actions.remove,
      ["<C-o>"] = function()
        vim.cmd('exe "normal \\<CR>"')
      end,
      -- ["<C-o>"] = fb_actions.open,
      ["<C-g>"] = fb_actions.goto_parent_dir,
      ["<C-e>"] = fb_actions.goto_home_dir,
      ["<C-w>"] = fb_actions.goto_cwd,
      ["<C-t>"] = fb_actions.change_cwd,
      ["<C-f>"] = fb_actions.toggle_browser,
      ["<C-h>"] = fb_actions.toggle_hidden,
      ["<C-s>"] = fb_actions.toggle_all,
      ["<bs>"] = fb_actions.backspace,
    },
    ["n"] = {
      ["c"] = fb_actions.create,
      ["r"] = fb_actions.rename,
      ["m"] = fb_actions.move,
      ["y"] = fb_actions.copy,
      ["d"] = fb_actions.remove,
      ["o"] = function()
        vim.cmd('exe "normal \\<CR>"')
      end,
      -- ["o"] = fb_actions.open,
      ["g"] = fb_actions.goto_parent_dir,
      ["e"] = fb_actions.goto_home_dir,
      ["w"] = fb_actions.goto_cwd,
      ["t"] = fb_actions.change_cwd,
      ["f"] = fb_actions.toggle_browser,
      ["h"] = fb_actions.toggle_hidden,
      ["s"] = fb_actions.toggle_all,
    },
  },
}

return M
