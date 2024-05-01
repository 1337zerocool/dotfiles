-- keybindings for plugins are setup in the after/plugin folder for each
-- plugin. that way key binds are only set if a plugin loads. Search for
-- `keymap.set` to find them all

vim.g.mapleader = ' '

-- XX quit wihout saving, ZZ save current buffer and close window
vim.keymap.set('n', 'XX', '<cmd>qall!<cr>', { silent = true, desc = "Save the file and quit" })
vim.keymap.set('n', 'ZZ', '<cmd>x<cr>', { silent = true, desc = "Quit without saving" })

-- nicer spell suggestions
vim.keymap.set('n', 'z=', function() require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({})) end, { silent = true, desc = "Toggle spellcheck" })

-- restore 'gx' open in browser behaviour from netrw
vim.keymap.set('n', 'gx', [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], { silent = true, desc = "Open the link under the curosr in the browser" })

-- managing windows
vim.keymap.set('n', '<leader>\\', '<cmd>vsplit<cr>', { silent = true, desc = "Split the window vertically" })
vim.keymap.set('n', '<leader>-', '<cmd>split<cr>', { silent = true, desc = "Split the window horizontally" })
vim.keymap.set('n', '<leader><bs>', '<cmd>close<cr>', { silent = true, desc = "Close the current window" })
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<cr>', { silent = true, desc = "Move to the window on the left" })
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<cr>', { silent = true, desc = "Move to the window below" })
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<cr>', { silent = true, desc = "Move to the window above" })
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<cr>', { silent = true, desc = "Move to the window on the right" })

-- managing buffers
vim.keymap.set('n', '<leader>]', '<cmd>bnext<cr>', { silent = true, desc = "Switch to the next buffer in the current window" })
vim.keymap.set('n', '<leader>[', '<cmd>bprev<cr>', { silent = true, desc = "Switch to the previous buffer in the current window" })
vim.keymap.set('n', '<leader><s-bs>', '<cmd>bdelete<cr>', { silent = true, desc = "Delete the current buffer" })
