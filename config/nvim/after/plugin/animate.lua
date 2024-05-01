local ok, animate = pcall(require, "mini.animate")
if not ok then
  return
end

animate.setup({
  cursor = {
    enable = true,
  },
  scroll = {
    enable = true,
  },
  resize = {
    enable = true,
  },
  open = {
    enable = true,
  },
  close = {
    enable = true,
  },
})
