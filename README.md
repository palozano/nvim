# Neovim Config (native pack)

This is a personal Neovim setup using Neovim’s native package manager (`vim.pack.add`). Plugins live in `lua/plugins`, core settings in `lua/options.lua`, and keymaps in `lua/mappings.lua`.

## Layout
- `init.lua` – loads core options/keymaps, then requires each `lua/plugins/*.lua` module.
- `lua/options.lua` – editor options (`vim.opt`, leader keys, yank highlight, folds, etc.).
- `lua/mappings.lua` – global keymaps (QoL, resizing, quickfix/location lists, diagnostics, LSP helpers).
- `lua/plugins/` – plugin configs split by topic (LSP, Treesitter, git, fzf-lua, UI, etc.). Each file calls `vim.pack.add` with its dependencies, then configures the plugin.
- `after/ftplugin/` – filetype-specific tweaks loaded after plugins (lua, solidity, javascript, typescript, toml).
- `lua/custom/` – optional standalone Lua utilities (example: `encrypt.lua` for transparent GPG editing).
- `neovim_tips/` – personal notes.

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
