-- Send snippets to terminal
vim.g.slime_target = 'tmux'
-- vim.g.slime_default_config = {"socket_name" = "default", "target_pane" = "{last}"}
vim.g.slime_default_config = {
  -- Lua doesn't have a string split function!
  socket_name = vim.api.nvim_eval 'get(split($TMUX, ","), 0)',
  target_pane = ':.1',
  -- target_pane = '{top-right}',
}

vim.g.slime_cell_delimiter = '#%%'
vim.keymap.set('n', '<C-c><C-s>', '<Plug>SlimeSendCell', { desc = 'Send Cell block', noremap = false })

-- -- Overriding the default mappings
-- local function toggle_slime_target()
--   if vim.g.slime_target == 'tmux' then
--     vim.g.slime_target = 'neovim'
--     print 'Slime target: neovim'
--   else
--     vim.g.slime_target = 'tmux'
--     print 'Slime target: tmux'
--   end
-- end

-- -- Set up key mappings
-- vim.keymap.set('n', '<leader>ts', toggle_slime_target, { desc = '[T]oggle [S]lime Target' })
