-- Custom function to compile with notes
local function compile_notes_version()
  local shownotestrue = [[\shownotestrue]]
  local shownotesfalse = [[\shownotesfalse]]

  local original_buffer = vim.api.nvim_get_current_buf()
  local save_cursor = vim.fn.getcurpos()

  local basename = vim.fn.expand '%:r'
  local filename = vim.fn.expand '%:p'

  -- Create a temporary copy
  local notes_file = basename .. '_notes.tex'
  vim.fn.system(string.format('cp %s %s', vim.fn.shellescape(filename), vim.fn.shellescape(notes_file)))
  vim.cmd('edit ' .. vim.fn.fnameescape(notes_file))
  local notes_buffer = vim.api.nvim_get_current_buf()

  vim.cmd 'normal! gg'
  local set_shownotestrue = false
  local set_shownotesfalse = false
  local line_count = vim.fn.line '$'

  -- Modify the file (comment out shownotes)
  for line_num = 1, line_count do
    local line_content = vim.fn.getline(line_num)
    if line_content:find(shownotestrue, 1, true) then
      vim.fn.setline(line_num, shownotestrue)
      set_shownotestrue = true
    end
    if line_content:find(shownotesfalse, 1, true) then
      vim.fn.setline(line_num, '% ' .. shownotesfalse)
      set_shownotesfalse = true
    end
    if set_shownotestrue and set_shownotesfalse then
      break
    end
  end
  vim.cmd 'write'

  -- Wait for compilation to finish
  local compilation_done = false
  local compilation_success = false
  local cleanup_group = vim.api.nvim_create_augroup('VimtexNotesCleanup', { clear = true })

  -- Listen for compilation success
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VimtexEventCompileSuccess',
    group = cleanup_group,
    once = true,
    callback = function()
      compilation_done = true
      compilation_success = true
    end,
  })

  -- Listen for compilation failure
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VimtexEventCompileFailed',
    group = cleanup_group,
    once = true,
    callback = function()
      compilation_done = true
      compilation_success = false
    end,
  })

  -- Compile file
  vim.cmd 'VimtexCompile'

  -- Wait for compilation to finish (check every 500ms, max 60 seconds)
  local max_wait = 120 -- 60 seconds total
  local waited = 0
  while not compilation_done and waited < max_wait do
    vim.cmd 'sleep 500m'
    waited = waited + 1
  end

  -- Clean up autocommands
  vim.api.nvim_del_augroup_by_id(cleanup_group)

  -- Restore (clean aux files + delete .tex file)
  vim.cmd 'VimtexClean'
  vim.api.nvim_buf_delete(notes_buffer, { force = true })
  vim.fn.delete(notes_file)

  -- Restore original buffer + cursor
  vim.api.nvim_set_current_buf(original_buffer)
  vim.fn.setpos('.', save_cursor)

  -- Print result
  if compilation_done then
    if compilation_success then
      print('Successfully compiled notes version as ' .. basename .. '_notes.pdf')
    else
      print 'Compilation failed for notes version'
    end
  else
    print 'Compilation timeout - cleaned up anyway'
  end
end

return {
  -- vim Plugin
  {
    -- https://castel.dev/post/lecture-notes-1/
    'lervag/vimtex',
    ft = { 'tex', 'latex' },
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_mode = 0
      -- To conceal all latex symbols
      vim.g.vimtex_syntax_conceal_disable = 1
      --vim.o.conceallevel = 2
      --vim.g.tex_conceal = 'abdg'
      vim.g.vimtex_compiler_latexmk = {
        build_dir = 'build',
        callback = 1,
        continuous = 0,
        executable = 'latexmk',
        options = {
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
          '-xelatex',
        },
      }
    end,
    config = function()
      vim.keymap.set('n', '<localleader>lc', '<cmd>VimtexClean<cr>', { desc = 'Clean aux files' })
      -- Hide shownotes
      vim.keymap.set('n', '<localleader>lnn', function()
        local shownotestrue = [[\shownotestrue]]
        local shownotesfalse = [[\shownotesfalse]]

        -- Save current cursor position
        local save_cursor = vim.fn.getcurpos()
        vim.cmd 'normal! gg'

        local set_shownotestrue = false
        local set_shownotesfalse = false
        local line_count = vim.fn.line '$'
        for line_num = 1, line_count do
          local line_content = vim.fn.getline(line_num)
          if line_content:match(shownotestrue) then
            vim.fn.setline(line_num, '% ' .. shownotestrue)
            set_shownotestrue = true
          end
          if line_content:match(shownotesfalse) then
            vim.fn.setline(line_num, shownotesfalse)
            set_shownotesfalse = true
          end
          if set_shownotestrue and set_shownotesfalse then
            break
          end
        end

        -- Restore cursor position
        vim.fn.setpos('.', save_cursor)
      end, { desc = 'Comment out condition to show notes' })
      -- Show notes
      vim.keymap.set('n', '<localleader>lny', function()
        local shownotestrue = [[\shownotestrue]]
        local shownotesfalse = [[\shownotesfalse]]

        -- Save current cursor position
        local save_cursor = vim.fn.getcurpos()
        vim.cmd 'normal! gg'

        local set_shownotestrue = false
        local set_shownotesfalse = false
        local line_count = vim.fn.line '$'
        for line_num = 1, line_count do
          local line_content = vim.fn.getline(line_num)
          if line_content:match(shownotestrue) then
            vim.fn.setline(line_num, shownotestrue)
            set_shownotestrue = true
          end
          if line_content:match(shownotesfalse) then
            vim.fn.setline(line_num, '% ' .. shownotesfalse)
            set_shownotesfalse = true
          end
          if set_shownotestrue and set_shownotesfalse then
            break
          end
        end
        -- Restore cursor position
        vim.fn.setpos('.', save_cursor)
      end, { desc = 'Uncomment condition to show notes' })
    end,
  },
  -- Create the Vim command
  vim.api.nvim_create_user_command('VimtexCompileNotes', compile_notes_version, {
    desc = 'Compile LaTeX file without notes as $name-notes.pdf',
  }),
}
