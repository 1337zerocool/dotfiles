local ok, biscuits = pcall(require, 'nvim-biscuits')
if not ok then
  return
end

biscuits.setup({
  toggle_keybind = "<leader>cb",
  show_on_start = false,
  -- javascript = {
  --   prefix_string = " ✨ ",
  --   max_length = 80
  -- },
  cursor_line_only = true,
  default_config = {
    max_length = 20,
    min_distance = 5,
    prefix_string = " ⬅ "
  },
})

vim.api.nvim_set_hl(0, "BiscuitColor", { fg="#D08770" })
-- vim.api.nvim_set_hl(0, "BiscuitColorRuby", { fg="#D08770" })
-- vim.keymap.set("n", "<leader>cb", "<cmd>lua require('nvim-biscuits').toggle_biscuits()<cr>", { silent = true})
