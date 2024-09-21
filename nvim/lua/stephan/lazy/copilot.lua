return {
  {
    'github/copilot.vim',
    lazy = false,
    -- config = function()  -- Mapping tab is already used by NvChad
    --   vim.g.copilot_no_tab_map = true;
    --   vim.g.copilot_assume_mapped = true;
    --   vim.g.copilot_tab_fallback = "";
    -- -- The mapping is set to other key, see custom/lua/mappings
    -- -- or run <leader>ch to see copilot mapping section
    -- end
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
      { 'nvim-telescope/telescope.nvim' }, -- Use telescope for help actions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      highlight_selection = false,
      debug = true, -- Enable debugging

      -- See Configuration section for rest
      window = {
        layout = 'vertical', -- ,'float',
        relative = 'cursor',
        border = 'rounded',
        width = 0.35,
        height = 0.5,
        row = nil,
      },
    },

    -- See Commands section for default commands if you want to lazy load on them
    vim.keymap.set('n', '<leader>ai', '<cmd>CopilotChat<CR>', { desc = '[A]rtificial [I]ntelligence' }),
  },
}
