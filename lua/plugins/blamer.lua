return {
  {
    "APZelos/blamer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.blamer_enabled = false
      vim.keymap.set("n", "<leader>bt", ":BlamerToggle<CR>", { noremap = true, silent = true, desc = "Toggle Git Blame" })
      -- Optional common configurations:
      -- vim.g.blamer_delay = 500  -- default is 1000ms
      -- vim.g.blamer_show_in_visual_modes = true  -- default is true
      -- vim.g.blamer_show_in_insert_modes = false  -- default is true
      -- vim.g.blamer_prefix = ' > '  -- default is ' '
      -- vim.g.blamer_template = '<committer>, <committer-time> • <summary>' -- default template
    end,
  },
}
