-- Transparent editing of GPG-encrypted files in Neovim
-- Based on the classic Vimscript by Wouter Hanegraaff
-- Drop this file into: ~/.config/nvim/plugin/gpg.lua   (or require from lua/)
-- Requires: gpg in PATH (GnuPG)

-- Safety: bail early if gpg isn't available
if vim.fn.executable("gpg") ~= 1 then
  vim.schedule(function()
    vim.notify("[gpg.lua] 'gpg' not found in PATH; encrypted editing disabled.", vim.log.levels.WARN)
  end)
  return
end

local group = vim.api.nvim_create_augroup("EncryptedGPG", { clear = true })

-- Helpers to run the same filter-commands the Vimscript used
local function decrypt_current_buffer()
  -- Filter whole buffer through `gpg --decrypt`
  vim.cmd([[silent keepjumps keepmarks '[,']!gpg --decrypt 2> /dev/null]])
end

local function encrypt_current_buffer_self()
  -- Filter whole buffer through `gpg --default-recipient-self -ae`
  vim.cmd([[silent keepjumps keepmarks '[,']!gpg --default-recipient-self -ae 2> /dev/null]])
end

-- Before reading *.gpg: lock down settings that could leak plaintext
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  group = group,
  pattern = "*.gpg",
  callback = function(args)
    -- Buffer-local protections
    vim.bo[args.buf].swapfile = false -- no swap (plaintext could leak)
    vim.bo[args.buf].undofile = false -- no persistent undo
    -- vim.bo[args.buf].backup      = false -- no backups
    -- vim.bo[args.buf].writebackup = false -- no write backups
    vim.bo[args.buf].bin      = true -- read as binary, like original script

    -- Global (session) protection: avoid writing shada (viminfo successor)
    -- NOTE: This is global, like the original `set viminfo=`. We save & restore.
    if vim.g._gpg_saved_shada == nil then
      vim.g._gpg_saved_shada = vim.o.shada
      vim.o.shada = "" -- don't record/register anything to shada file while editing
    end
  end,
})

-- After reading: decrypt and switch back from binary
vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  group = group,
  pattern = "*.gpg",
  callback = function(args)
    -- Decrypt file contents into the buffer
    decrypt_current_buffer()

    -- Return to normal (text) mode
    vim.bo[args.buf].bin = false

    -- Some plugins expect BufReadPost on the "base name" (like the Vimscript did).
    -- This mirrors: :doautocmd BufReadPost %:r
    local base = vim.fn.expand("%:r")
    if base and base ~= "" then
      pcall(vim.cmd.doautocmd, "BufReadPost " .. base)
    end
  end,
})

-- Before write: encrypt buffer so that what gets written is ciphertext
vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
  group = group,
  pattern = "*.gpg",
  callback = function()
    encrypt_current_buffer_self()
  end,
})

-- After write: immediately undo the encryption change in the buffer
vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
  group = group,
  pattern = "*.gpg",
  callback = function(args)
    -- Undo the last change (which was the encryption filter), restoring plaintext
    -- Use :silent and :noautocmd to avoid side effects
    vim.cmd([[silent noautocmd undo]])

    -- If this was the last *.gpg buffer, restore shada
    -- (We restore when no other listed buffers match *.gpg)
    local any_gpg = false
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name:match("%.gpg$") then
          any_gpg = true
          break
        end
      end
    end
    if not any_gpg and vim.g._gpg_saved_shada ~= nil then
      vim.o.shada = vim.g._gpg_saved_shada
      vim.g._gpg_saved_shada = nil
    end
  end,
})

-- Also restore shada when leaving Neovim in case a *.gpg buffer stays open
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = group,
  callback = function()
    if vim.g._gpg_saved_shada ~= nil then
      vim.o.shada = vim.g._gpg_saved_shada
      vim.g._gpg_saved_shada = nil
    end
  end,
})
