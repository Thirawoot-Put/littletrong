return {
  {
    {
      'akinsho/toggleterm.nvim',
      version = "*",
      opts = { --[[ things you want to change go here]] },
      config = function()
        require("toggleterm").setup({
          size = function(term)
            if term.direction == "horizontal" then
              return 20
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.4
            end
          end,
        })
        vim.keymap.set("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>",
          { noremap = true, silent = true, desc = "Toggle Float Terminal" })
        vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>",
          { noremap = true, silent = true, desc = "Toggle Horizontal Terminal" })
        vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>",
          { noremap = true, silent = true, desc = "Toggle Vertical Terminal" })
        vim.keymap.set("n", "<leader>tt", "<Cmd>ToggleTerm direction=tab<CR>",
          { noremap = true, silent = true, desc = "Toggle Tab Terminal" })

        function _G.set_terminal_keymaps()
          local opts = { buffer = 0 }
          vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
          vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
      end
    },
  }
}
