return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      -- 1. Setup Project.nvim
      require("project_nvim").setup {
        manual_mode = false,
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        silent_chdir = true,
      }

      -- 2. Setup Telescope Global Config
      require("telescope").setup {
        defaults = {
          -- Ensure we don't see the .git folder itself even when hidden is on
          file_ignore_patterns = { ".git/" },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }

      -- 3. Load Extensions
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("projects")

      -- 4. Keymaps
      local builtin = require("telescope.builtin")

      -- <C-p> will now find files in .config because 'hidden = true' is set above
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files (Root)" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Recent Files" })

      -- Switch Project Picker
      vim.keymap.set("n", "<leader>pp", function()
        require("telescope").extensions.projects.projects {}
      end, { desc = "Switch Project" })
    end,
  },
}
