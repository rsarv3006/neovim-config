return {
  "tpope/vim-fugitive",
  lazy = false,
  cmd = { "G", "Git" },
  keys = {
    {
      "<leader>gs",
      vim.cmd.Git,
      desc = "Fugitive Git",
    },
  },
}
