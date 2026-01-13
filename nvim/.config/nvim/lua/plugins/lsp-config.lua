return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason.setup()

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "ts_ls",
          "pyright",
        },
      })

      local servers = {
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "ts_ls",
        "pyright",
      }

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
        }

        if server == "lua_ls" then
          opts.settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          }
        end

        -- ✅ New Neovim 0.11+ API
        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end

      -- LSP keymaps
      local map = vim.keymap.set
      map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
      map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    end,
  },
}
