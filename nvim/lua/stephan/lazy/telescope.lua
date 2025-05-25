return {
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0' },
    },
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

      -- Optional: Fuzzy finder for LSP symbols and tags
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

      'nvim-lua/plenary.nvim',
      'kkharji/sqlite.lua',
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        defaults = {
          path_display = {
            'smart',
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          ['media_files'] = {
            -- filetypes whitelist
            -- defaults to the following
            -- filetypes = {
            --   'png', 'jpg', 'mp4', 'webm', 'pdf', 'epub', 'mp3', 'ogg', 'm4a', 'flac',
            --   'zip', 'tar.gz', 'tar.bz2', 'rar', '7z'
            -- },
            filetypes = { 'pdf', 'png', 'jpg', 'jpeg' },
            find_cmd = 'rg', -- find command (defaults to `fd`)
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'file_browser')
      pcall(require('telescope').load_extension, 'live_grep_args')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })
      --vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
      -- open file_browser with the path of the current buffer
      vim.keymap.set('n', '<space>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')
      vim.keymap.set('n', '<leader>fi', '<cmd>AdvancedGitSearch<CR>', { desc = '[F]ind [I]n Git' })
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files cwd=', { desc = '[F]ind [F]iles In' })
      vim.keymap.set('n', '<leader>sa', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = '[S]earch by Grep [A]rgs' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      -- Shortcut for searching
      vim.keymap.set('n', '<leader>fg', function()
        builtin.live_grep {
          prompt_title = 'Live Grep in All Files',
        }
      end, { desc = '[S]earch [/] in All Files' })
    end,
  },
}
