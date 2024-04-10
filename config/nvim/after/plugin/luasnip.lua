local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  return
end

luasnip.config.set_config({
  region_check_events = 'InsertEnter,CursorHold',
  delete_check_events = 'InsertLeave,TextChanged',
})

-- keybinds for completion and stepping through options are set in cmp.lua
