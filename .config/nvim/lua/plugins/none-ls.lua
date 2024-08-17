return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require "null-ls"
    null_ls.setup {
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,

        -- js
        null_ls.builtins.formatting.prettier,
        require "none-ls.diagnostics.eslint_d",

        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    }
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
