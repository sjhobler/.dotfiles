-- Send snippets to terminal
vim.g.slime_target = 'tmux'
-- vim.g.slime_default_config = {"socket_name" = "default", "target_pane" = "{last}"}
vim.g.slime_default_config = {
  -- Lua doesn't have a string split function!
  socket_name = vim.api.nvim_eval 'get(split($TMUX, ","), 0)',
  target_pane = ':.2',
  -- target_pane = '{top-right}',
}

vim.g.slime_cell_delimiter = '#%%'
vim.keymap.set('n', '<C-c><C-s>', '<Plug>SlimeSendCell', { desc = 'Send Cell block', noremap = false })
