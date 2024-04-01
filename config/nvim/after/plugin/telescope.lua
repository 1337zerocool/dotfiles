local setup, telescope = pcall(require, 'telescope')
if not setup then
  return
end

telescope.setup({
  defaults = {
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    layout_config = {
      vertical = {
        mirror = true,
        prompt_position = "top",
      }
    }
  },
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
vim.keymap.set('n', '<leader>k', '<cmd>Telescope keymaps<cr>', { silent = true })
vim.keymap.set('n', '<leader>gh', '<cmd>Telescope git_bcommits<cr>', { silent = true })

-- Setup command line history
-- setup grep history
-- setup git_bcommits
