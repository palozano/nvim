return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = {
    { 'rafamadriz/friendly-snippets' },
    -- { "saghen/blink.compat",         lazy = true, version = false }
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono'
    },
    signature = {
      enabled = true
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
      }
    },
  },
  opts_extend = { "sources.default" }
}
