return {
  {
    {
      'akinsho/toggleterm.nvim',
      version = "*",
      opts = {},
      keys = {
        {
          "<leader>tt",
          "<cmd>ToggleTerm direction=horizontal<cr>",
          desc = "Terminal (bottom)",
        },
        {
          "<leader>tf",
          "<cmd>ToggleTerm direction=float<cr>",
          desc = "Terminal (float)",
        },
      }
    }
  }
}
