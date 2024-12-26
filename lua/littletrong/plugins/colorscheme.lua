-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require('catppuccin').setup({
-- integrations = { blink_cmp = true },
--     })
--     vim.cmd.colorscheme "catppuccin"
--   end
-- }
return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load immediately
  config = function()
    require("tokyonight").setup({
      style = "night"
    })

    vim.cmd("colorscheme tokyonight") -- Apply the colorscheme
  end,
}
