local set = vim.keymap.set

-- QoL
set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "jk as <ESC> key" })
set("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- lua development
set("n", "<space><space>X", "<cmd>source %<CR>", { desc = "Source current file" })
set("n", "<space><space>x", ":.lua<CR>", { desc = "Source current line" })
set("v", "<space><space>x", ":lua<CR>", { desc = "Source current selection" })

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
set('n', '[d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'previous diagnostic message' })
set('n', ']d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'next diagnostic message' })
set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'diagnostics list' })

-- always center search results
set('n', 'n', 'nzz', { silent = true })
set('n', 'N', 'Nzz', { silent = true })
set('n', '*', '*zz', { silent = true })
set('n', '#', '#zz', { silent = true })
set('n', 'g*', 'g*zz', { silent = true })

-- open new file adjacent to current file
set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')

-- <leader>, shows/hides hidden characters
set('n', '<leader>,', ':set invlist<cr>')

-- always center search results
set('n', 'n', 'nzz', { silent = true })
set('n', 'N', 'Nzz', { silent = true })
set('n', '*', '*zz', { silent = true })
set('n', '#', '#zz', { silent = true })
set('n', 'g*', 'g*zz', { silent = true })

-- "very magic" (less escaping needed) regexes by default
set('n', '?', '?\\v')
set('n', '/', '/\\v')
set('c', '%s/', '%sm/')

-- no arrow keys, force yourself to use the home row
set('n', '<up>', '<nop>')
set('n', '<down>', '<nop>')
set('i', '<up>', '<nop>')
set('i', '<down>', '<nop>')
set('i', '<left>', '<nop>')
set('i', '<right>', '<nop>')
