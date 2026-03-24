vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Options
local o = vim.opt

-- folding
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "0"
o.foldtext = "" -- this syntaxhighlights the line and not just one color
o.foldlevel = 99
o.foldlevelstart = 8
o.foldnestmax = 8
o.conceallevel = 1
-- not enable folding
o.foldenable = false
o.foldmethod = "manual"
--
o.shiftwidth = 4
o.expandtab = true
o.tabstop = 4
o.clipboard = "unnamedplus"
o.number = true
o.relativenumber = true
o.hlsearch = false
o.mouse = "a"
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.updatetime = 250
o.timeout = true
o.timeoutlen = 500
o.completeopt = "menu,menuone,noselect"
o.termguicolors = true
o.cursorline = true
o.scrolloff = 3
-- vim.opt.colorcolumn = '120'
o.cmdheight = 2
o.confirm = true
-- keep current content top+left when splitting
o.splitright = true
o.splitbelow = true
-- Decent wildmenu
o.wildmode = "list:longest"
o.wildignore:append({
	"*.hg", "*.svn", "*.png", "*.jpg", "*.gif",
	"*.min.js", "*.swp", "*.o",
	"**/target/**",
	"**/.git/**",
	"**/node_modules/**",
	"**/vendor/**",
	"**/dist/**",
	"**/_site/**",
})
o.path = { ".", "**" }
-- tabs: go big or go home
o.shiftwidth = 8
o.softtabstop = 8
o.tabstop = 8
o.expandtab = false

-- make statusline transparent
--vim.cmd(":highlight StatusLine guibg=0 guifg=1")

-- suggested by plugin `auto-session`
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "en_us" }
	end,
})

vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

-- Keymaps
local set = vim.keymap.set

-- QoL
set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "jk as <ESC> key" })
set("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- lua development
set("n", "<space><space>X", "<cmd>source %<CR>", { desc = "Source current file" })
set("n", "<space><space>x", ":.lua<CR>", { desc = "Source current line" })
set("v", "<space><space>x", ":lua<CR>", { desc = "ource current selection" })

-- resize windows
set("n", "<M-Up>", ":resize -5<CR>", { desc = "Resize window up" })
set("n", "<M-Down>", ":resize +5<CR>", { desc = "Resize window down" })
set("n", "<M-Left>", ":vertical resize -5<CR>", { desc = "Resize window left" })
set("n", "<M-Right>", ":vertical resize +5<CR>", { desc = "Resize window right" })

-- quickfix list
set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
set("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })
set("n", "<M-j>", ":cnext<CR>", { desc = "Next quickfix item" })
set("n", "<M-k>", ":cprev<CR>", { desc = "Previous quickfix item" })

-- location list
set("n", "<leader>lo", ":lopen<CR>", { desc = "Open location list" })
set("n", "<leader>lc", ":lclose<CR>", { desc = "Close location list" })
set("n", "<M-S-j>", ":cnext<CR>", { desc = "Next location item" })
set("n", "<M-S-k>", ":cprev<CR>", { desc = "Previous location item" })

-- diagnostics
set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "previous diagnostic message" })
set("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "next diagnostic message" })
set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "diagnostics list" })

-- always center search results
set("n", "n", "nzz", { silent = true })
set("n", "N", "Nzz", { silent = true })
set("n", "*", "*zz", { silent = true })
set("n", "#", "#zz", { silent = true })
set("n", "g*", "g*zz", { silent = true })

-- open new file adjacent to current file
-- set("n", "<leader>o", ":e <C-R>=expand(\"%:p:h\") . \"/\" <cr>")
-- set("n", "<leader>o", ":find **/")

-- <leader>, shows/hides hidden characters
set("n", "<leader>,", ":set invlist<cr>")

-- always center search results
set("n", "n", "nzz", { silent = true })
set("n", "N", "Nzz", { silent = true })
set("n", "*", "*zz", { silent = true })
set("n", "#", "#zz", { silent = true })
set("n", "g*", "g*zz", { silent = true })

-- "very magic" (less escaping needed) regexes by default
set("n", "?", "?\\v")
set("n", "/", "/\\v")
set("c", "%s/", "%sm/")

-- no arrow keys, force yourself to use the home row
set("n", "<up>", "<nop>")
set("n", "<down>", "<nop>")
set("n", "<right>", ":bn<CR>")
set("n", "<left>", ":bp<CR>")
set("i", "<up>", "<nop>")
set("i", "<down>", "<nop>")
set("i", "<left>", "<nop>")
set("i", "<right>", "<nop>")

-- quick open from command line
-- set("n", "<leader>o", ":find **/", { silent = false, desc = "Find file (:find via fd)" })

-- open the current line in the browser (uses the git alias `url` that I defined)
set("n", "<leader>ob",
	function()
		local base = vim.fn.trim(vim.fn.system(
			"git remote get-url origin | sed -E 's!^ssh://git@([^/]+)/!https://\\1/!; s!\\.git$!!'"
		))
		local branch = vim.fn.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD"))
		local root = vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel"))
		local file = vim.fn.expand("%:p")
		local rel = file:sub(#root + 2)
		local line = vim.fn.line(".")
		local url = string.format("%s/blob/%s/%s#L%d", base, branch, rel, line)
		vim.fn.jobstart({ "open", url }, { detach = true })
	end,
	{ desc = "Open line in browser" }
)


-- Loading helper
local function safe(label, fn)
	local ok, err = pcall(fn)
	if not ok then
		vim.schedule(function()
			vim.notify(("Failed loading %s: %s"):format(label, err), vim.log.levels.ERROR)
		end)
	end
end

-- Plugins
safe("autosession", function()
	vim.pack.add({
		{ src = "https://github.com/rmagatti/auto-session" },
	})

	local autosession = require("auto-session")

	autosession.setup({
		git_use_branch_name = true,
		session_lens = {
			previewer = "summary",
		},
		show_auto_restore_notif = true,
		suppressed_dirs = { "~/", "~/Downloads", "/" },
	})
end)

safe("blink", function()
	vim.pack.add({
		{
			src = "https://github.com/saghen/blink.cmp",
			version = vim.version.range("^1"),
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
					end,
				},
			},
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
		},
		cmdline = {
			enabled = true,
			keymap = {
				preset        = "none",
				["<C-Space>"] = { "show", "fallback" },
				["<C-n>"]     = { "select_next", "fallback" },
				["<C-p>"]     = { "select_prev", "fallback" },
				["<CR>"]      = { "select_and_accept", "fallback" },
				["<Esc>"]     = { "cancel", "fallback" },
			}
		}
	})
end)

safe("crates", function()
	vim.pack.add({
		{ src = "https://github.com/saecki/crates.nvim" },
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
	})

	require("crates").setup({})
end)

safe("fzf", function()
	vim.pack.add({
		{ src = "https://github.com/ibhagwan/fzf-lua" },
	})

	local fzf = require("fzf-lua")

	fzf.setup({
		winopts = {
			split = "belowright new",
		},
		actions = {
			files = {
				true,
				["ctrl-q"] = { fn = fzf.actions.file_sel_to_qf, prefix = "select-all" },
			},
		},
	})

	local map = vim.keymap.set

	-- files/buffers
	map("n", "<leader>,", function() fzf.buffers({}) end, { desc = "Pick buffers" })
	map("n", "<leader>f/", function() fzf.search_history({}) end, { desc = "Pick history" })
	map("n", "<leader>f:", function() fzf.command_history({}) end, { desc = "Pick command history" })
	map("n", "<leader>fM", function() fzf.manpages({}) end, { desc = "Pick man" })
	map("n", "<leader>fR", function() fzf.registers({}) end, { desc = "Pick registers" })
	map("n", "<leader>fc", function() fzf.commands({}) end, { desc = "Pick commands" })
	map("n", "<leader>ff", function() fzf.files({}) end, { desc = "Pick files" })
	map("n", "<leader>fg", function() fzf.live_grep({}) end, { desc = "Grep" })
	map("n", "<leader>fw", function() fzf.grep_cword({}) end, { desc = "Grep word" })
	map("n", "<leader>fh", function() fzf.helptags({}) end, { desc = "Pick help" })
	map("n", "<leader>fk", function() fzf.keymaps({}) end, { desc = "Pick keymaps" })
	map("n", "<leader>fl", function() fzf.resume({}) end, { desc = "Pick last" })
	map("n", "<leader>fm", function() fzf.marks({}) end, { desc = "Pick marks" })
	map("n", "<leader>fu", function() fzf.undotree({}) end, { desc = "Pick undo" })

	-- git
	map("n", "<leader>gb", function() fzf.git_branches({}) end, { desc = "Git branches" })
	map("n", "<leader>gd", function() fzf.git_diff({}) end, { desc = "Git diff" })
	map("n", "<leader>gc", function() fzf.git_commits({}) end, { desc = "Git commits" })
	map("n", "<leader>gs", function() fzf.git_status({}) end, { desc = "Git status" })
	map("n", "<leader>gS", function() fzf.git_stash({}) end, { desc = "Git stash" })
	map("n", "<leader>gB", function() fzf.git_blame({}) end, { desc = "Git blame" })

	-- lsp
	map("n", "<leader>fr", function() fzf.lsp_references({}) end, { desc = "LSP references" })
	map("n", "<leader>fs", function() fzf.lsp_document_symbols({}) end, { desc = "LSP symbols" })
	map("n", "<leader>ft", function() fzf.lsp_definitions({}) end, { desc = "LSP definitions" })

	-- diagnostics
	map("n", "<leader>fd", function() fzf.diagnostics_document({}) end, { desc = "Pick buffer diagnostics" })
	map("n", "<leader>fD", function() fzf.diagnostics_workspace({}) end, { desc = "Pick all diagnostics" })
end)

safe("git", function()
	vim.pack.add({
		{ src = "https://github.com/tpope/vim-fugitive" },
		{ src = "https://codeberg.org/trevorhauter/gitportal.nvim" },
	})

	-- vim-fugitive loads without extra setup
end)

safe("hop", function()
	vim.pack.add({
		{ src = "https://github.com/smoka7/hop.nvim" },
	})

	local hop = require("hop")

	hop.setup({})

	vim.keymap.set("n", "S", function()
		hop.hint_words({})
	end, { remap = true, desc = "Hop to any word" })
end)

safe("lsp", function()
	vim.pack.add({
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/folke/lazydev.nvim" },
	})

	local lazydev = require("lazydev")
	local blink = require("blink.cmp")
	local lsp = vim.lsp
	local map = vim.keymap.set

	lazydev.setup({
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	})

	local servers = {
		lua_ls = {},
		rust_analyzer = {
			diagnostics = {
				enable = true,
			},
		},
		pylsp = {},
		-- ruff = { settings = {} },
		ts_ls = {
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		},
	}

	-- 1) Apply blink capabilities globally (applies to every enabled server)
	lsp.config("*", {
		capabilities = blink.get_lsp_capabilities(),
	})

	-- 2) Register/override per-server configs
	for server, cfg in pairs(servers) do
		lsp.config(server, cfg)
	end

	-- 3) Enable servers (auto-starts on matching filetypes)
	lsp.enable(vim.tbl_keys(servers))

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			if client:supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = args.buf,
					callback = function()
						lsp.buf.format({ bufnr = args.buf, id = client.id })
					end,
				})
			end
		end,
	})

	if lsp.inlay_hint then
		map("n", "<leader>ih", function()
			lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
		end, { desc = "Inlay hints" })
	end

	map("n", "<leader>F", lsp.buf.format, { desc = "Format the current file" })
	map("n", "<leader>rn", lsp.buf.rename, { desc = "Rename symmbol" })
	map("n", "<leader>ca", lsp.buf.code_action, { desc = "Code action" })
	map("v", "<leader>ca", lsp.buf.code_action, { desc = "Code action" })
	map("n", "gI", lsp.buf.implementation, { desc = "Go to implementation" })
	map("i", "<C-s>", lsp.buf.signature_help, { desc = "Trigger signature help" })
	map("n", "gd", lsp.buf.definition, { desc = "Go to definition" })
	map("n", "gD", lsp.buf.declaration, { desc = "Go to declaration" })
	map("n", "gT", lsp.buf.type_definition, { desc = "Go to type" })
	map("n", "gW", lsp.buf.workspace_symbol, { desc = "Go to workspace symbols" })
	map("n", "g0", lsp.buf.document_symbol, { desc = "Go to document symbol" })
end)

safe("marks", function()
	vim.pack.add({
		{ src = "https://github.com/chentoast/marks.nvim" },
	})

	require("marks").setup({})
end)

safe("mini", function()
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
	-- git improvements
	require("mini.diff").setup()

	vim.keymap.set("n", "<leader>to", function()
		require("mini.diff").toggle_overlay(0)
	end, { desc = "Toggle diff overlay" })
end)

-- safe("notes", function()
--   vim.pack.add({
--     { src = "https://github.com/nvim-neorg/neorg" },
--     { src = "https://github.com/nvim-neorg/lua-utils.nvim" },
--     -- { src = "https://github.com/nvim-treesitter/nvim-treesitter-legacy-api" },
--   })
--
--   local neorg = require("neorg")
--
--   neorg.setup()
-- end)

safe("oil", function()
	vim.pack.add({
		{ src = "https://github.com/stevearc/oil.nvim" },
		{ src = "https://github.com/echasnovski/mini.icons" },
	})

	local oil = require("oil")

	oil.setup({
		default_file_explorer = true,
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		win_options = {
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		prompt_save_on_select_new_entry = true,
		cleanup_delay_ms = 2000,
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 1000,
			autosave_changes = "unmodified",
		},
		constrain_cursor = "editable",
		watch_for_changes = true,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true } },
			["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = { "actions.preview", opts = { horizontal = true, split = "botright" } },
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		use_default_keymaps = true,
		view_options = {
			show_hidden = false,
			is_hidden_file = function(name, _)
				local m = name:match("^%.")
				return m ~= nil
			end,
			is_always_hidden = function(_, _)
				return false
			end,
			natural_order = "fast",
			case_insensitive = false,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
			highlight_filename = function(_, _, _, _)
				return nil
			end,
		},
		extra_scp_args = {},
		git = {
			add = function(_)
				return false
			end,
			mv = function(_, _)
				return false
			end,
			rm = function(_)
				return false
			end,
		},
		float = {
			padding = 2,
			max_width = 0,
			max_height = 0,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			get_win_title = nil,
			preview_split = "auto",
			override = function(conf)
				return conf
			end,
		},
		preview_win = {
			update_on_cursor_moved = true,
			preview_method = "fast_scratch",
			disable_preview = function(_)
				return false
			end,
			win_options = {},
		},
		confirmation = {
			max_width = 0.9,
			min_width = { 40, 0.4 },
			width = nil,
			max_height = 0.9,
			min_height = { 5, 0.1 },
			height = nil,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},
		progress = {
			max_width = 0.9,
			min_width = { 40, 0.4 },
			width = nil,
			max_height = { 10, 0.9 },
			min_height = { 5, 0.1 },
			height = nil,
			border = "rounded",
			minimized_border = "none",
			win_options = {
				winblend = 0,
			},
		},
		ssh = {
			border = "rounded",
		},
		keymaps_help = {
			border = "rounded",
		},
	})

	vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
end)

safe("quickfix", function()
	vim.pack.add({
		{ src = "https://github.com/folke/trouble.nvim" },
		{ src = "https://github.com/kevinhwang91/nvim-bqf" },
		{ src = "https://github.com/junegunn/fzf" },
		{ src = "https://github.com/stevearc/quicker.nvim" },
	})

	local trouble = require("trouble")
	local map = vim.keymap.set

	trouble.setup({
		modes = {
			test = {
				mode = "diagnostics",
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.3,
				},
			},
		},
	})

	map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
	map("n", "<leader>tD", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
	map("n", "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		{ desc = "Buffer Diagnostics (Trouble)" })
	map("n", "<leader>tl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
	map("n", "<leader>tL", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		{ desc = "LSP Definitions / references / ... (Trouble)" })
	map("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

	require("bqf").setup({
		auto_enable = true,
		magic_window = true,
		auto_resize_height = false,
		previous_winid_ft_skip = false,
		preview = {
			auto_preview = false,
			win_height = 12,
			win_vheight = 12,
			delay_syntax = 80,
			border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
		},
		func_map = {
			vsplit = "",
			ptogglemode = "z,",
			stoggleup = "",
		},
		filter = {
			fzf = {
				action_for = {
					["ctrl-s"] = "split",
					["ctrl-v"] = "vsplit",
				},
				extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
			},
		},
	})

	require("quicker").setup({})
end)

safe("terminal", function()
	vim.pack.add({
		{ src = "https://github.com/akinsho/toggleterm.nvim" },
	})

	local map = vim.keymap.set

	require("toggleterm").setup({})

	map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
	map("n", "<leader>tb", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle terminal (bottom)" })
	map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal (float)" })
end)

safe("tips", function()
	vim.pack.add({
		{ src = "https://github.com/saxon1964/neovim-tips" },
		{ src = "https://github.com/MunifTanjim/nui.nvim" },
		{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	})

	local tips = require("neovim_tips")
	local map = vim.keymap.set

	tips.setup({
		user_file = vim.fn.stdpath("config") .. "/neovim_tips/user_tips.md",
		user_tip_prefix = "[User] ",
		warn_on_conflicts = true,
		daily_tip = 1,
		bookmark_symbol = "🌟 ",
	})

	map("n", "<leader>nto", ":NeovimTips<CR>", { desc = "Neovim tips", noremap = true, silent = true })
	map("n", "<leader>nte", ":NeovimTipsEdit<CR>", { desc = "Edit your Neovim tips", noremap = true, silent = true })
	map("n", "<leader>nta", ":NeovimTipsAdd<CR>", { desc = "Add your Neovim tip", noremap = true, silent = true })
	map("n", "<leader>nth", ":help neovim-tips<CR>", { desc = "Neovim tips help", noremap = true, silent = true })
	map("n", "<leader>ntr", ":NeovimTipsRandom<CR>", { desc = "Show random tip", noremap = true, silent = true })
	map("n", "<leader>ntp", ":NeovimTipsPdf<CR>", { desc = "Open Neovim tips PDF", noremap = true, silent = true })
end)

safe("treesitter", function()
	vim.pack.add({
		{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	})

	require("nvim-treesitter.config").setup({
		ensure_installed = {
			"lua", "vim", "vimdoc",
			"markdown", "markdown_inline",
			"query", "sql",
			"dockerfile",
			"c", "rust",
			"erlang", "elixir", "heex",
			"typescript",
			"html", "css",
			"proto",
			"jinja", "j2"
		},
		install_dir = '',
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
end)

safe("which-key", function()
	vim.pack.add({
		{ src = "https://github.com/folke/which-key.nvim" },
	})

	local wk = require("which-key")

	wk.setup({})

	vim.keymap.set("n", "<leader>?", function() wk.show({ global = false }) end,
		{ desc = "Buffer Local Keymaps (which-key)" })
end)

safe("gpg", function()
	-- Transparent editing of GPG-encrypted files in Neovim
	-- Based on the classic Vimscript by Wouter Hanegraaff
	-- Drop this file into: ~/.config/nvim/plugin/gpg.lua   (or require from lua/)
	-- Requires: gpg in PATH (GnuPG)

	-- Safety: bail early if gpg isn't available
	if vim.fn.executable("gpg") ~= 1 then
		vim.schedule(function()
			vim.notify("[gpg.lua] 'gpg' not found in PATH; encrypted editing disabled.", vim.log.levels.WARN)
		end)
		return
	end

	local group = vim.api.nvim_create_augroup("EncryptedGPG", { clear = true })

	-- Helpers to run the same filter-commands the Vimscript used
	local function decrypt_current_buffer()
		-- Filter whole buffer through `gpg --decrypt`
		vim.cmd([[silent keepjumps keepmarks '[,']!gpg --decrypt 2> /dev/null]])
	end

	local function encrypt_current_buffer_self()
		-- Filter whole buffer through `gpg --default-recipient-self -ae`
		vim.cmd([[silent keepjumps keepmarks '[,']!gpg --default-recipient-self -ae 2> /dev/null]])
	end

	-- Before reading *.gpg: lock down settings that could leak plaintext
	vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
		group = group,
		pattern = "*.gpg",
		callback = function(args)
			-- Buffer-local protections
			vim.bo[args.buf].swapfile = false -- no swap (plaintext could leak)
			vim.bo[args.buf].undofile = false -- no persistent undo
			-- vim.bo[args.buf].backup      = false -- no backups
			-- vim.bo[args.buf].writebackup = false -- no write backups
			vim.bo[args.buf].bin = true -- read as binary, like original script

			-- Global (session) protection: avoid writing shada (viminfo successor)
			-- NOTE: This is global, like the original `set viminfo=`. We save & restore.
			if vim.g._gpg_saved_shada == nil then
				vim.g._gpg_saved_shada = vim.o.shada
				vim.o.shada = "" -- don't record/register anything to shada file while editing
			end
		end,
	})

	-- After reading: decrypt and switch back from binary
	vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
		group = group,
		pattern = "*.gpg",
		callback = function(args)
			-- Decrypt file contents into the buffer
			decrypt_current_buffer()

			-- Return to normal (text) mode
			vim.bo[args.buf].bin = false

			-- Some plugins expect BufReadPost on the "base name" (like the Vimscript did).
			-- This mirrors: :doautocmd BufReadPost %:r
			local base = vim.fn.expand("%:r")
			if base and base ~= "" then
				pcall(vim.cmd.doautocmd, "BufReadPost " .. base)
			end
		end,
	})

	-- Before write: encrypt buffer so that what gets written is ciphertext
	vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
		group = group,
		pattern = "*.gpg",
		callback = function()
			encrypt_current_buffer_self()
		end,
	})

	-- After write: immediately undo the encryption change in the buffer
	vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
		group = group,
		pattern = "*.gpg",
		callback = function()
			-- Undo the last change (which was the encryption filter), restoring plaintext
			-- Use :silent and :noautocmd to avoid side effects
			vim.cmd([[silent noautocmd undo]])

			-- If this was the last *.gpg buffer, restore shada
			-- (We restore when no other listed buffers match *.gpg)
			local any_gpg = false
			for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
					local name = vim.api.nvim_buf_get_name(bufnr)
					if name:match("%.gpg$") then
						any_gpg = true
						break
					end
				end
			end
			if not any_gpg and vim.g._gpg_saved_shada ~= nil then
				vim.o.shada = vim.g._gpg_saved_shada
				vim.g._gpg_saved_shada = nil
			end
		end,
	})

	-- Also restore shada when leaving Neovim in case a *.gpg buffer stays open
	vim.api.nvim_create_autocmd("VimLeavePre", {
		group = group,
		callback = function()
			if vim.g._gpg_saved_shada ~= nil then
				vim.o.shada = vim.g._gpg_saved_shada
				vim.g._gpg_saved_shada = nil
			end
		end,
	})
end)

-- claude code
safe("claudecode", function()
	vim.pack.add({
		{ src = "https://github.com/coder/claudecode.nvim" },
	})

	local claude = require("claudecode")
	claude.setup({})

	local map = vim.keymap.set

	-- map("n", "<leader>a", nil, { desc = "AI/Claude Code" })
	map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
	map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
	map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
	map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
	map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
	map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
	map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
	-- map("n",
	--   "<leader>as",
	--   "<cmd>ClaudeCodeTreeAdd<cr>",
	--   { desc = "Add file" }
	--   ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
	-- })
	-- Diff management
	map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
	map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
end)

-- Filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "lua" },
	callback = function()
		vim.opt_local.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "solidity" },
	callback = function()
		vim.opt_local.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "toml" },
	callback = function(args)
		local ok, crates = pcall(require, "crates")
		if not ok then
			return
		end

		local buf = args.buf
		local map = vim.keymap.set

		map("n", "<leader>ct", crates.toggle, { silent = true, desc = "Toggle crates", buffer = buf })
		map("n", "<leader>cr", crates.reload, { silent = true, desc = "Reload crates", buffer = buf })

		map("n", "<leader>cv", crates.show_versions_popup,
			{ silent = true, desc = "Show versions popup", buffer = buf })
		map("n", "<leader>cf", crates.show_features_popup,
			{ silent = true, desc = "Show features popup", buffer = buf })
		map("n", "<leader>cd", crates.show_dependencies_popup,
			{ silent = true, desc = "Show dependencies popup", buffer = buf })

		map("n", "<leader>cu", crates.update_crate, { silent = true, desc = "Update crate", buffer = buf })
		map("v", "<leader>cu", crates.update_crates, { silent = true, desc = "Update crates", buffer = buf })
		map("n", "<leader>cUa", crates.update_all_crates,
			{ silent = true, desc = "Update all crates", buffer = buf })
		map("n", "<leader>cU", crates.upgrade_crate, { silent = true, desc = "Upgrade crate", buffer = buf })
		map("v", "<leader>cU", crates.upgrade_crates, { silent = true, desc = "Upgrade crates", buffer = buf })
		map("n", "<leader>cA", crates.upgrade_all_crates,
			{ silent = true, desc = "Upgrade all crates", buffer = buf })
		map("n", "<leader>ce", crates.expand_plain_crate_to_inline_table,
			{ silent = true, desc = "Expand plain crate to inline table", buffer = buf })
		map("n", "<leader>cE", crates.extract_crate_into_table,
			{ silent = true, desc = "Extract crate into table", buffer = buf })

		map("n", "<leader>cH", crates.open_homepage, { silent = true, desc = "Open homepage", buffer = buf })
		map("n", "<leader>cR", crates.open_repository, { silent = true, desc = "Open repository", buffer = buf })
		map("n", "<leader>cD", crates.open_documentation,
			{ silent = true, desc = "Open documentation", buffer = buf })
		map("n", "<leader>cC", crates.open_crates_io, { silent = true, desc = "Open crates.io", buffer = buf })
	end,
})
