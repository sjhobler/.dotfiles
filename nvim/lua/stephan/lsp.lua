vim.lsp.log.set_level 'warn'

-- Disable Neovim 0.12 built-in LSP completion and default keymaps
-- (we use nvim-cmp for completion and set our own keymaps in snacks.lua)
vim.lsp.config('*', {
  completion = { enable = false },
  keys = false,
})

local julials_config = require 'lsp.julials'
vim.lsp.config('julials', julials_config)
vim.lsp.enable 'julials'
