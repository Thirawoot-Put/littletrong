return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup()
    end
  },
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    event = "VeryLazy", -- Load lazily
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup({})

      vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { silent = true, desc = "Open DiffView" })
      vim.keymap.set("n", "<leader>dx", ":DiffviewClose<CR>", { silent = true, desc = "Close DiffView" })
      vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", { silent = true, desc = "File History" })
    end
  },
}
