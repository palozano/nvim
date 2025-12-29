vim.pack.add({
  { src = "https://github.com/rmagatti/auto-session" },
})

local autosession = require("auto-session")

autosession.setup({
  git_use_branch_name = true,
  session_lens = {
    previewer = "summary"
  },
  show_auto_restore_notif = true,
  suppressed_dirs = { "~/", "~/Downloads", "/" }
})
