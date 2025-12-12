return {
	'rmagatti/auto-session',
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { '~/', '~/Downloads', '/' },
		use_git_branch = true,
		show_auto_restore_notif = true,
		session_lens = {
			previewer = true,
		},
	}
}
