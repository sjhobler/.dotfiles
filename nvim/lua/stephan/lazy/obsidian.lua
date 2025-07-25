return {
  -- obidian note taking
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },

    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/Documents/Obsidian/personal',
        },
        {
          name = 'work',
          path = '~/Documents/Obsidian/work',
        },
      },

      ui = { enable = false },

      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart { 'xdg-open', url } -- linux
      end,
    },

    -- see below for full list of options
    --},
    init = function()
      vim.opt.conceallevel = 2
    end,
  },
  vim.keymap.set('n', '<leader>fog', function()
    require('telescope.builtin').live_grep {
      search_dirs = { '~/Documents/Obsidian/work' },
    }
  end, { noremap = true, silent = true, desc = 'Search in Obsidian notes' }),
  vim.keymap.set('n', '<leader>fof', function()
    require('telescope.builtin').find_files {
      search_dirs = { '~/Documents/Obsidian/work' },
    }
  end, { noremap = true, silent = true, desc = 'Find files in Obsidian notes' }),
}
