vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1")
  },
  -- dependencies for blink
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/moyiz/blink-emoji.nvim" },
})

local blink = require("blink.cmp")

blink.setup({
  keymap = {
    preset = "default",
  },
  fuzzy = {
    implementation = "prefer_rust",
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  signature = {
    enabled = true,
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "emoji" },
    providers = {
      emoji = {
        module = "blink-emoji",
        name = "Emoji",
        score_offset = 15, -- tune by preference
        opts = { insert = true },
        should_show_items = function()
          return vim.tbl_contains(
          -- Enable emoji completion only for git commits and markdown.
          -- By default, enabled for all file-types.
            { "gitcommit", "markdown" },
            vim.o.filetype
          )
        end
      }
    }
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
    },
  },
})
