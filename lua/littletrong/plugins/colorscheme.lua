return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load immediately
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      on_colors = function(color)
        color.hint = color.orange
        color.error = "#ff0000"
      end
    })

    vim.cmd("colorscheme tokyonight") -- Apply the colorscheme
  end,
}
