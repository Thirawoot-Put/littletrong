return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })

    vim.o.foldmethod = "expr"                     -- Use expression-based folding
    vim.o.foldexpr = "nvim_treesitter#foldexpr()" -- Treesitter fold expression
    vim.o.foldenable = true                       -- Enable folding by default
    vim.o.foldlevel = 99                          -- Start with all folds open
  end
}
