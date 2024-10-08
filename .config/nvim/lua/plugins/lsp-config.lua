return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "html",
          "emmet_language_server",
          "cssls",
          "tailwindcss",
          "jdtls",
          "svelte",
          "ts_ls",
          "black",
          "pyright",
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require "lspconfig"
      lspconfig.lua_ls.setup { capabilities = capabilities }
      lspconfig.html.setup { capabilities = capabilities }
      lspconfig.emmet_language_server.setup { capabilities = capabilities }
      lspconfig.cssls.setup { capabilities = capabilities }
      lspconfig.tailwindcss.setup { capabilities = capabilities }
      lspconfig.jdtls.setup { capabilities = capabilities }
      lspconfig.svelte.setup { capabilities = capabilities }
      lspconfig.ts_ls.setup {capabilities = capabilities }
      lspconfig.pyright.setup {capabilities = capabilities }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
