function ColorMyPencils(color)
  require("tokyonight").setup({
    style = "night",
    light_style = "day",
    transparent = true,
  })

  color = color or "tokyonight"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
