return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostics disable: missing-fields
  opts = {
    actions = {
      files = {
        -- true,
        ["ctrl-q"] = { fn = function() FzfLua.actions.file_sel_to_qf() end, prefix = "select-all" }
      }
    }
  },
  ---@diagnostics enable: missing-fields
  keys = {
    --/files,buffers
    { "<leader>,",  function() FzfLua.buffers({}) end,               desc = "Pick buffers" },
    { "<leader>f/", function() FzfLua.search_history({}) end,        desc = "Pick history" },
    { "<leader>f:", function() FzfLua.command_history({}) end,       desc = "Pick command history" },
    { "<leader>fM", function() FzfLua.manpages({}) end,              desc = "Pick man" },
    { "<leader>fR", function() FzfLua.registers({}) end,             desc = "Pick registers" },
    { "<leader>fc", function() FzfLua.commands({}) end,              desc = "Pick commands" },
    { "<leader>ff", function() FzfLua.files({}) end,                 desc = "Pick files" },
    { "<leader>fg", function() FzfLua.live_grep({}) end,             desc = "Grep" },
    { "<leader>fw", function() FzfLua.grep_cword({}) end,            desc = "Grep word" },
    { "<leader>fh", function() FzfLua.helptags({}) end,              desc = "Pick help" },
    { "<leader>fk", function() FzfLua.keymaps({}) end,               desc = "Pick keymaps" },
    { "<leader>fl", function() FzfLua.resume({}) end,                desc = "Pick last" },
    { "<leader>fm", function() FzfLua.marks({}) end,                 desc = "Pick marks" },
    { "<leader>fu", function() FzfLua.undotree({}) end,              desc = "Pick undo" },

    --/git
    { "<leader>gb", function() FzfLua.git_branches({}) end,          desc = "Git branches" },
    { "<leader>gd", function() FzfLua.git_diff({}) end,              desc = "Git diff" },
    { "<leader>gc", function() FzfLua.git_commits({}) end,           desc = "Git commits" },
    { "<leader>gs", function() FzfLua.git_status({}) end,            desc = "Git status" },
    { "<leader>gS", function() FzfLua.git_stash({}) end,             desc = "Git stash" },
    { "<leader>gb", function() FzfLua.git_blame({}) end,             desc = "Git blame" },

    --/lsp
    { "<leader>fr", function() FzfLua.lsp_references({}) end,        desc = "LSP references" },
    { "<leader>fs", function() FzfLua.lsp_document_symbols({}) end,  desc = "LSP symbols" },
    { "<leader>ft", function() FzfLua.lsp_definitions({}) end,       desc = "LSP definitions" },

    --/diagnostics
    { "<leader>fd", function() FzfLua.diagnostics_document({}) end,  desc = "Pick buffer diagnostics" },
    { "<leader>fD", function() FzfLua.diagnostics_workspace({}) end, desc = "Pick all diagnostics" },
  },

  config = function() require('configs.fzf-lua') end,
}
