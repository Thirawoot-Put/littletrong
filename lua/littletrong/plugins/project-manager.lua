return {
  {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("project_nvim").setup {
        patterns = {
          ".git",
          "_darcs",
          ".hg",
          ".bzr",
          ".svn",
          "Makefile",
          "package.json",
          "go.mod",
          "Cargo.toml"
        },

        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = false,
        -- What scope to change the directory, valid options are
        -- * global (default)
        -- * tab
        -- * win
        --
        scope_chdir = 'tab',
      }

      require("telescope").load_extension("projects")

      -- Keymap to open project list
      vim.keymap.set("n", "<leader>p", ":Telescope projects<CR>", { noremap = true, silent = true })
    end
  },
}
