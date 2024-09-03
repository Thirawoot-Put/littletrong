vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hightlights" })


keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")

keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontall' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })
