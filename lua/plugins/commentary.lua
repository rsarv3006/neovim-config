return {
  {
    "tpope/vim-commentary",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Add Swift comment string
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "swift",
        callback = function()
          vim.bo.commentstring = "// %s"
        end,
      })
    end,
  },
}
