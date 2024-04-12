local ok, notify = pcall(require, "notify")
if not ok then
  return
end

  -- https://github.com/rcarriga/nvim-notify/blob/master/doc/nvim-notify.txt
notify.setup({
  render = "compact",
  stages = "static",
  timeout = 2000,
  level = 2,
})
