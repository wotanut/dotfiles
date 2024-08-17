return {
  "andweeb/presence.nvim",
  config = function()
    --    host = vim.cmd("!hostname")
    host = vim.fn.hostname()

    require("presence").setup {
      neovim_image_text = "On " .. host,
      main_image = "file",
      enable_line_number = true,
      --      buttons = { label = "Website", url = "https://sambot.dev" }
    }
  end,
}
