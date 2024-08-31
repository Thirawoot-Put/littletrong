return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          path_display = {"smart"},
          mappings = {
            i = {
              ["<c-k>"] = actions.move_selection_previous,
              ["<c-j>"] = actions.move_selection_next,
              ["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
            }
          }
        }
      })

      telescope.load_extension('fzf')

      local keymap = vim.keymap

      keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {desc = "Fuzzy find files"})
      keymap.set('n', '<leader>fr', "<cmd>Telescope oldfiles<cr>", {desc = "Fuzzy find recent files"})
      keymap.set('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", {desc = "Find string"})
      keymap.set('n', '<leader>fc', "<cmd>Telescope grep_string<cr>", {desc = "Find string under cursor"})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
