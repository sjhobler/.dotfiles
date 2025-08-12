return {
  -- Open floating terminal
  vim.keymap.set('n', '<leader>ft', function()
    local current_dir = vim.fn.expand '%:p:h'

    -- Handle case where there's no file (empty buffer)
    if current_dir == '' or current_dir == '.' then
      current_dir = vim.fn.getcwd()
    end

    local success, _ = pcall(vim.fn.chdir, current_dir)
    if not success then
      current_dir = vim.fn.expand '~'
    end

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
      relative = 'editor',
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
      col = math.floor(vim.o.columns * 0.1),
      row = math.floor(vim.o.lines * 0.1),
      border = 'rounded',
    })

    vim.api.nvim_set_option_value('filetype', 'terminal', { buf = buf })

    -- Start shell in the specific directory
    vim.fn.termopen(vim.o.shell, {
      cwd = current_dir,
      env = vim.fn.environ(),
    })

    -- Auto-close when terminal process exits
    vim.api.nvim_create_autocmd('TermClose', {
      buffer = buf,
      callback = function()
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
          vim.g.floating_term_win = nil
        end)
      end,
    })

    -- Enter insert mode to start typing immediately
    vim.cmd 'startinsert'
  end, { desc = 'Open floating terminal in current file dir' }),
}
