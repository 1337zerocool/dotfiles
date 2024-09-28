-- Live updating LSP diagnostics
-- https://github.com/onsails/diaglist.nvim
local diaglist = {
  "onsails/diaglist.nvim",
}

-- Offers a nice front end to LSP features
-- https://github.com/nvimdev/lspsaga.nvim
local lspsaga = {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        title = false,
        border = "rounded",
      },
      diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        border_follow = false,
      },
      lightbulb = {
        enable = false,
      },
      beacon = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      outline = {
        win_position = "right",
        win_width = 30,
        auto_preview = false,
        layout = "normal",
        detail = false,
      }
    })
    -- can't use lazy to do keymaps for some reason
    vim.keymap.set({ "n", "v" }, "gd", "<cmd>Lspsaga goto_definition<cr>", { silent = true, desc = "Go to definition" })
    vim.keymap.set({ "n", "v" }, "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, desc = "Show documentation" })
    vim.keymap.set({ "n", "v" }, "<leader>o", "<cmd>Lspsaga outline<cr>", { silent = true, desc = "Show outline of the code" })
    vim.keymap.set({ "n", "v" }, "<leader>r", "<cmd>Lspsaga finder<cr>", { silent = true, desc = "Show references" })
    vim.keymap.set({ "n", "v" }, "<leader>p", "<cmd>Lspsaga peek_definition<cr>", { silent = true, desc = "Peek definition" })
    vim.keymap.set({ "n", "v" }, "<leader>=", vim.lsp.buf.format, { silent = true, desc = "Format the current buffer" })
    vim.keymap.set({ "n", "v" }, "]e", vim.diagnostic.goto_next, { silent = true, desc = "Go to next diagnostic" })
    vim.keymap.set({ "n", "v" }, "[e", vim.diagnostic.goto_prev, { silent = true, desc = "Go to previous diagnostic" })
  end,
}

-- LSP configurations to get started with
-- https://github.com/neovim/nvim-lspconfig
local lspconfig = {
  "neovim/nvim-lspconfig",
}


-- connects LSP config to mason
-- https://github.com/williamboman/mason-lspconfig.nvim
local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
}

-- Provides for LSP to be a completion source for CMP
-- https://github.com/hrsh7th/cmp-nvim-lsp
local cmp_lsp = {
  "hrsh7th/cmp-nvim-lsp",
}

-- manages LSPs, Linters, formatters, etc.
-- https://github.com/williamboman/mason.nvim
local mason = {
  "williamboman/mason.nvim",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local lspcfg = require("mason-lspconfig")
    local cmp = require("cmp_nvim_lsp")

    local servers = {
      html = {},
      denols = {},
      cssls = {},
      emmet_ls = {},
      jsonls = {},
      gopls = {},
      ruby_lsp = {},
      solargraph = {},
      lua_ls = {
        Lua = {
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
          diagnostics = { globals = { "vim" }, },
        },
      },
    }

    mason.setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp.default_capabilities(capabilities)

    local on_attach = function(_, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    lspcfg.setup({ ensure_installed = vim.tbl_keys(servers) })
    lspcfg.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    })
  end
}

return { cmp_lsp, diaglist, lspsaga, mason, mason_lspconfig, lspconfig }
