vim.pack.add({
  { src = "https://github.com/echasnovski/mini.nvim" },
})

-- improve editing experience
require("mini.ai").setup()
require("mini.align").setup()
require("mini.pairs").setup()
require("mini.operators").setup()
require("mini.surround").setup()
-- improve UI
require("mini.cursorword").setup()
require("mini.icons").setup()
