vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")

fzf.setup({
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
