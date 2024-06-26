local ok, telescope = pcall(require, "telescope")
if not ok then
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
  },
})
--
-- these need some protection to ensure they exist
telescope.load_extension("ast_grep")
telescope.load_extension("undo")
telescope.load_extension("fzf")
telescope.load_extension('dap')



vim.keymap.set({ "n", "v" }, "<leader><leader>", "<cmd>Telescope find_files<cr>", { silent = true, desc = "Fuzzy find and open files by name" })
vim.keymap.set({ "n", "v" }, "<leader>/", "<cmd>Telescope live_grep<cr>", { silent = true, desc = "Fuzzy find and open files by searching their content" })
vim.keymap.set({ "n", "v" }, "<leader>b", "<cmd>Telescope buffers<cr>", { silent = true, desc = "Switch between buffers" })
vim.keymap.set({ "n", "v" }, "<leader>?", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { silent = true, desc = "Fuzzy search the current buffer" })
vim.keymap.set({ "n", "v" }, "<leader>gu", "<cmd>Telescope undo<cr>", { silent = true, desc = "Browse and restore undo history" })
vim.keymap.set({ "n", "v" }, "<leader>k", "<cmd>Telescope keymaps<cr>", { silent = true, desc = "Browse and search keyboard bindings (keymaps)" })
vim.keymap.set({ "n", "v" }, "<leader>'", "<cmd>Telescope ast_grep<cr>", { silent = true, desc = "Search for AST nodes in the current buffer" })
vim.keymap.set({ "n", "v" }, "<leader>gf", "<cmd>Telescope git_bcommits<cr>", { silent = true, desc="Browse the git commit history of the current file" })
vim.keymap.set({ "n", "v" }, "<leader>gl", "<cmd>Telescope git_commits<cr>", { silent = true, desc="Browse the git commit history of the current workspace" })
vim.keymap.set({ "n", "v" }, "<leader>dl", "<cmd>Telescope dap list_breakpoints<cr>", { silent = true, desc = "Search breakpoints setup in the debugger" })
vim.keymap.set({ "n", "v" }, "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", { silent = true, desc = "Search for symbols in the current document" })
vim.keymap.set({ "n", "v" }, "<leader>S", "<cmd>Telescope lsp_workspace_symbols<cr>", { silent = true, desc = "Search for symbols in any file in the current workspace" })
vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Telescope diagnostics<cr>", { silent = true, desc="Search for diagnostics in any file in the current workspace" })
-- find a way to make this a binding to CR in command mode
vim.keymap.set({ "n", "v" }, "<leader>:", "<cmd>Telescope command_history<cr>", { silent = true, desc="Search for commands in the command history"})
