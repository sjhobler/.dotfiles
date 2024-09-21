return {
  -- quarto-nvim
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },

    config = function()
      local quarto = require 'quarto'
      quarto.setup {
        debug = false,
        closePreviewOnQuit = true,
        lspFeatures = {
          enabled = true,
          chunks = 'curly',
          languages = { 'r', 'python', 'julia', 'bash', 'html' },
          diagnostics = {
            enabled = true,
            triggers = { 'BufWritePost' },
          },
          completion = {
            enabled = true,
          },
        },
        codeRunner = {
          enabled = false,
          default_method = nil, -- 'molten' or 'slime'
          ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
          -- Takes precedence over `default_method`
          never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
        },
      }
    end,

    vim.keymap.set('n', '<leader>qp', '<cmd>QuartoPreview<cr>'),
    vim.keymap.set('n', '<leader>qq', '<cmd>QuartoClosePreview<cr>'),
  },

  -- otter-nvim: lsp features and code completion source for code embedded in other documents
  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
}
