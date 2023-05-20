---@diagnostic disable: undefined-global

function SetColors()
  -- SetCodeDarkColors()
  -- SetOneDarkColors()
  -- SetMaterialColors()
  SetGruvboxMaterialColors()

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function SetGruvboxMaterialColors()
  vim.cmd('set background=dark')
  vim.cmd("let g:gruvbox_material_background='hard'")
  vim.cmd("let g:gruvbox_material_transparent_background='2'")
  vim.cmd("let g:gruvbox_material_better_performance='1'")
  vim.cmd('colorscheme gruvbox-material')
end

function SetOneDarkColors()
  local colors = require('onedark')

  colors.setup {
    style = 'darker',
    transparent = true,
  }

  colors.load()
end

function SetCodeDarkColors()
  -- If you don't like many colors and prefer the conservative style of the standard Visual Studio
  vim.cmd("let g:codedark_conservative=1")
  -- Activates italicized comments (make sure your terminal supports italics)
  vim.cmd("let g:codedark_italics=1")
  -- Make the background transparent
  vim.cmd("let g:codedark_transparent=1")
  -- If you have vim-airline, you can also enable the provided theme
  vim.cmd("let g:airline_theme = 'codedark'")

  vim.cmd("colorscheme codedark")
end

function SetMaterialColors()
  require('material').setup({
    contrast = {
      terminal = false,            -- Enable contrast for the built-in terminal
      sidebars = false,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
      floating_windows = false,    -- Enable contrast for floating windows
      cursor_line = false,         -- Enable darker background for the cursor line
      non_current_windows = false, -- Enable darker background for non-current windows
      filetypes = {},              -- Specify which filetypes get the contrasted (darker) background
    },

    styles = {
      -- Give comments style such as bold, italic, underline etc.
      comments = { --[[ italic = true ]] },
      strings = { --[[ bold = true ]] },
      keywords = { --[[ underline = true ]] },
      functions = { --[[ bold = true, undercurl = true ]] },
      variables = {},
      operators = {},
      types = {},
    },

    plugins = { -- Uncomment the plugins that you use to highlight them
      -- Available plugins:
      "dap",
      -- "dashboard",
      -- "gitsigns",
      -- "hop",
      -- "indent-blankline",
      -- "lspsaga",
      -- "mini",
      "neogit",
      -- "neorg",
      "nvim-cmp",
      -- "nvim-navic",
      "nvim-tree",
      "nvim-web-devicons",
      -- "sneak",
      "telescope",
      -- "trouble",
      "which-key",
    },

    disable = {
      colored_cursor = false, -- Disable the colored cursor
      borders = false,        -- Disable borders between verticaly split windows
      background = true,      -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
      term_colors = false,    -- Prevent the theme from setting terminal colors
      eob_lines = false       -- Hide the end-of-buffer lines
    },

    high_visibility = {
      lighter = false, -- Enable higher contrast text for lighter style
      darker = false   -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true,      -- Load parts of the theme asyncronously for faster startup (turned on by default)

    -- custom_colors = nil,       -- If you want to everride the default colors, set this to a function

    -- custom_highlights = {},    -- Overwrite highlights with your own
  })

  vim.cmd.colorscheme('material')

  -- vim.g.material_style = "deep ocean"
  -- vim.g.material_style = "palenight"
  -- vim.g.material_style = "oceanic"
  -- vim.g.material_style = "lighter"
  vim.g.material_style = "darker"
end

SetColors()
