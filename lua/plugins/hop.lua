return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {},
  keys = {
    {
      'S',
      function()
        require('hop').hint_words({})
      end,
      remap = true,
      desc = 'Hop to any word'
    }
  }
}
