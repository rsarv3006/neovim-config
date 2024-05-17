vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use "rebelot/kanagawa.nvim"

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use('nvim-treesitter/playground')

  use('theprimeagen/harpoon')

  use('ThePrimeagen/vim-be-good')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {
        'neovim/nvim-lspconfig',
        config = function()
          local lspconfig = require("lspconfig")
          local util = require("lspconfig.util")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_nvim_lsp.default_capabilities()
          local opts = { noremap = true, silent = true }
          local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show line diagnostics"
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Show documentation for what is under cursor"
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          end

          lspconfig["sourcekit"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
              "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
            },
            root_dir = function(filename, _)
              return util.root_pattern("buildServer.json")(filename)
                  or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
                  or util.find_git_ancestor(filename)
                  or util.root_pattern("Package.swift")(filename)
            end,
          })
        end
      }, -- Required
      {  -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- { 'mrcjkb/rustaceanvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest"
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup({
        -- your neotest config here
        adapters = {
          require("neotest-python"),
          require("neotest-go"),
          require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  })

  use('github/copilot.vim')

  use('prettier/vim-prettier')

  use('tpope/vim-commentary')

  use {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim", "vhyrro/luarocks.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  }

  use('APZelos/blamer.nvim')

  use('jremmen/vim-ripgrep')

  use {
    'wojciech-kulik/xcodebuild.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-tree.lua', -- if you want the integration with file tree
    },
    config = function()
      require('xcodebuild').setup({
        -- put some options here or leave it empty to use default settings
      })
    end,
  }

  use {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- setup
      Setup_swiftlint()
      lint.linters_by_ft = {
        swift = { "swiftlint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        group = lint_augroup,
        callback = function()
          require("lint").try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ml", function()
        require("lint").try_lint()
      end, { desc = "Lint file" })
    end,
  }

  use {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          swift = { "swiftformat_ext" },
        },
        log_level = vim.log.levels.ERROR,
        formatters = {
          swiftformat_ext = {
            command = "swiftformat",
            args = function()
              return {
                "--config",
                Find_conform_config() or "~/.config/nvim/.swiftformat", -- update fallback path if needed
                "--stdinpath",
                "$FILENAME",
              }
            end,
            range_args = function(ctx)
              return {
                "--config",
                Find_conform_config() or "~/.config/nvim/.swiftformat", -- update fallback path if needed
                "--linerange",
                ctx.range.start[1] .. "," .. ctx.range["end"][1],
              }
            end,
            stdin = true,
            condition = function(ctx)
              return vim.fs.basename(ctx.filename) ~= "README.md"
            end,
          },
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  }
end)
