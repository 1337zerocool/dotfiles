local ok, neotest = pcall(require, 'neotest')
if not ok then
  return
end

local ok_minitest, neotest_minitest = pcall(require, 'neotest-minitest')
if not ok_minitest then
  return
end

neotest.setup({
  overseer = {
    enabled = true,
    force_default = true,
  },
  consumers = {
    overseer = require("neotest.consumers.overseer"),
  },
  adapters = {
    require("neotest-minitest")
  },
})

vim.keymap.set("n", "<leader>T", "<cmd>lua require('neotest').summary.toggle()<cr>", { silent = true})
vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').overseer.run({})<cr>", { silent = true})

-- lua require('neotest').overseer.run({})

-- lua require("neotest").watch.toggle(vim.fn.expand("%"))
-- lua require("neotest").output.open({ enter = true })
-- lua require("neotest").output_panel.toggle()
-- lua require("neotest").output_panel.clear()
-- lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})
-- lua require("neotest").run.run({vim.fn.expand("%"))
-- lua require("neotest").run.run_last()
-- lua require("neotest").run.run_last({ strategy = "dap" })
-- lua require("neotest").watch.toggle(vim.fn.expand("%"))
-- lua require("neotest").summary.open()
-- `run_marked`({args})
-- `clear_marked`({args})
--
--  nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
--  nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>

