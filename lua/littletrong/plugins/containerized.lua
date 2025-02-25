return {
  {
    "ekalinin/Dockerfile.vim",
    ft = { "dockerfile", "Dockerfile" },
    config = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*Dockerfile*", "*.dockerfile" },
        command = "setfiletype dockerfile",
      })
    end
  },
  {
    "andrewstuart/vim-kubernetes",
    config = function()
    end
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("yaml-companion").setup({
        schemas = {
          kubernetes = "https://json.schemastore.org/kubernetes.json",
        },
      })
    end,
  }
}
