return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    preset = "classic", -- "classic" is the safest layout (bottom of screen)

    -- Force the window to stay within bounds
    win = {
      border = "single", -- Adds a border to make it easier to see
      padding = { 2, 2 }, -- Extra padding [top, bottom]
    },

    layout = {
      height = { min = 4, max = 25 }, -- Limit max height so it doesn't cut off
      width = { min = 20, max = 50 },
      spacing = 3, -- Spacing between columns
      align = "left",
    },

    -- Ensure it ignores the 'Space' keypress itself so it doesn't show "<Space>" as a key
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
  },
}
