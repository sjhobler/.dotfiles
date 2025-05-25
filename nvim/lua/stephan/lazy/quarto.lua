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

    vim.keymap.set('n', '<leader>qi', 'o```{python}\n```<esc>O', { desc = '[Q]uarto [I]nsert Python Code Chunk' }),
    vim.keymap.set('n', '<leader>qr', 'o```{r}\n```<esc>O', { desc = '[Q]uarto Insert [R] Code Chunk' }),
    vim.keymap.set('n', '<leader>qj', 'o```{julia}\n```<esc>O', { desc = '[Q]uarto Insert [J]ulia Code Chunk' }),
    -- vim.keymap.set('n', '<leader>qs', 'o```{python}\n%%stata\n```<esc>O', { desc = '[Q]uarto Insert [S]tata Code Chunk' }),
    vim.keymap.set('n', '<leader>qs', 'o```{stata}\n```<esc>O', { desc = '[Q]uarto Insert [S]tata Code Chunk' }),

    vim.keymap.set('n', '<leader>ch', '<cmd>set conceallevel=1<cr>', { desc = '[C]onceal Levels [H]ide' }),
    vim.keymap.set('n', '<leader>cv', '<cmd>set conceallevel=0<cr>', { desc = '[C]onceal Levels [V]isible' }),
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
