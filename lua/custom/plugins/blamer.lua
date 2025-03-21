return {
  {
    'APZelos/blamer.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.g.blamer_enabled = false
    end,
  },
}
