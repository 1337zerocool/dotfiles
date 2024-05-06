-- keybindings for plugins are setup in the after/plugin folder for each
-- plugin. that way key binds are only set if a plugin loads. Search for
-- `keymap.set` to find them all

local opts = { silent = true }
vim.g.mapleader = ' '

-- XX quit wihout saving, ZZ save current buffer and close window
vim.keymap.set('n', 'XX', '<cmd>qall!<cr>', opts)
vim.keymap.set('n', 'ZZ', '<cmd>x<cr>', opts)

-- nicer spell suggestions
vim.keymap.set('n', 'z=', function() require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({})) end, opts)

-- restore 'gx' open in browser behaviour from netrw
vim.keymap.set('n', 'gx', [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- managing windows
vim.keymap.set('n', '<leader>\\', '<cmd>vsplit<cr>', opts)
vim.keymap.set('n', '<leader>-', '<cmd>split<cr>', opts)
vim.keymap.set('n', '<leader><bs>', '<cmd>close<cr>', opts)
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<cr>', opts)
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<cr>', opts)
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<cr>', opts)
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<cr>', opts)

-- managing buffers
vim.keymap.set('n', '<leader>]', '<cmd>bnext<cr>', opts)
vim.keymap.set('n', '<leader>[', '<cmd>bprev<cr>', opts)
vim.keymap.set('n', '<leader><s-bs>', '<cmd>bdelete<cr>', opts)

-- in command, expand `%%` to path of current buffer
vim.keymap.set('c', '%%', '<C-R>=expand("%:h")."/"<cr>')
