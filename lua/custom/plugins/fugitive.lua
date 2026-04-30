return {
  'tpope/vim-fugitive',
  lazy = false,
  cmd = { 'G', 'Git' },
  keys = {
    {
      '<leader>gs',
      function()
        vim.cmd 'vertical Git'
      end,
      desc = 'Fugitive Git (vertical)',
    },
  },
  config = function()
    vim.g.fugitive_split_command = 'vsplit'
  end,
}
