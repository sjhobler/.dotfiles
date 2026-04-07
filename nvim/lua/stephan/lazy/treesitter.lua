return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    branch = 'main',
    build = ':TSUpdate',
    ---@class TSConfig
    opts = {
      -- custom handling of parsers
      ensure_installed = {
        'bash',
        'c',
        'html',
        'jsdoc',
        'json',
        'json5',
        'lua',
        'markdown',
        'matlab',
        'julia',
        'markdown_inline',
        'python',
        'regex',
        'r',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
        'ruby',
      },
    },
    config = function(_, opts)
      -- install parsers from custom opts.ensure_installed
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        require('nvim-treesitter').install(opts.ensure_installed)
        -- register and start parsers for filetypes
        for _, parser in ipairs(opts.ensure_installed) do
          local filetypes = parser -- In this case, parser is the filetype/language name
          vim.treesitter.language.register(parser, filetypes)

          vim.api.nvim_create_autocmd({ 'FileType' }, {
            pattern = filetypes,
            callback = function(event)
              vim.treesitter.start(event.buf, parser)
            end,
          })
        end
      end

      -- Auto-install and start parsers for any buffer
      vim.api.nvim_create_autocmd({ 'BufRead' }, {
        callback = function(event)
          local bufnr = event.buf
          local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })

          -- Skip if no filetype
          if filetype == '' then
            return
          end

          -- Check if this filetype is already handled by explicit opts.ensure_installed config
          for _, filetypes in pairs(opts.ensure_installed) do
            local ft_table = type(filetypes) == 'table' and filetypes or { filetypes }
            if vim.tbl_contains(ft_table, filetype) then
              return -- Already handled above
            end
          end

          -- Get parser name based on filetype
          local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
          if not parser_name then
            return
          end
          -- Try to get existing parser (helpful check if filetype was returned above)
          local parser_configs = require 'nvim-treesitter.parsers'
          if not parser_configs[parser_name] then
            return -- Parser not available, skip silently
          end

          local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

          if not parser_installed then
            -- If not installed, install parser synchronously
            require('nvim-treesitter').install({ parser_name }):wait(30000)
          end

          -- let's check again
          parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

          if parser_installed then
            -- Start treesitter for this buffer
            vim.treesitter.start(bufnr, parser_name)
          end
        end,
      })
    end,
  },
}

-- return {
--   { -- Highlight, edit, and navigate code
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--     -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--     opts = {
--       ensure_installed = {
--         'bash',
--         'c',
--         'diff',
--         'html',
--         'lua',
--         'luadoc',
--         'markdown',
--         'markdown_inline',
--         'query',
--         'vim',
--         'vimdoc',
--         'julia',
--         'python',
--         'r',
--         'rust',
--         'typescript',
--         'yaml',
--         'latex',
--       },
--       -- Autoinstall languages that are not installed
--       auto_install = true,
--       highlight = {
--         enable = true,
--         -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--         --  If you are experiencing weird indenting issues, add the language to
--         --  the list of additional_vim_regex_highlighting and disabled languages for indent.
--         additional_vim_regex_highlighting = { 'ruby' },
--         disable = { 'latex' }, -- disable latex highlighting use vimtex instead (allows for concealing)
--       },
--       indent = { enable = true, disable = { 'ruby' } },
--       -- There are additional nvim-treesitter modules that you can use to interact
--       -- with nvim-treesitter. You should go explore a few and see what interests you:
--       --
--       --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--       --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--       --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--       textobjects = {
--         select = {
--           enable = true,

--           -- Automatically jump forward to textobj, similar to targets.vim
--           lookahead = true,

--           keymaps = {
--             -- You can use the capture groups defined in textobjects.scm
--             ['af'] = '@function.outer',
--             ['if'] = '@function.inner',
--             ['ac'] = '@class.outer',
--             -- You can optionally set descriptions to the mappings (used in the desc parameter of
--             -- nvim_buf_set_keymap) which plugins like which-key display
--             ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
--             -- You can also use captures from other query groups like `locals.scm`
--             ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
--           },
--           -- You can choose the select mode (default is charwise 'v')
--           --
--           -- Can also be a function which gets passed a table with the keys
--           -- * query_string: eg '@function.inner'
--           -- * method: eg 'v' or 'o'
--           -- and should return the mode ('v', 'V', or '<c-v>') or a table
--           -- mapping query_strings to modes.
--           selection_modes = {
--             ['@parameter.outer'] = 'v', -- charwise
--             ['@function.outer'] = 'V', -- linewise
--             ['@class.outer'] = '<c-v>', -- blockwise
--           },
--           -- If you set this to `true` (default is `false`) then any textobject is
--           -- extended to include preceding or succeeding whitespace. Succeeding
--           -- whitespace has priority in order to act similarly to eg the built-in
--           -- `ap`.
--           --
--           -- Can also be a function which gets passed a table with the keys
--           -- * query_string: eg '@function.inner'
--           -- * selection_mode: eg 'v'
--           -- and should return true or false
--           include_surrounding_whitespace = true,
--         },
--       },
--     },
--     dependencies = {
--       'nvim-treesitter/nvim-treesitter-textobjects',
--     },
--   },
-- }
