-- Mapping keys that don"t have anything to do with plugins
vim.g.mapleader = " "                       -- Use "space" as leader key
vim.keymap.set({ "n", "v"}, "XX", "<cmd>qall!<cr>", { silent = true, desc = "Save the file and quit" })
vim.keymap.set({ "n", "v"}, "ZZ", "<cmd>x<cr>", { silent = true, desc = "Quit without saving" })
vim.keymap.set({ "n", "v"}, '<leader>\\', '<cmd>vsplit<cr>', { silent = true, desc = "Split the window vertically" })
vim.keymap.set({ "n", "v"}, '<leader>-', '<cmd>split<cr>', { silent = true, desc = "Split the window horizontally" })
vim.keymap.set({ "n", "v"}, '<leader><bs>', '<cmd>close<cr>', { silent = true, desc = "Close the current window" })
vim.keymap.set({ "n", "v"}, '<c-h>', '<cmd>wincmd h<cr>', { silent = true, desc = "Select to the window on the left" })
vim.keymap.set({ "n", "v"}, '<c-j>', '<cmd>wincmd j<cr>', { silent = true, desc = "Select to the window below" })
vim.keymap.set({ "n", "v"}, '<c-k>', '<cmd>wincmd k<cr>', { silent = true, desc = "Select to the window above" })
vim.keymap.set({ "n", "v"}, '<c-l>', '<cmd>wincmd l<cr>', { silent = true, desc = "Select to the window on the right" })
vim.keymap.set({ "n", "v"}, '<leader>]', '<cmd>bnext<cr>', { silent = true, desc = "Switch to the next buffer in the current window" })
vim.keymap.set({ "n", "v"}, '<leader>[', '<cmd>bprev<cr>', { silent = true, desc = "Switch to the previous buffer in the current window" })
vim.keymap.set({ "n", "v"}, '<leader><s-bs>', '<cmd>bdelete<cr>', { silent = true, desc = "Delete the current buffer" })
