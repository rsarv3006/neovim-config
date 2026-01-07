return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
      {
        '<leader>mp',
        function()
          require('conform').format {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
          }
        end,
        mode = { 'n', 'v' },
        desc = 'Format file or range (in visual mode)',
      },
    },
    config = function()
      local conform = require 'conform'

      -- Function to find Swift format configs
      local function Find_conform_config()
        if _G.searchedForConfig then
          return _G.cachedConfig
        end

        local swiftFormatConfigs = vim.fn.systemlist {
          'find',
          vim.fn.getcwd(),
          '-maxdepth',
          '2',
          '-iname',
          '.swiftformat',
          '-not',
          '-path',
          '*/.*/*',
        }
        _G.searchedForConfig = true

        if vim.v.shell_error ~= 0 then
          return nil
        end

        table.sort(swiftFormatConfigs, function(a, b)
          return a ~= '' and #a < #b
        end)

        if swiftFormatConfigs[1] then
          _G.cachedConfig = string.match(swiftFormatConfigs[1], '^%s*(.-)%s*$')
        end

        return _G.cachedConfig
      end

      -- Explicitly check for swiftformat executable
      local has_swiftformat = vim.fn.executable 'swiftformat' == 1

      conform.setup {
        notify_on_error = true,
        format_on_save = function(bufnr)
          local disable_filetypes = { c = true, cpp = true }
          local filetype = vim.bo[bufnr].filetype
          local lsp_format_opt

          if disable_filetypes[filetype] then
            lsp_format_opt = 'never'
          else
            lsp_format_opt = 'fallback'
          end

          return {
            timeout_ms = 1000,
            lsp_format = lsp_format_opt,
          }
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          swift = { 'swiftformat_ext' },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescriptreact = { 'prettier' },
          html = { 'prettier' },
          css = { 'prettier' },
          scss = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
          java = { 'jdtls' }, -- Use JDTLS formatter
        },
        formatters = {
          swiftformat_ext = {
            command = 'swiftformat',
            args = function(ctx)
              -- Get current buffer file path if ctx.filename is nil
              local filepath = ctx.filename
              if not filepath or filepath == '' then
                filepath = vim.api.nvim_buf_get_name(0)
              end

              return {
                '--config',
                Find_conform_config() or '~/.config/nvim/.swiftformat',
                '--stdinpath',
                filepath,
              }
            end,
            range_args = function(ctx)
              -- Get current buffer file path if ctx.filename is nil
              local filepath = ctx.filename
              if not filepath or filepath == '' then
                filepath = vim.api.nvim_buf_get_name(0)
                vim.notify('Using buffer name for range: ' .. filepath, vim.log.levels.INFO)
              end

              return {
                '--config',
                Find_conform_config() or '~/.config/nvim/.swiftformat',
                '--linerange',
                ctx.range.start[1] .. ',' .. ctx.range['end'][1],
                '--stdinpath',
                filepath,
              }
            end,
            stdin = true,
            condition = function(ctx)
              local filetype = vim.bo.filetype

              -- Skip README files and only format .swift files
              local filename = ctx.filename
              if not filename or filename == '' then
                filename = vim.api.nvim_buf_get_name(0)
              end

              -- Determine if this is a Swift file
              local is_swift = filetype == 'swift' or filename:match '%.swift$'

              -- Don't format README files
              local is_readme = filename:match 'README%.md$'

              return is_swift and not is_readme and has_swiftformat
            end,
          },
          prettier = {
            -- Use project-local prettier
            command = function()
              -- Check for local prettier in node_modules
              local local_prettier = vim.fn.findfile('node_modules/.bin/prettier', '.;')
              if local_prettier ~= '' then
                return local_prettier
              end

              -- Fallback to global prettier if available
              if vim.fn.executable 'prettier' == 1 then
                return 'prettier'
              end

              -- Return nil or false if prettier isn't available
              return nil
            end,
            -- Standard prettier args
            args = { '--stdin-filepath', '$FILENAME' },
            stdin = true,
          },
        },
      }

      -- Debug info
      if has_swiftformat then
        vim.notify('SwiftFormat found at: ' .. vim.fn.exepath 'swiftformat', vim.log.levels.INFO)
      end

      -- Add a command to debug Swift formatting
      vim.api.nvim_create_user_command('SwiftFormatDebug', function()
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local filetype = vim.bo[bufnr].filetype

        vim.notify('Current buffer: ' .. bufnr, vim.log.levels.INFO)
        vim.notify('Filename: ' .. filename, vim.log.levels.INFO)
        vim.notify('Filetype: ' .. filetype, vim.log.levels.INFO)
        vim.notify('SwiftFormat executable: ' .. tostring(has_swiftformat), vim.log.levels.INFO)
        vim.notify('SwiftFormat config: ' .. tostring(Find_conform_config()), vim.log.levels.INFO)
      end, {})
    end,
  },
}
