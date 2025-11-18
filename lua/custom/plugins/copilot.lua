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
          http = {
            bigbox = function()
              return require('codecompanion.adapters').extend('openai_compatible', {
                env = {
                  api_key = 'not-needed',
                  url = 'http://10.0.0.7:11434',
                },
                schema = {
                  model = {
                    default = 'qwen3-coder:30b',
                    choices = {
                      'qwen3-coder-8k:latest',
                      'qwen3-coder-12k:latest',
                      'qwen3-coder-16k:latest',
                      'llama3.1:70b-instruct-q3_K_S',
                      'qwen3-coder:30b',
                      'gpt-oss:20b',
                    },
                  },
                },
              })
            end,
          },
        },
        strategies = {
          chat = {
            adapter = 'bigbox',
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
