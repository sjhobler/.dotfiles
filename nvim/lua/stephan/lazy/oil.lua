local detail = false

return {
  -- fil-browser
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'echasnovski/mini.icons' },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
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
            or vim.endswith(name, 'bbl')
            or vim.endswith(name, 'bcf')
            or vim.endswith(name, 'blg')
            or vim.endswith(name, 'run.xml')
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
  },
}
