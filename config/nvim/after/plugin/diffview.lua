-- local ok, diffview = pcall(require, 'diffview')
-- if not ok then
--   return
-- end

local ok_lib, diffviewlib = pcall(require, 'diffview.lib')
if not ok_lib then
  return
end

vim.keymap.set('n', '<leader>gd', function()
  if next(diffviewlib.views) == nil then
    vim.cmd('DiffviewOpen')
  else
    vim.cmd('DiffviewClose')
  end
end)
