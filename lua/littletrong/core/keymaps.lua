vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hightlights" })

keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Write current buffer" })
keymap.set("n", "<leader>wa", ":wall<CR>", { desc = "Write all change buffer" })
keymap.set("n", "<leader>wq", ":wqall<CR>", { desc = "Write and quite all change buffer" })

keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quite all buffer" })
keymap.set("n", "<leader>Q", ":qall<CR>", { desc = "Quite all buffer" })

keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontall" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<C-o>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<C-i>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tc", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Map Super + e to scroll down one line
vim.api.nvim_set_keymap('n', '<D-e>', '<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<D-y>', '<C-y>', { noremap = true, silent = true })
