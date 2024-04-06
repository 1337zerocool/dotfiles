local setup, telescope = pcall(require, "telescope")
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
    ast_grep = {},
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ["telescope-alternate"] = {
      mappings = {
        -- Ruby command line app
        { pattern = "lib/(.*).rb", targets = {
          { template =  "test/[1]_test.rb", label = "Test", enable_new = true },
          { template =  "sig/[1].rbs", label = "Sig", enable_new = true },
        } },

        { pattern = "test/(.*)_test.rb", targets = {
          { template =  "lib/[1].rb", label = "Code", enable_new = true },
          { template =  "sig/[1].rbs", label = "Sig", enable_new = true },
        } },

        { pattern = "sig/(.*).rbs", targets = {
          { template =  "test/[1]_test.rb", label = "Test", enable_new = true },
          { template =  "lib/[1].rb", label = "Code", enable_new = true },
        } },

      },
      open_only_one_with = "current_pane",
      -- presets = { "rails" },
    },
  },
})

telescope.load_extension("ast_grep")
telescope.load_extension("undo")
telescope.load_extension("fzf")
telescope.load_extension("telescope-alternate")
telescope.load_extension('dap')

vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>?", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { silent = true })
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { silent = true })
vim.keymap.set("n", "<leader>k", "<cmd>Telescope keymaps<cr>", { silent = true })
vim.keymap.set("n", "<leader>m", "<cmd>Telescope telescope-alternate alternate_file<cr>", { silent = true })
vim.keymap.set("n", "<leader>'", "<cmd>Telescope ast_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>gd", "<cmd>Telescope git_bcommits<cr>", { silent = true })
vim.keymap.set("n", "<leader>:", "<cmd>Telescope command_history<cr>", { silent = true })
vim.keymap.set("n", "<leader>dl", "<cmd>Telescope dap list_breakpoints<cr>", { silent = true })
