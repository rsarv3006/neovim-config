return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker',
        transparent = true,
      }
      require('onedark').load()
      vim.cmd([[colorscheme onedark]])
    end
  },
}
