vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

local blink = require("blink.cmp")

blink.setup({
  keymap = {
    preset = "default",
  },
  fuzzy = {
    -- Avoid native binary requirement; use Lua implementation
    implementation = "lua",
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  signature = {
    enabled = true,
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 250,
    },
  },
})
