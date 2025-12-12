return {
  {
    {
      'akinsho/toggleterm.nvim',
      version = "*",
      opts = {},
      keys = {
        {
          "<leader>tt",
          "<cmd>ToggleTerm<cr>",
          desc = "Toggle terminal",
        },
        {
          "<leader>tb",
          "<cmd>ToggleTerm direction=horizontal<cr>",
          desc = "Toggle terminal (bottom)",
        },
        {
          "<leader>tf",
          "<cmd>ToggleTerm direction=float<cr>",
          desc = "Toggle terminal (float)",
        },
      }
    }
  }
}
