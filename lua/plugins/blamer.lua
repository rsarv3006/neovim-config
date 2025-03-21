return {
  {
    "APZelos/blamer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.blamer_enabled = false
      vim.keymap.set("n", "<leader>bt", ":BlamerToggle<CR>", { noremap = true, silent = true, desc = "Toggle Git Blame" })
    end,
  },
}
