return {
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('luasnip-latex-snippets').setup()
    end,
  },
}
