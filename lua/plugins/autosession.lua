vim.pack.add({
  { src = "https://github.com/rmagatti/auto-session" },
})

local autosession = require("auto-session")

autosession.setup({
  suppressed_dirs = { "~/", "~/Downloads", "/" },
  use_git_branch = true,
  show_auto_restore_notif = true,
  session_lens = {
    previewer = 'summary',
  },
})
