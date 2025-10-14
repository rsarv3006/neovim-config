return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<S-Tab>',
        },
      },
    },
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        -- inline = { adapter = "copilot" },
      },
    },
    config = function()
      require('codecompanion').setup {
        adapters = {
          lmstudio = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              env = {
                api_key = 'not-needed',
                url = 'http://localhost:1234',
              },
              schema = {
                model = {
                  default = 'openai/gpt-oss-20b',
                  choices = {
                    'openai/gpt-oss-20b',
                    'qwen2.5-coder-7b-instruct',
                  },
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = 'lmstudio',
          },
        },
        display = {
          action_palette = {
            provider = 'telescope', -- or "mini_pick" or "vim.ui.select"
          },
        },
      }
    end,
  },
  -- {
  --   "TabbyML/vim-tabby",
  --   lazy = false,
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --   },
  --   init = function()
  --     vim.g.tabby_agent_start_command = { "npx", "tabby-agent", "--stdio" }
  --     vim.g.tabby_inline_completion_trigger = "auto"
  --     vim.g.tabby_inline_completion_keybinding_accept = "<S-Tab>"
  --   end,
  -- },
}
