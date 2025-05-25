return {
  vim.keymap.set('n', '<leader>fd', function()
    require('telescope.builtin').live_grep {
      search_dirs = { '/home/stephan/Dropbox/LSE/JMP/02_Data/01_labor_data (Selective Sync Conflict)/IAB/iab-utils/frequencies' },
    }
  end, { noremap = true, silent = true }),
}
