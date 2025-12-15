vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/lazydev.nvim" },
})

local lazydev = require("lazydev")
local blink = require("blink.cmp")
local lsp = vim.lsp
local set = vim.keymap.set

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
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },
  solidity_ls = {
    cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    filetypes = { "solidity" },
  },
  emmet_language_server = {
    filetypes = {
      "html",
      "css",
      "less",
      "sass",
      "scss",
      "javascriptreact",
      "typescriptreact",
      "elixir",
      "heex",
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
  set("n", "<leader>ih", function()
    lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
  end, { desc = "Inlay hints" })
end

set("n", "<leader>F", lsp.buf.format, { desc = "Format the current file" })
set("n", "<leader>rn", lsp.buf.rename, { desc = "Rename symmbol" })
set("n", "<leader>ca", lsp.buf.code_action, { desc = "Code action" })
set("v", "<leader>ca", lsp.buf.code_action, { desc = "Code action" })
set("n", "gI", lsp.buf.implementation, { desc = "Go to implementation" })
set("i", "<C-s>", lsp.buf.signature_help, { desc = "Trigger signature help" })
set("n", "gd", lsp.buf.definition, { desc = "Go to definition" })
set("n", "gD", lsp.buf.declaration, { desc = "Go to declaration" })
set("n", "gT", lsp.buf.type_definition, { desc = "Go to type" })
set("n", "gW", lsp.buf.workspace_symbol, { desc = "Go to workspace symbols" })
set("n", "g0", lsp.buf.document_symbol, { desc = "Go to document symbol" })
