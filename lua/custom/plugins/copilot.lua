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
    dir = '/home/rjs/dev/codecompanion.nvim',
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
        auto_mode = {
          enabled = true,
          primary_adapter = 'bigbox',
          fast_adapter = 'bigbox',
          fast_model = 'gemma4:12b',
          rules = {
            max_tokens_for_fast = 16000, -- tune to your fast model's context
          },
        },

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
                    default = 'hf.co/unsloth/Qwen3.6-27B-MTP-GGUF:Q3_K_M',
                    choices = {
                      'hf.co/unsloth/Qwen3.6-27B-MTP-GGUF:Q3_K_M',
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
                    default = 'gemma4:12b',
                    choices = {
                      'gemma4:e4b',
                      'granite4.1:30b-q3_K_S',
                      'gemma4:12b',
                    },
                  },
                },
              })
            end,
            llama_cpp = function()
              return require('codecompanion.adapters').extend('openai_compatible', {
                env = {
                  api_key = 'not-needed',
                  url = 'http://10.0.0.39:8082',
                },
                schema = {
                  model = {
                    default = 'unsloth/Qwen3.6-27B-MTP-GGUF:Q3_K_M',
                    choices = {
                      'unsloth/Qwen3.6-27B-MTP-GGUF:Q3_K_M',
                      'unsloth/Nemotron-3-Nano-30B-A3B-Q3_K_S',
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
  {
    dir = '~/dev/ai-scalpel.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('ai-scalpel').setup {
        api = {
          base_url = 'http://10.0.0.39:8082/v1',
          model = 'unsloth/Qwen3.6-27B-MTP-GGUF:Q3_K_M',
        },
        context = {
          auto_discover = true,
          max_discovered = 5,
        },
      }
    end,
  },
}
