return function(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return {
      desc = 'nvim-tree: ' .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  local bind = vim.keymap.set

  bind('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
  bind('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
  bind('n', '<C-k>', api.node.show_info_popup, opts('Info'))
  bind('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  bind('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
  bind('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  bind('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  bind('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  -- Default:
  -- bind('n', '<CR>', api.node.open.edit, opts('Open'))
  --
  bind('n', '<CR>', function()
    api.node.open.edit()
    vim.cmd.exe('"normal \\<C-W>="')
  end, opts('Open'))
  bind('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  bind('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  bind('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  bind('n', '.', api.node.run.cmd, opts('Run Command'))
  bind('n', '-', api.tree.change_root_to_parent, opts('Up'))
  bind('n', 'a', api.fs.create, opts('Create'))
  bind('n', 'bd', api.marks.bulk.delete, opts('Delete Bookmarked'))
  bind('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
  bind('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle Filter: No Buffer'))
  bind('n', 'c', api.fs.copy.node, opts('Copy'))
  bind('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Filter: Git Clean'))
  bind('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
  bind('n', ']c', api.node.navigate.git.next, opts('Next Git'))
  bind('n', 'd', api.fs.remove, opts('Delete'))
  bind('n', 'D', api.fs.trash, opts('Trash'))
  bind('n', 'E', api.tree.expand_all, opts('Expand All'))
  bind('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
  bind('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
  bind('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
  bind('n', 'F', api.live_filter.clear, opts('Clean Filter'))
  bind('n', 'f', api.live_filter.start, opts('Filter'))
  bind('n', 'g?', api.tree.toggle_help, opts('Help'))
  bind('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  bind('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
  bind('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Filter: Git Ignore'))
  bind('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  bind('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  bind('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
  bind('n', 'o', api.node.open.edit, opts('Open'))
  bind('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
  bind('n', 'p', api.fs.paste, opts('Paste'))
  bind('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  bind('n', 'q', api.tree.close, opts('Close'))
  bind('n', 'r', api.fs.rename, opts('Rename'))
  bind('n', 'R', api.tree.reload, opts('Refresh'))
  bind('n', 's', api.node.run.system, opts('Run System'))
  bind('n', 'S', api.tree.search_node, opts('Search'))
  bind('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Filter: Hidden'))
  bind('n', 'W', api.tree.collapse_all, opts('Collapse'))
  bind('n', 'x', api.fs.cut, opts('Cut'))
  bind('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  bind('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  bind('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  bind('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
end
