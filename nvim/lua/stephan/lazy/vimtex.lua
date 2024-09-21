return {
  -- vim Plugin
  {
    -- https://castel.dev/post/lecture-notes-1/
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_mode = 0
      -- To conceal all latex symbols
      vim.g.vimtex_syntax_conceal_disable = 1
      --vim.o.conceallevel = 2
      --vim.g.tex_conceal = 'abdg'
    end,
  },
}
