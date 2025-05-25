return {
  -- fil-browser
  {
    'stevearc/oil.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      send_to_trash = true, -- enable trash support
      view_options = {
        show_hidden = false,
        is_hidden_file = function(name, _) -- define what hidden files are
          return vim.endswith(name, '.aux')
            or vim.endswith(name, '.fdb_latexmk')
            or vim.endswith(name, '.fls')
            or vim.endswith(name, '.out')
            or vim.endswith(name, 'synctex.gz')
        end,
      },
      keymaps = {
        ['<C-d>'] = {
          callback = function()
            detail = not detail
            local cols = { 'icon' }
            if detail then
              cols = { 'icon', 'permissions', 'size', 'mtime' }
            end
            require('oil').set_columns(cols)
          end,
        },
      },
    },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
  },
}
