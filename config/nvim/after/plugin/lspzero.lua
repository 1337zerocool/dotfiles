local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
  return
end
lsp.preset('recommended')

lsp.nvim_workspace({
  library = vim.api.nvim_get_runtime_file('', true)
})


lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false, silent = true }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
  vim.keymap.set('n', '<leader>a', function() vim.api.nvim_command('write'); vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({})) end, opts)
  vim.keymap.set('n', '<leader>s', '<cmd>Telescope lsp_document_symbols<cr>', opts)
  vim.keymap.set('n', '<leader>S', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', opts)
  vim.keymap.set('n', '<leader>p', '<cmd>Lspsaga peek_definition<cr>', opts)
  vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>', opts)
  vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga lsp_finder<cr>', opts)
  vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
  vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
  vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
end)
vim.keymap.set('n', '<leader>`', '<cmd>Lspsaga term_toggle<cr>', { silent = true})

lsp.configure('arduino_language_server', {
  on_attach = lsp.on_attach,
  cmd = {
    vim.env.HOME .. '/.local/share/nvim/mason/bin/arduino-language-server',
    '-cli-config',
    vim.env.HOME ..'/.config/arduino/cli-config.yaml',
    '-fqbn',
    'arduino:avr:mega:cpu=atmega2560'
  }
})


lsp.setup()
