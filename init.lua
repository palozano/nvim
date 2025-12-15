vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core settings/keymaps
require("options")
require("mappings")

-- Safe require helper
local function setup(mod)
  local ok, err = pcall(require, mod)
  if not ok then
    vim.schedule(function()
      vim.notify(("Failed loading %s: %s"):format(mod, err), vim.log.levels.ERROR)
    end)
  end
end

-- Load plugin configs (plain modules)
local modules = {
  "autosession",
  "blink",
  "crates",
  "fzf",
  "git",
  "hop",
  "lsp",
  "marks",
  "mini",
  "oil",
  "quickfix",
  "terminal",
  "tips",
  "treesitter",
  "which-key",
}

for _, mod in ipairs(modules) do
  setup("plugins." .. mod)
end
