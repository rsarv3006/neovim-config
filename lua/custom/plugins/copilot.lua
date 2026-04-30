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
        inline = { adapter = 'bigbox' },
      },
    },
    config = function()
      require('codecompanion').setup {
        rules = {
          default = {
            description = 'Collection of common files for all projects',
            files = {
              '.clinerules',
              '.cursorrules',
              '.goosehints',
              '.rules',
              '.windsurfrules',
              '.github/copilot-instructions.md',
              'AGENT.md',
              'AGENTS.md',
              { path = 'CLAUDE.md', parser = 'claude' },
              { path = 'CLAUDE.local.md', parser = 'claude' },
              { path = '~/.claude/CLAUDE.md', parser = 'claude' },
              { path = '/home/rjs/dev/THIRDPARTY/rtk/hooks/codecompanion/rules.md', parser = 'codecompanion' },
            },
            is_preset = true,
          },
          opts = {
            chat = {
              autoload = 'default', -- The rule groups to load
              enabled = true,
            },
          },
        },
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
                    default = 'gemma4:e4b-65k',
                    choices = {
                      'gpt-oss-65k',
                      'qwen3.5:9b-65k',
                      'gemma4:e4b-65k',
                      'qwen3.6:latest',
                    },
                  },
                },
              })
            end,
            localBox = function()
              return require('codecompanion.adapters').extend('openai_compatible', {
                env = {
                  api_key = 'not-needed',
                  url = 'http://localhost:11434',
                },
                schema = {
                  model = {
                    default = 'gemma4:e4b',
                    choices = {
                      'gemma4:e4b',
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
          inline = {
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
