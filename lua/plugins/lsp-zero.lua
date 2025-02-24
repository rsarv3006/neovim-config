return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
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

          lspconfig["zls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/zls") },
            root_dir = function(fname)
              return util.root_pattern('build.zig')(fname)
                  or util.find_git_ancestor(fname)
            end,
          })
        end
      }, -- Required
      {  -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")

      -- Fix Undefined global 'vim'
      lsp.nvim_workspace()

      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })
      cmp.setup({
        sources = {
          { name = "copilot",      group_index = 2 },
          { name = "vim-tabby" },
          { name = 'codecompanion' },
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'buffer',       keyword_length = 3 },
          { name = 'luasnip',      keyword_length = 2 },
        }
      })

      cmp.setup.filetype({
          "sql",
        },
        {
          sources = {
            { name = "vim-dadbod-completion" },
            { name = "copilot",              group_index = 2 },
            { name = "nvim_lsp" },
            { name = "buffer" },
          },
        })

      --cmp_mappings['<Tab>'] = nil
      --cmp_mappings['<S-Tab>'] = nil

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = 'E',
          warn = 'W',
          hint = 'H',
          info = 'I'
        }
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        lsp.buffer_autoformat()
      end)

      lsp.setup()

      vim.diagnostic.config({
        virtual_text = true
      })
    end
  }
}
