vim.pack.add({
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/kevinhwang91/nvim-bqf" },
  { src = "https://github.com/junegunn/fzf" },
  { src = "https://github.com/stevearc/quicker.nvim" },
})

local trouble = require("trouble")
local map = vim.keymap.set

trouble.setup({
  modes = {
    test = {
      mode = "diagnostics",
      preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.3,
      },
    },
  },
})

map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>tD", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>tl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tL", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

require("bqf").setup({
  auto_enable = true,
  magic_window = true,
  auto_resize_height = false,
  previous_winid_ft_skip = false,
  preview = {
    auto_preview = false,
    win_height = 12,
    win_vheight = 12,
    delay_syntax = 80,
    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
  },
  func_map = {
    vsplit = "",
    ptogglemode = "z,",
    stoggleup = "",
  },
  filter = {
    fzf = {
      action_for = {
        ["ctrl-s"] = "split",
        ["ctrl-v"] = "vsplit",
      },
      extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
    },
  },
})

require("quicker").setup({})
