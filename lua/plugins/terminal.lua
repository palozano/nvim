vim.pack.add({
  { src = "https://github.com/akinsho/toggleterm.nvim" },
})

local map = vim.keymap.set

require("toggleterm").setup({})

map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
map("n", "<leader>tb", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle terminal (bottom)" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal (float)" })
