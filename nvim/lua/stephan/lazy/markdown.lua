return {
  -- install with yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.cmd [[let g:mkdp_auto_start = 0]]
      vim.cmd [[let g:mkdp_auto_close = 1]]
      vim.cmd [[let g:mkdp_browser = 'firefox']]
      vim.cmd [[let g:mkdp_theme = 'dark']]
      vim.cmd [[function OpenMarkdownPreview (url)
          execute "silent ! firefox --new-window " . a:url
      endfunction]]
      vim.cmd [[let g:mkdp_browserfunc = 'OpenMarkdownPreview']]
    end,
    vim.api.nvim_set_keymap('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true }),
  },
}
