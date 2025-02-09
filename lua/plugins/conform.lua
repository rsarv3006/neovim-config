return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      local function Find_conform_config()
        if _G.searchedForConfig then
          return _G.cachedConfig
        end

        local swiftFormatConfigs = vim.fn.systemlist({
          "find",
          vim.fn.getcwd(),
          "-maxdepth",
          "2",
          "-iname",
          ".swiftformat",
          "-not",
          "-path",
          "*/.*/*",
        })
        _G.searchedForConfig = true

        if vim.v.shell_error ~= 0 then
          return nil
        end

        table.sort(swiftFormatConfigs, function(a, b)
          return a ~= "" and #a < #b
        end)

        if swiftFormatConfigs[1] then
          _G.cachedConfig = string.match(swiftFormatConfigs[1], "^%s*(.-)%s*$")
        end

        return _G.cachedConfig
      end

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
                Find_conform_config() or "~/.config/nvim/.swiftformat",
                "--stdinpath",
                "$FILENAME",
              }
            end,
            range_args = function(ctx)
              return {
                "--config",
                Find_conform_config() or "~/.config/nvim/.swiftformat",
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
  },
}
