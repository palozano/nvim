vim.pack.add({
  { src = "https://github.com/nvim-neorg/neorg" },
  { src = "https://github.com/nvim-neorg/lua-utils.nvim" },
  -- { src = "https://github.com/nvim-treesitter/nvim-treesitter-legacy-api" },
})

local neorg = require("neorg")

neorg.setup()
