vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter.config").setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "markdown",
    "markdown_inline",
    "query",
    "sql",
    "dockerfile",
    "c",
    "rust",
    "erlang",
    "elixir",
    "heex",
    "typescript",
    "html",
    "css",
    "proto",
  },
  ignore_install = {},
  modules = {},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
