return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    insert_at_start = false,
    tabpages = true,
    clickable = true,
    gitsigns = {
      added = { enabled = true, icon = "+" },
      changed = { enabled = true, icon = "~" },
      deleted = { enabled = true, icon = "-" },
    },
    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      --    NvimTree = true,
      --    https://github.com/romgrk/barbar.nvim/issues/421
      --    Too lazy to do it myself, figured it works so why not
    },
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
