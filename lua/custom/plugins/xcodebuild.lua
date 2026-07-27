return {
  {
    'wojciech-kulik/xcodebuild.nvim',
    enabled = vim.fn.has 'mac' == 1,
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-tree.lua',
      'stevearc/oil.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('xcodebuild').setup {}
    end,
  },
}
