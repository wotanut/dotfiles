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
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason.setup()

      mason_lspconfig.setup {
        ensure_installed = {
          "lua_ls",
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "ts_ls",
          "pyright",
        },
        -- AUTOMATIC SETUP: This handles the setup for every installed server
        handlers = {
          function(server_name)
            lspconfig[server_name].setup {
              capabilities = capabilities,
            }
          end,
          -- Explicit override for Lua to add "vim" global
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            }
          end,
        },
      }
      -- These are global mappings that trigger LSP functions
      local map = vim.keymap.set

      map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
      map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    end,
  },
}
