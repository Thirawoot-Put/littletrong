-- return {
--   "rest-nvim/rest.nvim",
-- }
return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
  config = function()
    vim.keymap.set('n', "<leader>rr", "<cmd>Rest run<CR>", { desc = "Run HTTP request" })
    vim.keymap.set('n', "<leader>ro", "<cmd>Rest open<CR>", { desc = "Open pane" })
    vim.keymap.set('n', "<leader>rl", "<cmd>Rest last<CR>", { desc = "Run HTTP last request" })
  end
}
