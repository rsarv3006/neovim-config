vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
    {})
