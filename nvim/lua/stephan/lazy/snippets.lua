return {
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip').config.setup {
        enable_autosnippets = true,
      }
    end,
  },
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    ft = { 'tex', 'latex' },
    config = function()
      require('luasnip-latex-snippets').setup()
    end,
  },
}
