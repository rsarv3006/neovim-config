return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}

-- return {
--   "mfussenegger/nvim-lint",
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     local lint = require("lint")
--
--     -- Function to setup swiftlint
--     local function find_config()
--       local cachedConfig = nil
--       local searchedForConfig = false
--
--       if searchedForConfig then
--         return cachedConfig
--       end
--
--       -- Find .swiftlint.yml config file in the working directory
--       local swiftlintConfigs = vim.fn.systemlist({
--         "find",
--         vim.fn.getcwd(),
--         "-maxdepth",
--         "2",
--         "-iname",
--         ".swiftlint.yml",
--         "-not",
--         "-path",
--         "/./",
--       })
--       searchedForConfig = true
--       if vim.v.shell_error ~= 0 then
--         return nil
--       end
--       table.sort(swiftlintConfigs, function(a, b)
--         return a ~= "" and #a < #b
--       end)
--       if swiftlintConfigs[1] then
--         cachedConfig = string.match(swiftlintConfigs[1], "^%s*(.-)%s*$")
--       end
--       return cachedConfig
--     end
--
--     local function setup_swiftlint()
--       local pattern = "[^:]+:(%d+):(%d+): (%w+): (.+)"
--       local groups = { "lnum", "col", "severity", "message" }
--       local defaults = { ["source"] = "swiftlint" }
--       local severity_map = {
--         ["error"] = vim.diagnostic.severity.ERROR,
--         ["warning"] = vim.diagnostic.severity.WARN,
--       }
--       lint.linters.swiftlint = {
--         cmd = "swiftlint",
--         stdin = false,
--         args = {
--           "lint",
--           "--force-exclude",
--           "--use-alternative-excluding",
--           "--config",
--           function()
--             return find_config() or os.getenv("HOME") .. "/.config/nvim/.swiftlint.yml"
--           end,
--         },
--         stream = "stdout",
--         ignore_exitcode = true,
--         parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
--       }
--     end
--
--     -- Setup swiftlint
--     setup_swiftlint()
--
--     -- Associate linters with filetypes
--     lint.linters_by_ft = {
--       swift = { "swiftlint" },
--     }
--
--     -- Autocmd for linting on save and read
--     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--     vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
--       group = lint_augroup,
--       callback = function()
--         require("lint").try_lint()
--       end,
--     })
--
--     -- Keymap for manual linting
--     vim.keymap.set("n", "<leader>ml", function()
--       require("lint").try_lint()
--     end, { desc = "Lint file" })
--   end,
-- }
