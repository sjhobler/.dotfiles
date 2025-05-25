return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    -- Enable vim-slime for interaction with tmux
    'jpalardy/vim-slime',
  },

  -- Comment things out in nvim
  {
    'tpope/vim-commentary',
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'stata',
        command = 'setlocal commentstring=*//\\ %s',
      })
    end,
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      keywords = {
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX', 'CAVEAT' } },
        QUESTION = { icon = '', color = 'warning', alt = { 'IDEA' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO', 'COMMENT' } },
      },
      merge_keywords = true,
      highlight = {
        comments_only = false,
      },
    },
  },

  {
    'rmagatti/goto-preview',
    event = 'BufEnter',
    dependencies = 'rmagatti/logger.nvim',
    --config = true,

    config = function()
      require('goto-preview').setup {
        width = 120, -- Width of the floating window
        height = 15, -- Height of the floating window
        border = { '↖', '─', '┐', '│', '┘', '─', '└', '│' }, -- Border characters of the floating window
        default_mappings = true, --false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require('telescope.themes').get_dropdown { hide_preview = false },
        },
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true, -- Focus the floating window when opening it.
        dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = 'wipe', -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        preview_window_title = { enable = true, position = 'left' }, -- Whether to set the preview window title as the filename
        zindex = 1, -- Starting zindex for the stack of floating windows
      }
    end,
    --
    --     config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  },

  -- Plenary
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  -- vim be good (practice vim motions)
  {
    'ThePrimeagen/vim-be-good',
    lazy = false,
    config = function()
      vim.g.be_good_do_not_show_message = 1
    end,
  },
}
