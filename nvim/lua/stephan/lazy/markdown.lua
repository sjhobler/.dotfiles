return {
  {
    'iamcco/markdown-preview.nvim',
    config = function()
      vim.fn['mkdp#util#install']()
    end,
    vim.api.nvim_set_keymap('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true }),
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      code = {
        sign = false,
        width = 'block',
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = false,
      },
    },
    ft = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
    config = function(_, opts)
      require('render-markdown').setup(opts)
      Snacks.toggle({
        name = 'Render Markdown',
        get = function()
          return require('render-markdown.state').enabled
        end,
        set = function(enabled)
          local m = require 'render-markdown'
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map '<leader>um'
    end,
  },
}
