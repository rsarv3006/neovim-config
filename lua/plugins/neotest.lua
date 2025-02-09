return {
  {
    "mfussenegger/nvim-dap",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/fixcursorhold.nvim",
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest",
      "Issafalcon/neotest-dotnet",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
          require("neotest-go"),
          require("neotest-dotnet"),
          require('neotest-jest')({
            jestcommand = "npm test --",
            jestconfigfile = "custom.jest.config.ts",
            env = { ci = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })

      vim.api.nvim_set_keymap("n", "<leader>ntjw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>nto", "<cmd>lua require('neotest').output_panel.toggle()<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>ntp", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>ntf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%:p'))<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>nts", "<cmd>lua require('neotest').summary.open()<cr>", {})
    end,
  }
}
