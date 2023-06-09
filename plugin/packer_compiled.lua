-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()
  _G._packer = _G._packer or {}
  _G._packer.inside_compile = true

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
      end
    end
    if threshold then
      table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
    end

    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
  "C:\\Users\\Jemal\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\Jemal\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Jemal\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Jemal\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
  local install_cpath_pattern =
  "C:\\Users\\Jemal\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
          vim.log.levels.ERROR, {})
      end)
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ["Comment.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
      url = "https://github.com/numToStr/Comment.nvim"
    },
    LuaSnip = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
      url = "https://github.com/L3MON4D3/LuaSnip"
    },
    ["better-escape.nvim"] = {
      config = {
        "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18better_escape\frequire\0" },
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\better-escape.nvim",
      url = "https://github.com/max397574/better-escape.nvim"
    },
    ["close-buffers.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\close-buffers.nvim",
      url = "https://github.com/kazhala/close-buffers.nvim"
    },
    ["cmp-buffer"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
      url = "https://github.com/hrsh7th/cmp-buffer"
    },
    ["cmp-cmdline"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-cmdline",
      url = "https://github.com/hrsh7th/cmp-cmdline"
    },
    ["cmp-git"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-git",
      url = "https://github.com/petertriho/cmp-git"
    },
    ["cmp-nvim-lsp"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp"
    },
    ["cmp-path"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
      url = "https://github.com/hrsh7th/cmp-path"
    },
    cmp_luasnip = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp_luasnip",
      url = "https://github.com/saadparwaiz1/cmp_luasnip"
    },
    ["colorbuddy.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\colorbuddy.nvim",
      url = "https://github.com/tjdevries/colorbuddy.nvim"
    },
    ["dressing.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dressing.nvim",
      url = "https://github.com/stevearc/dressing.nvim"
    },
    ["fidget.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fidget.nvim",
      url = "https://github.com/j-hui/fidget.nvim"
    },
    ["flutter-tools.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\flutter-tools.nvim",
      url = "https://github.com/akinsho/flutter-tools.nvim"
    },
    ["friendly-snippets"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets",
      url = "https://github.com/rafamadriz/friendly-snippets"
    },
    fzf = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fzf",
      url = "https://github.com/junegunn/fzf"
    },
    ["git-blame.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\git-blame.nvim",
      url = "https://github.com/f-person/git-blame.nvim"
    },
    ["gruvbox-material"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox-material",
      url = "https://github.com/sainnhe/gruvbox-material"
    },
    ["gruvbuddy.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbuddy.nvim",
      url = "https://github.com/tjdevries/gruvbuddy.nvim"
    },
    ["lsp-zero.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-zero.nvim",
      url = "https://github.com/VonHeikemen/lsp-zero.nvim"
    },
    ["lspkind-nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim",
      url = "https://github.com/onsails/lspkind-nvim"
    },
    ["lualine.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
      url = "https://github.com/nvim-lualine/lualine.nvim"
    },
    ["mason-lspconfig.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
      url = "https://github.com/williamboman/mason-lspconfig.nvim"
    },
    ["mason.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
      url = "https://github.com/williamboman/mason.nvim"
    },
    ["material.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\material.nvim",
      url = "https://github.com/marko-cerovac/material.nvim"
    },
    ["neodev.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neodev.nvim",
      url = "https://github.com/folke/neodev.nvim"
    },
    ["neosolarized.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neosolarized.nvim",
      url = "https://github.com/svrana/neosolarized.nvim"
    },
    ["null-ls.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim",
      url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
    },
    ["nvim-autopairs"] = {
      config = {
        "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
      url = "https://github.com/windwp/nvim-autopairs"
    },
    ["nvim-cmp"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
      url = "https://github.com/hrsh7th/nvim-cmp"
    },
    ["nvim-dap"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap",
      url = "https://github.com/mfussenegger/nvim-dap"
    },
    ["nvim-dap-ui"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap-ui",
      url = "https://github.com/rcarriga/nvim-dap-ui"
    },
    ["nvim-lspconfig"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
      url = "https://github.com/neovim/nvim-lspconfig"
    },
    ["nvim-spider"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-spider",
      url = "https://github.com/chrisgrieser/nvim-spider"
    },
    ["nvim-surround"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-surround",
      url = "https://github.com/kylechui/nvim-surround"
    },
    ["nvim-tree.lua"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
      url = "https://github.com/nvim-tree/nvim-tree.lua"
    },
    ["nvim-treesitter"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
      url = "https://github.com/nvim-treesitter/nvim-treesitter"
    },
    ["nvim-ts-autotag"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-autotag",
      url = "https://github.com/windwp/nvim-ts-autotag"
    },
    ["nvim-web-devicons"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
      url = "https://github.com/nvim-tree/nvim-web-devicons"
    },
    ["onedark.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onedark.nvim",
      url = "https://github.com/navarasu/onedark.nvim"
    },
    ["packer.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
      url = "https://github.com/wbthomason/packer.nvim"
    },
    ["peek.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\peek.nvim",
      url = "https://github.com/toppair/peek.nvim"
    },
    playground = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
      url = "https://github.com/nvim-treesitter/playground"
    },
    ["plenary.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
      url = "https://github.com/nvim-lua/plenary.nvim"
    },
    ["prettier.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\prettier.nvim",
      url = "https://github.com/MunifTanjim/prettier.nvim"
    },
    ["telescope-file-browser.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-file-browser.nvim",
      url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
    },
    ["telescope-fzf-native.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzf-native.nvim",
      url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
    },
    ["telescope-lsp-handlers.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-lsp-handlers.nvim",
      url = "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim"
    },
    ["telescope-ui-select.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-ui-select.nvim",
      url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
    },
    ["telescope-zoxide"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-zoxide",
      url = "https://github.com/jvgrootveld/telescope-zoxide"
    },
    ["telescope.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
      url = "https://github.com/nvim-telescope/telescope.nvim"
    },
    undotree = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree",
      url = "https://github.com/mbbill/undotree"
    },
    ["vim-fugitive"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
      url = "https://github.com/tpope/vim-fugitive"
    },
    ["vim-repeat"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-repeat",
      url = "https://github.com/tpope/vim-repeat"
    },
    ["vim-sneak"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sneak",
      url = "https://github.com/justinmk/vim-sneak"
    },
    ["vim-snippets"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-snippets",
      url = "https://github.com/honza/vim-snippets"
    },
    ["which-key.nvim"] = {
      config = {
        "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim",
      url = "https://github.com/folke/which-key.nvim"
    },
    ["zoxide.vim"] = {
      loaded = true,
      path = "C:\\Users\\Jemal\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\zoxide.vim",
      url = "https://github.com/nanotee/zoxide.vim"
    }
  }

  time([[Defining packer_plugins]], false)
  -- Config for: which-key.nvim
  time([[Config for which-key.nvim]], true)
  try_loadstring(
  "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0",
    "config", "which-key.nvim")
  time([[Config for which-key.nvim]], false)
  -- Config for: nvim-autopairs
  time([[Config for nvim-autopairs]], true)
  try_loadstring(
  "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0",
    "config", "nvim-autopairs")
  time([[Config for nvim-autopairs]], false)
  -- Config for: better-escape.nvim
  time([[Config for better-escape.nvim]], true)
  try_loadstring(
  "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18better_escape\frequire\0",
    "config", "better-escape.nvim")
  time([[Config for better-escape.nvim]], false)

  _G._packer.inside_compile = false
  if _G._packer.needs_bufread == true then
    vim.cmd("doautocmd BufRead")
  end
  _G._packer.needs_bufread = false

  if should_profile then save_profiles() end
end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ' ..
  error_msg .. '" | echom "Please check your config for correctness" | echohl None')
end
