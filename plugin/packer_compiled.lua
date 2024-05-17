-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
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
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
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
local package_path_str = "/Users/rjs/.cache/nvim/packer_hererocks/2.1.1697887905/share/lua/5.1/?.lua;/Users/rjs/.cache/nvim/packer_hererocks/2.1.1697887905/share/lua/5.1/?/init.lua;/Users/rjs/.cache/nvim/packer_hererocks/2.1.1697887905/lib/luarocks/rocks-5.1/?.lua;/Users/rjs/.cache/nvim/packer_hererocks/2.1.1697887905/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rjs/.cache/nvim/packer_hererocks/2.1.1697887905/lib/lua/5.1/?.so"
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
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["blamer.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/blamer.nvim",
    url = "https://github.com/APZelos/blamer.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n{\0\0\3\0\3\0\b5\0\0\0006\1\1\0B\1\1\2\14\0\1\0X\2\1Ä'\1\2\0>\1\2\0L\0\2\0 ~/.config/nvim/.swiftformat\24Find_conform_config\1\5\0\0\r--config\0\16--stdinpath\14$FILENAMEß\1\0\1\5\0\a\0\0175\1\0\0006\2\1\0B\2\1\2\14\0\2\0X\3\1Ä'\2\2\0>\2\2\0019\2\3\0009\2\4\2:\2\1\2'\3\5\0009\4\3\0009\4\6\4:\4\1\4&\2\4\2>\2\4\1L\1\2\0\bend\6,\nstart\nrange ~/.config/nvim/.swiftformat\24Find_conform_config\1\4\0\0\r--config\0\16--linerangeV\0\1\4\0\5\0\v6\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\2\a\1\4\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\14README.md\rfilename\rbasename\afs\bvimJ\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0¿\1\0\3\17lsp_fallback\2\nasync\1\15timeout_ms\3Ù\3\vformatü\3\1\0\a\0\29\0#6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\0036\4\b\0009\4\t\0049\4\n\0049\4\v\4=\4\f\0035\4\20\0005\5\r\0003\6\14\0=\6\15\0053\6\16\0=\6\17\0053\6\18\0=\6\19\5=\5\21\4=\4\22\3B\1\2\0016\1\b\0009\1\23\0019\1\24\0015\3\25\0'\4\26\0003\5\27\0005\6\28\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\tdesc*Format file or range (in visual mode)\0\15<leader>mp\1\3\0\0\6n\6v\bset\vkeymap\15formatters\20swiftformat_ext\1\0\0\14condition\0\15range_args\0\targs\0\1\0\2\nstdin\2\fcommand\16swiftformat\14log_level\nERROR\vlevels\blog\bvim\21formatters_by_ft\1\0\0\nswift\1\0\0\1\2\0\0\20swiftformat_ext\nsetup\fconform\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/opt/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neotest = {
    config = { "\27LJ\2\n|\0\1\6\0\b\0\0229\1\0\0\18\3\1\0009\1\1\1'\4\2\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\4\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\5\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\6\0'\5\a\0B\1\4\2L\1\2\0\5\t^%s+\b%s+\6\t\6 \6\n\tgsub\fmessage%\0\1\3\0\3\0\0046\1\0\0009\1\1\0019\1\2\1D\1\1\0\vgetcwd\afn\bvimô\3\1\0\t\0\23\1*6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\4\0019\1\5\0015\3\t\0005\4\a\0003\5\6\0=\5\b\4=\4\n\3\18\4\0\0B\1\3\0016\1\v\0'\3\3\0B\1\2\0029\1\f\0015\3\21\0004\4\4\0006\5\v\0'\a\r\0B\5\2\2>\5\1\0046\5\v\0'\a\14\0B\5\2\2>\5\2\0046\5\v\0'\a\15\0B\5\2\0025\a\16\0005\b\17\0=\b\18\a3\b\19\0=\b\20\aB\5\2\0?\5\0\0=\4\22\3B\1\2\1K\0\1\0\radapters\1\0\0\bcwd\0\benv\1\0\1\aCI\2\1\0\2\19jestConfigFile\26custom.jest.config.ts\16jestCommand\16npm test --\17neotest-jest\15neotest-go\19neotest-python\nsetup\frequire\17virtual_text\1\0\0\vformat\1\0\0\0\vconfig\15diagnostic\fneotest\26nvim_create_namespace\bapi\bvim\aÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/nvim-neotest/neotest-go"
  },
  ["neotest-jest"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rtry_lint\tlint\frequire5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rtry_lint\tlint\frequire‚\2\1\0\b\0\23\0!6\0\0\0'\2\1\0B\0\2\0026\1\2\0B\1\1\0015\1\5\0005\2\4\0=\2\6\1=\1\3\0006\1\a\0009\1\b\0019\1\t\1'\3\1\0005\4\n\0B\1\3\0026\2\a\0009\2\b\0029\2\v\0025\4\f\0005\5\r\0=\1\14\0053\6\15\0=\6\16\5B\2\3\0016\2\a\0009\2\17\0029\2\18\2'\4\19\0'\5\20\0003\6\21\0005\a\22\0B\2\5\1K\0\1\0\1\0\1\tdesc\14Lint file\0\15<leader>ml\6n\bset\vkeymap\rcallback\0\ngroup\1\0\0\1\3\0\0\17BufWritePost\16BufReadPost\24nvim_create_autocmd\1\0\1\nclear\2\24nvim_create_augroup\bapi\bvim\nswift\1\0\0\1\2\0\0\14swiftlint\18linters_by_ft\20Setup_swiftlint\tlint\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/opt/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nê\2\0\2\b\1\15\0\30-\2\0\0=\1\0\2-\2\0\0'\3\2\0=\3\1\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0006\6\3\0009\6\b\0069\6\t\6-\a\0\0B\2\5\1-\2\0\0'\3\n\0=\3\1\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0006\6\3\0009\6\f\0069\6\r\0069\6\14\6-\a\0\0B\2\5\1K\0\1\0\4¿\nhover\bbuf\blsp\6K0Show documentation for what is under cursor\15open_float\15diagnostic\14<leader>d\6n\bset\vkeymap\bvim\26Show line diagnostics\tdesc\vbufferŸ\1\0\2\6\1\6\0\30-\2\0\0009\2\0\2'\4\1\0B\2\2\2\18\4\0\0B\2\2\2\14\0\2\0X\3\21Ä-\2\0\0009\2\0\2'\4\2\0'\5\3\0B\2\3\2\18\4\0\0B\2\2\2\14\0\2\0X\3\fÄ-\2\0\0009\2\4\2\18\4\0\0B\2\2\2\14\0\2\0X\3\6Ä-\2\0\0009\2\0\2'\4\5\0B\2\2\2\18\4\0\0B\2\2\2L\2\2\0\1¿\18Package.swift\22find_git_ancestor\18*.xcworkspace\16*.xcodeproj\21buildServer.json\17root_pattern‰\2\1\0\n\0\16\0\0256\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\2B\3\1\0025\4\5\0003\5\6\0009\6\a\0009\6\b\0065\b\t\0=\3\n\b=\5\v\b5\t\f\0=\t\r\b3\t\14\0=\t\15\bB\6\2\0012\0\0ÄK\0\1\0\rroot_dir\0\bcmd\1\2\0\0i/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp\14on_attach\17capabilities\1\0\0\nsetup\14sourcekit\0\1\0\2\vsilent\2\fnoremap\2\25default_capabilities\17cmp_nvim_lsp\19lspconfig.util\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n>\0\1\5\0\4\0\0066\1\0\0009\1\1\0019\1\2\0015\3\3\0\18\4\0\0D\1\3\0\1\5\0\0\ttidy\a-i\a-q\6-\vsystem\afn\bvimÅ\3\1\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0003\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\15formatters\thtml\0\1\0\1\tjson\ajq\1\0\4\22show_curl_command\1\rshow_url\2\17show_headers\2\19show_http_info\2\14highlight\1\0\2\fenabled\2\ftimeout\3ñ\1\1\0\a\26result_split_in_place\1\28result_split_horizontal\1\26skip_ssl_verification\1\20jump_to_request\1\17yank_dry_run\2\renv_file\t.env\15encode_url\2\nsetup\14rest-nvim\frequire\0" },
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/rest.nvim",
    url = "https://github.com/rest-nvim/rest.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/vim-ripgrep",
    url = "https://github.com/jremmen/vim-ripgrep"
  },
  ["xcodebuild.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15xcodebuild\frequire\0" },
    loaded = true,
    path = "/Users/rjs/.local/share/nvim/site/pack/packer/start/xcodebuild.nvim",
    url = "https://github.com/wojciech-kulik/xcodebuild.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n|\0\1\6\0\b\0\0229\1\0\0\18\3\1\0009\1\1\1'\4\2\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\4\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\5\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\6\0'\5\a\0B\1\4\2L\1\2\0\5\t^%s+\b%s+\6\t\6 \6\n\tgsub\fmessage%\0\1\3\0\3\0\0046\1\0\0009\1\1\0019\1\2\1D\1\1\0\vgetcwd\afn\bvimô\3\1\0\t\0\23\1*6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\4\0019\1\5\0015\3\t\0005\4\a\0003\5\6\0=\5\b\4=\4\n\3\18\4\0\0B\1\3\0016\1\v\0'\3\3\0B\1\2\0029\1\f\0015\3\21\0004\4\4\0006\5\v\0'\a\r\0B\5\2\2>\5\1\0046\5\v\0'\a\14\0B\5\2\2>\5\2\0046\5\v\0'\a\15\0B\5\2\0025\a\16\0005\b\17\0=\b\18\a3\b\19\0=\b\20\aB\5\2\0?\5\0\0=\4\22\3B\1\2\1K\0\1\0\radapters\1\0\0\bcwd\0\benv\1\0\1\aCI\2\1\0\2\19jestConfigFile\26custom.jest.config.ts\16jestCommand\16npm test --\17neotest-jest\15neotest-go\19neotest-python\nsetup\frequire\17virtual_text\1\0\0\vformat\1\0\0\0\vconfig\15diagnostic\fneotest\26nvim_create_namespace\bapi\bvim\aÄÄ¿ô\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: xcodebuild.nvim
time([[Config for xcodebuild.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15xcodebuild\frequire\0", "config", "xcodebuild.nvim")
time([[Config for xcodebuild.nvim]], false)
-- Config for: rest.nvim
time([[Config for rest.nvim]], true)
try_loadstring("\27LJ\2\n>\0\1\5\0\4\0\0066\1\0\0009\1\1\0019\1\2\0015\3\3\0\18\4\0\0D\1\3\0\1\5\0\0\ttidy\a-i\a-q\6-\vsystem\afn\bvimÅ\3\1\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0003\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\15formatters\thtml\0\1\0\1\tjson\ajq\1\0\4\22show_curl_command\1\rshow_url\2\17show_headers\2\19show_http_info\2\14highlight\1\0\2\fenabled\2\ftimeout\3ñ\1\1\0\a\26result_split_in_place\1\28result_split_horizontal\1\26skip_ssl_verification\1\20jump_to_request\1\17yank_dry_run\2\renv_file\t.env\15encode_url\2\nsetup\14rest-nvim\frequire\0", "config", "rest.nvim")
time([[Config for rest.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nê\2\0\2\b\1\15\0\30-\2\0\0=\1\0\2-\2\0\0'\3\2\0=\3\1\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0006\6\3\0009\6\b\0069\6\t\6-\a\0\0B\2\5\1-\2\0\0'\3\n\0=\3\1\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0006\6\3\0009\6\f\0069\6\r\0069\6\14\6-\a\0\0B\2\5\1K\0\1\0\4¿\nhover\bbuf\blsp\6K0Show documentation for what is under cursor\15open_float\15diagnostic\14<leader>d\6n\bset\vkeymap\bvim\26Show line diagnostics\tdesc\vbufferŸ\1\0\2\6\1\6\0\30-\2\0\0009\2\0\2'\4\1\0B\2\2\2\18\4\0\0B\2\2\2\14\0\2\0X\3\21Ä-\2\0\0009\2\0\2'\4\2\0'\5\3\0B\2\3\2\18\4\0\0B\2\2\2\14\0\2\0X\3\fÄ-\2\0\0009\2\4\2\18\4\0\0B\2\2\2\14\0\2\0X\3\6Ä-\2\0\0009\2\0\2'\4\5\0B\2\2\2\18\4\0\0B\2\2\2L\2\2\0\1¿\18Package.swift\22find_git_ancestor\18*.xcworkspace\16*.xcodeproj\21buildServer.json\17root_pattern‰\2\1\0\n\0\16\0\0256\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\2B\3\1\0025\4\5\0003\5\6\0009\6\a\0009\6\b\0065\b\t\0=\3\n\b=\5\v\b5\t\f\0=\t\r\b3\t\14\0=\t\15\bB\6\2\0012\0\0ÄK\0\1\0\rroot_dir\0\bcmd\1\2\0\0i/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp\14on_attach\17capabilities\1\0\0\nsetup\14sourcekit\0\1\0\2\vsilent\2\fnoremap\2\25default_capabilities\17cmp_nvim_lsp\19lspconfig.util\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lint', 'conform.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-lint', 'conform.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
