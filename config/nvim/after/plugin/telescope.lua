local setup, telescope = pcall(require, 'telescope')
if not setup then
  return
end

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown({
        -- Options go here
      }),
    },
  },
})
telescope.load_extension('undo')
telescope.load_extension('fzf')
telescope.load_extension('ui-select')

vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', { silent = true })
vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { silent = true })
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>', { silent = true })
vim.keymap.set('n', '<leader>?', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { silent = true })
vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>', { silent = true })
