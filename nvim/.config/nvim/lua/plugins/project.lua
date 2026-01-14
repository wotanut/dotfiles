return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    }
    -- Integrate with Telescope
    require("telescope").load_extension("projects")
  end,
}
