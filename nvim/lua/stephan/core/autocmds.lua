-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'tex', 'quarto' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
  end,
})

-- Set the highlight groups for inactive windows
vim.cmd 'set winhighlight=Normal:Normal,NormalNC:Normal'

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function(args)
    if args.match == 'kanagawa' then
      SetBackground()
      SetKanagawaHighlights()
    elseif args.match == 'base16-black-metal-bathory' then
      -- SetBackground 'black'
      SetMetalBathoryHighlights()
    else
      SetBackground()
    end
  end,
})
