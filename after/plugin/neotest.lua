require("neotest").setup({
  adapters = {
    require("neotest-jest"),
    require("neotest-python"),
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" }
    })
  }
})

vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
  {})
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>lua require('neotest').output_panel.toggle()<cr>", {})
