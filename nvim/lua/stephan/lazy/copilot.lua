return {
  -- {
  --   'github/copilot.vim',
  --   lazy = false,
  --   -- config = function()  -- Mapping tab is already used by NvChad
  --   --   vim.g.copilot_no_tab_map = true;
  --   --   vim.g.copilot_assume_mapped = true;
  --   --   vim.g.copilot_tab_fallback = "";
  --   -- -- The mapping is set to other key, see custom/lua/mappings
  --   -- -- or run <leader>ch to see copilot mapping section
  --   -- end
  -- },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
          debounce = 25,
          keymap = {
            accept_word = '<C-j>',
            accept = '<M-l>',
          },
        },
        enabled = true,
      }
    end,
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
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
      model = 'claude-3.7-sonnet',
    },
    config = function(_, opts)
      local chat = require 'CopilotChat'
      chat.setup(opts)

      -- Disable any additional highlighting
      vim.cmd [[
          highlight CopilotChatSelection guibg=NONE guifg=NONE
          highlight CopilotChatPrompt guibg=NONE guifg=NONE
        ]]

      -- Keymap definitions
      vim.keymap.set({ 'n', 'v' }, '<leader>ai', '<cmd>CopilotChatOpen<CR>', { desc = '[A]rtificial [I]ntelligence' })
      vim.keymap.set('n', '<leader>cm', '<cmd>CopilotChatModels<CR>', { desc = '[C]opilot [M]odels' })

      -- Quick chat with Copilot
      vim.keymap.set('n', '<leader>ccq', function()
        local input = vim.fn.input 'Quick Chat: '
        if input ~= '' then
          require('CopilotChat').ask(input, {
            selection = require('CopilotChat.select').buffer,
            window = {
              layout = 'vertical',
              relative = 'editor',
              border = 'rounded',
              width = 0.35,
              height = math.floor(vim.o.lines * 0.5),
              row = math.floor(vim.o.lines * 0.25),
              col = math.floor(vim.o.columns * 0.5), -- Define col
            },
          })
        end
      end, { desc = '[C]opilot[C]hat - [Q]uick chat' })

      -- TODO: add diagonostics support and bind to <leader>ad
      vim.keymap.set({ 'n', 'v' }, '<leader>ad', function()
        local diagnostics = vim.diagnostic.get()
        if #diagnostics > 0 then
          local diagnostic_messages = {}
          for _, diagnostic in ipairs(diagnostics) do
            table.insert(diagnostic_messages, diagnostic.message)
          end
          local input = table.concat(diagnostic_messages, '\n')
          require('CopilotChat').ask(input, {
            selection = require('CopilotChat.select').buffer,
            window = {
              layout = 'vertical',
              relative = 'editor',
              border = 'rounded',
              width = 0.35,
              height = math.floor(vim.o.lines * 0.5),
              row = math.floor(vim.o.lines * 0.25),
              col = math.floor(vim.o.columns * 0.5),
            },
          })
        else
          print 'No diagnostics available'
        end
      end, { desc = '[A]sk [D]iagnostics' })

      vim.keymap.set('v', '<leader>ccp', function()
        local actions = require 'CopilotChat.actions'
        require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
      end, { desc = 'CopilotChat - Prompt actions' })
    end,
  },
}
