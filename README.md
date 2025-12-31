# Neovim Config (native pack)

Personal Neovim setup using Neovim's native package manager (`vim.pack.add`). Plugins are configured in `lua/plugins`, core settings live in `lua/options.lua`, and keymaps are defined in `lua/mappings.lua`.

## Layout
- `init.lua` – loads core options/keymaps, then requires each `lua/plugins/*.lua` module.
- `lua/options.lua` – editor options (`vim.opt`, leader keys, yank highlight, folds, etc.).
- `lua/mappings.lua` – global keymaps (QoL, resizing, quickfix/location lists, diagnostics, LSP helpers).
- `lua/plugins/` – plugin configs split by topic (LSP, Treesitter, git, fzf-lua, UI, etc.). Each file calls `vim.pack.add` with its dependencies, then configures the plugin.
- `after/ftplugin/` – filetype-specific tweaks loaded after plugins (lua, solidity, javascript, typescript, toml).
- `lua/custom/` – optional standalone Lua utilities (example: `encrypt.lua` for transparent GPG editing).
- `neovim_tips/` – personal notes.

## Plugins in use
### LSP, completion, snippets
- [`blink.cmp`](https://github.com/saghen/blink.cmp) – completion engine with a fast UI and sensible defaults.
- [`friendly-snippets`](https://github.com/rafamadriz/friendly-snippets) – curated snippet collection for LSP completion engines.
- [`lazydev.nvim`](https://github.com/folke/lazydev.nvim) – improves Lua LSP for Neovim runtime and plugins.
- [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) – LSP server configs and defaults.

### Syntax, language tooling
- [`crates.nvim`](https://github.com/saecki/crates.nvim) – Cargo.toml helpers and crate version info for Rust.
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) – Treesitter syntax highlighting and parsing.

### Search, navigation, marks
- [`fzf`](https://github.com/junegunn/fzf) – core fuzzy finder binary used by fzf-lua and quickfix filtering.
- [`fzf-lua`](https://github.com/ibhagwan/fzf-lua) – fuzzy finder UI for files, buffers, LSP, and more.
- [`hop.nvim`](https://github.com/smoka7/hop.nvim) – quick cursor jumps via labeled targets.
- [`marks.nvim`](https://github.com/chentoast/marks.nvim) – enhanced mark management and visualization.

### Git
- [`gitportal.nvim`](https://codeberg.org/trevorhauter/gitportal.nvim) – open repo/file/line in the remote Git forge.
- [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim) – git hunk indicators, blame, and staging helpers.
- [`vim-fugitive`](https://github.com/tpope/vim-fugitive) – Git integration commands inside Neovim.

### File explorer, terminal, sessions
- [`auto-session`](https://github.com/rmagatti/auto-session) – automatic session management with per-project persistence.
- [`oil.nvim`](https://github.com/stevearc/oil.nvim) – file explorer that treats buffers as a file system view.
- [`toggleterm.nvim`](https://github.com/akinsho/toggleterm.nvim) – floating/split terminal manager.

### Quickfix and diagnostics UI
- [`nvim-bqf`](https://github.com/kevinhwang91/nvim-bqf) – improved quickfix window with preview and filtering.
- [`quicker.nvim`](https://github.com/stevearc/quicker.nvim) – quickfix/location list enhancements and workflow helpers.
- [`trouble.nvim`](https://github.com/folke/trouble.nvim) – diagnostics and list UI (quickfix, loclist, symbols).

### UI, UX, and utilities
- [`mini.icons`](https://github.com/echasnovski/mini.icons) – icon set for UI components.
- [`mini.nvim`](https://github.com/echasnovski/mini.nvim) – modular utilities (textobjects, operators, UI helpers).
- [`neovim-tips`](https://github.com/saxon1964/neovim-tips) – daily tips UI and personal tip storage.
- [`nui.nvim`](https://github.com/MunifTanjim/nui.nvim) – UI component library used by other plugins.
- [`plenary.nvim`](https://github.com/nvim-lua/plenary.nvim) – Lua utility library required by several plugins.
- [`render-markdown.nvim`](https://github.com/MeanderingProgrammer/render-markdown.nvim) – better markdown rendering in buffers.
- [`which-key.nvim`](https://github.com/folke/which-key.nvim) – keymap discovery and popup hints.

## Adding or adjusting plugins
1. Open an existing module in `lua/plugins` if the change is related (e.g., update Treesitter parsers in `treesitter.lua`), or create a new file for a new concern (e.g., `lua/plugins/colors.lua`).
2. At the top of the module, call `vim.pack.add({ { src = "https://github.com/author/repo" }, ... })` for the plugin and any dependencies.
3. Configure the plugin below with `require("plugin").setup(...)`, keymaps, autocmds, etc.
4. Save and restart Neovim; `vim.pack.add` will fetch/update the plugin automatically.

## Changing options, keymaps, and per-filetype settings
- Global options: edit `lua/options.lua`. Leader keys live at the top; add new `vim.opt` settings here.
- Global keymaps: edit `lua/mappings.lua`. Follow the existing `vim.keymap.set` style and include `desc` for discoverability (works with which-key/fzf keymap pickers).
- Filetype-specific tweaks: add or edit files under `after/ftplugin/<ft>.lua` for settings that should only apply to a given filetype.
- Autocmds or helpers unique to your workflow can live under `lua/custom/` and be required from `init.lua` (currently commented out) or from plugin configs.

## Next steps
- Open `README.md` if you want to tweak wording or add more notes.
- After adding or changing plugins, restart Neovim so `vim.pack.add` can pull any new sources.

NOTE: this has been generated with AI since I'm too lazy to do it.
