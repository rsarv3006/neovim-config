require("neotest").setup({
  -- your neotest config here
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

vim.api.nvim_set_keymap("n", "<leader>ntjw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
  {})
vim.api.nvim_set_keymap("n", "<leader>nto", "<cmd>lua require('neotest').output_panel.toggle()<cr>", {})

vim.api.nvim_set_keymap("n", "<leader>ntp", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ntf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%:p'))<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ntf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {})

-- neotest.summary
vim.api.nvim_set_keymap("n", "<leader>nts", "<cmd>lua require('neotest').summary.open()<cr>", {})
