-- Define the function to create a new file from a template
_G.new_file_from_template = function()
  local template_dir = vim.fn.expand '~/.config/templates' -- Expand '~' to the full path
  require('telescope.builtin').find_files {
    prompt_title = 'Select a Template',
    cwd = template_dir,
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local action_state = require 'telescope.actions.state'
        local actions = require 'telescope.actions'
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        -- Open the selected file as a new unsaved buffer
        local selected_file = entry.path
        local new_file = vim.fn.input('New file name: ', '', 'file')
        if new_file ~= '' then
          vim.cmd('edit ' .. new_file)
          vim.cmd('0read ' .. selected_file) -- Preload template
        end
      end)
      return true
    end,
  }
end

_G.read_file_from_template = function()
  local template_dir = vim.fn.expand '~/.config/templates' -- Expand '~' to the full path
  require('telescope.builtin').find_files {
    prompt_title = 'Select a Template',
    cwd = template_dir,
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local action_state = require 'telescope.actions.state'
        local actions = require 'telescope.actions'
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        -- Open the selected file as a new unsaved buffer
        local selected_file = entry.path
        vim.cmd('0read ' .. selected_file .. ' | normal! G') -- Paste in template
      end)
      return true
    end,
  }
end

_G.view_template = function()
  local template_dir = vim.fn.expand '~/.config/templates' -- Expand '~' to the full path
  require('telescope.builtin').find_files {
    prompt_title = 'Select a Template',
    cwd = template_dir,
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local action_state = require 'telescope.actions.state'
        local actions = require 'telescope.actions'
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        -- Open the selected file as a new unsaved buffer
        vim.cmd 'enew' -- Create a new buffer
        local selected_file = entry.path
        vim.cmd('0read ' .. selected_file) -- Paste in template
        vim.cmd '1delete' -- Remove the first empty line
        vim.bo.modified = false -- Mark buffer as unmodified
      end)
      return true
    end,
  }
end

return {
  {
    -- Map the keybinding to trigger the function
    vim.keymap.set('n', '<leader>st', '<cmd>lua new_file_from_template()<CR>', { desc = '[S]earch [T]emplates', noremap = true, silent = true }),
    vim.keymap.set('n', '<leader>rt', '<cmd>lua read_file_from_template()<CR>', { desc = '[R]ead [T]emplates', noremap = true, silent = true }),
    vim.keymap.set('n', '<leader>vt', '<cmd>lua view_template()<CR>', { desc = '[V]iew [T]emplates', noremap = true, silent = true }),
    vim.keymap.set('n', '<leader>pt', function()
      local builtin = require 'telescope.builtin'
      builtin.find_files { cwd = vim.fn.expand '~/.config/templates' }
    end, { desc = '[P]ick [T]template files' }),
  },
}
