local ok, saga = pcall(require, 'lspsaga')
if not ok then
  return
end

saga.setup({
  ui = {
    title = false,
    border = 'rounded',
  },
  diagnostic = {
    on_insert = false,
    on_insert_follow = false,
    border_follow = false,
  },
  lightbulb = {
    enable = false,
  },
  beacon = {
    enable = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
  outline = {
    win_position = 'right',
    win_width = 30,
    auto_preview = false,
    layout = 'normal',
    detail = false,
  },
})

vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', { silent = true })
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>', { silent = true })
vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga finder<cr>', { silent = true })
vim.keymap.set('n', '<leader>p', '<cmd>Lspsaga peek_definition<cr>', { silent = true })

-- I'm not really sure where to put this. But it's useful to have a button to run 'format' on the current buffer
vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, { silent = true })

-- The default virtual text for errors is in settings.lua, it's a default vim feature
-- enable if you disable showing virtual text, then go to trouble.lua and change the document
-- workspace diagnostic bindings
-- vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<cr>', { silent = true })
