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
          { template =  "test/test_[1].rb", label = "Test", enable_new = true },
          { template =  "sig/[1].rbs", label = "Sig", enable_new = true },
        } },

        { pattern = "test/test_(.*).rb", targets = {
          { template =  "lib/[1].rb", label = "Code", enable_new = true },
          { template =  "sig/[1].rbs", label = "Sig", enable_new = true },
        } },

        { pattern = "sig/(.*).rbs", targets = {
          { template =  "test/test_[1].rb", label = "Test", enable_new = true },
          { template =  "lib/[1].rb", label = "Code", enable_new = true },
        } },

      },
      open_only_one_with = "current_pane",
      -- presets = { "rails" },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- Options go here
      }),
    },
  },
})
telescope.load_extension("undo")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("telescope-alternate")

vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>?", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { silent = true })
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { silent = true })
vim.keymap.set("n", "<leader>k", "<cmd>Telescope keymaps<cr>", { silent = true })
vim.keymap.set("n", "<leader>a", "<cmd>Telescope telescope-alternate alternate_file<cr>", { silent = true })
vim.keymap.set("n", "<leader>gd", "<cmd>Telescope git_bcommits<cr>", { silent = true })

-- Setup command line history
-- setup grep history
