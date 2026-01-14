return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", { desc = "Toggle file explorer" })
    require("neo-tree").setup {
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.relativenumber = true
            vim.opt_local.number = true
          end,
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- Automatically focus the active file in the tree
          leave_dirs_open = true, -- Keep folders expanded even if you move away
        },
        use_libuv_file_watcher = true, -- Automatically update tree if files change outside Neovim
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
          never_show = {},
        },
      },
    }
  end,
}
