# Neovim Config (lazy.nvim)

This is a personal Neovim setup managed with `lazy.nvim`. Plugins live in `lua/plugins`, core settings in `lua/options.lua`, and keymaps in `lua/mappings.lua`.

## Layout
- `init.lua` – bootstraps `lazy.nvim` and imports everything under `lua/plugins`; then loads `lua/options.lua` and `lua/mappings.lua`.
- `lazy-lock.json` – version lockfile maintained by `lazy.nvim`; keep it committed, but do not hand-edit.
- `lua/options.lua` – editor options (`vim.opt`, leader keys, yank highlight, folds, etc.).
- `lua/mappings.lua` – global keymaps (QoL, resizing, quickfix/location lists, diagnostics, LSP helpers).
- `lua/plugins/` – plugin specs split by topic (LSP, Treesitter, git, fzf-lua, UI, etc.). Each file returns one or more specs for `lazy.nvim`.
- `lua/configs/` – helper modules consumed by plugin specs (e.g., `configs.fzf-lua`).
- `after/ftplugin/` – filetype-specific tweaks loaded after plugins (lua, solidity, javascript, typescript, toml).
- `lua/custom/` – optional standalone Lua utilities (example: `encrypt.lua` for transparent GPG editing).
- `neovim_tips/` – personal notes.

## Adding or adjusting plugins
1. Open an existing spec in `lua/plugins` if the change is related (e.g., update Treesitter parsers in `treesitter.lua`), or create a new file for a new concern (e.g., `lua/plugins/colors.lua`).
2. Each spec file should `return` a table of plugin definitions. The simplest form is `{ "author/repo" }`. Add `opts = { ... }`, `config = function() ... end`, `keys = { ... }`, etc., as needed (mirroring the current files).
3. If configuration grows large, put it in `lua/configs/<name>.lua` and `require` it from the plugin spec (see `lua/plugins/fzf.lua` + `lua/configs/fzf-lua.lua`).
4. Save the file and run `:Lazy sync` (or `:Lazy load <name>` for on-demand) inside Neovim to install/update.
5. `lazy-lock.json` will update when versions change; commit it alongside plugin changes.

## Changing options, keymaps, and per-filetype settings
- Global options: edit `lua/options.lua`. Leader keys live at the top; add new `vim.opt` settings here.
- Global keymaps: edit `lua/mappings.lua`. Follow the existing `vim.keymap.set` style and include `desc` for discoverability (works with which-key/fzf keymap pickers).
- Filetype-specific tweaks: add or edit files under `after/ftplugin/<ft>.lua` for settings that should only apply to a given filetype.
- Autocmds or helpers unique to your workflow can live under `lua/custom/` and be required from `init.lua` (currently commented out) or from plugin configs.

## Next steps
- Open `README.md` if you want to tweak wording or add more notes.
- After adding or changing plugins, run `:Lazy sync` inside Neovim to install/update and refresh `lazy-lock.json`.
