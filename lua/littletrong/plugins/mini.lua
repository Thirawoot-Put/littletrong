return {
  "echasnovski/mini.files",
  config = function()
    require('mini.files').setup()

    local keymap = vim.keymap
    keymap.set("n", "<leader>em", function()
      require("mini.files").open(vim.api.nvim_buf_get_name(0)) -- Open in the current file's directory
    end, { desc = "Toggle Mini Files" })
  end
}
