return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      -- ✅ SIZE: Height of the terminal (in lines)
      size = 10,

      -- ✅ DIRECTION: "horizontal", "vertical", or "float"
      direction = "horizontal",

      -- ✅ OPEN/CLOSE: Ctrl + t toggles the terminal
      open_mapping = [[<C-t>]],

      -- Optional: Remove shading or borders if you want a cleaner look
      shade_terminals = true,
    }

    -- ✅ NAVIGATION & KEYBINDS
    -- This function defines keymaps only for terminal buffers
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }

      -- 1. 'Esc' to go to Normal Mode (scrolling mode) inside terminal
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

      -- 2. Navigate between windows (Terminal <-> Code)
      -- Use Ctrl + h/j/k/l exactly like you do in code
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- Go Left
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- Go Down (to code)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- Go Up (to code)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- Go Right
    end

    -- Automatically apply these keys when a terminal opens
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
