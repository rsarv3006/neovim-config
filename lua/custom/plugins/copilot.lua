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
                  url = 'http://10.0.0.39:11434',
                },
                schema = {
                  model = {
                    default = 'gpt-oss-65k',
                    choices = {
                      'gpt-oss-65k',
                      'qwen3.5:9b-65k',
                      'lfm2-65k:latest',
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
}
