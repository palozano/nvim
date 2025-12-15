vim.pack.add({
  { src = "https://github.com/smoka7/hop.nvim" },
})

local hop = require("hop")

hop.setup({})

vim.keymap.set("n", "S", function()
  hop.hint_words({})
end, { remap = true, desc = "Hop to any word" })
