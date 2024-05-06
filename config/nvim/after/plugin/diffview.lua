local ok_lib, diffviewlib = pcall(require, 'diffview.lib')
if not ok_lib then
  return
end

vim.keymap.set('n', '<leader>ga', function()
  if next(diffviewlib.views) == nil then
    vim.cmd('DiffviewOpen')
  else
    vim.cmd('DiffviewClose')
  end
end, { silent = true, desc = "Vieg the git diff for all files in the workspace" })
