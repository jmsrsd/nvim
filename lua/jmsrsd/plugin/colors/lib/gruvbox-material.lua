if vim.fn.has('termguicolors') == 1 then
  vim.o.termguicolors = true
end

vim.o.background = 'dark'

vim.g['gruvbox_material_background'] = 'hard'
vim.g['gruvbox_material_foreground'] = 'material'
vim.g['gruvbox_material_enable_bold'] = 1
vim.g['gruvbox_material_enable_italic'] = 0
vim.g['gruvbox_material_visual'] = 'red background'
vim.g['gruvbox_material_menu_selection_background'] = 'yellow'
vim.g['gruvbox_material_sign_column_background'] = 'grey'
vim.g['gruvbox_material_spell_foreground'] = 'colored'
vim.g['gruvbox_material_ui_contrast'] = 'high'
vim.g['gruvbox_material_show_eob'] = 0
vim.g['gruvbox_material_diagnostic_text_highlight'] = 1
vim.g['gruvbox_material_diagnostic_line_highlight'] = 1
vim.g['gruvbox_material_diagnostic_virtual_text'] = 'colored'
vim.g['gruvbox_material_current_word'] = 'underline'
vim.g['gruvbox_material_disable_terminal_colors'] = 1
vim.g['gruvbox_material_transparent_background'] = 2
vim.g['gruvbox_material_better_performance'] = 1

vim.cmd('colorscheme gruvbox-material')
