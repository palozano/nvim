local o = vim.opt

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--
o.shiftwidth = 4
o.expandtab = true
o.tabstop = 4
o.clipboard = "unnamedplus"
o.number = true
o.relativenumber = true
o.hlsearch = false
o.mouse = 'a'
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = 'yes'
o.updatetime = 250
o.timeout = true
o.timeoutlen = 500
o.completeopt = 'menu,menuone,noselect'
o.termguicolors = true
o.cursorline = true
o.scrolloff = 3
-- vim.opt.colorcolumn = '120'
o.cmdheight = 2
o.confirm = true
-- folding
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "0"
o.foldtext = "" -- this syntaxhighlights the line and not just one color
o.foldlevel = 99
o.foldlevelstart = 8
o.foldnestmax = 8

o.conceallevel = 1

-- make statusline transparent
--vim.cmd(":highlight StatusLine guibg=0 guifg=1")

-- suggested by plugin `auto-session`
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"


-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
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
