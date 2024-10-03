return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
    'mfussenegger/nvim-dap'   -- debugging
  },
  config = function()
    require("flutter-tools").setup {
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        }
      },
      dev_tools = {
        autostart = true,         -- autostart devtools server if not detected
        auto_open_browser = true, -- Automatically opens devtools in the browser
      },
    }
  end
}
