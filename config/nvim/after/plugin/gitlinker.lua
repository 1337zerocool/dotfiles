local ok, gitlinker = pcall(require, 'gitlinker')
if not ok then
  return
end
gitlinker.setup({
  mappings = nil
})

vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>lua require("gitlinker").get_buf_range_url("n", { action_callback = require("gitlinker.actions").copy_to_clipboard})<cr>', { silent = true })
vim.api.nvim_set_keymap('v', '<leader>gl', '<cmd>lua require("gitlinker").get_buf_range_url("n", { action_callback = require("gitlinker.actions").copy_to_clipboard})<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gL', '<cmd>lua require("gitlinker").get_buf_range_url("n", { action_callback = require("gitlinker.actions").open_in_browser})<cr>', { silent = true })
vim.api.nvim_set_keymap('v', '<leader>gL', '<cmd>lua require("gitlinker").get_buf_range_url("n", { action_callback = require("gitlinker.actions").open_in_browser})<cr>', { silent = true })
