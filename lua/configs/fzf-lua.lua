require("fzf-lua").setup({
  actions = {
    files = {
      true,
      ["ctrl-q"] = { fn = FzfLua.actions.file_sel_to_qf, prefix = "select-all" }
    }
  }
})
