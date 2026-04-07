return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        -- 'julials', -- Julia LSP
        'pyright', -- Used to provide Python LSP
        'ruff', -- Python
        'r_language_server', -- Used to provide R LSP
        'texlab', -- Used to provide LaTeX LSP
        'lua_ls', -- Lus LSP
        -- 'ltex', -- Used to provide LaTeX LSP
      },
      automatic_enable = true,
    },
    dependencies = {
      {
        -- 'williamboman/mason.nvim',
        'mason-org/mason.nvim',
        cmd = { 'Mason' },
        lazy = false,
        config = function()
          require('mason').setup {
            ui = {
              icons = {
                package_installed = '✓',
                package_pending = '…',
                package_uninstalled = '✗',
                package_outdated = '⬆',
              },
            },
          }
        end,
      },
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'eslint_d',
      },
    },
    dependencies = {
      'mason-org/mason.nvim',
    },
  },
}
