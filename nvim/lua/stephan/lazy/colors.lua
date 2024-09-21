function ColorMyPencils(color)
  -- color = color or 'rose-pine'
  -- vim.cmd.colorscheme(color)

  -- Set the background to transparent (use same as terminal)
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TabLine', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'none' })

  -- Telescope
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#000000' })

  -- Set the color for the Telescope prompt
  vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#000000' })

  -- Set the color for the Telescope results
  vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#000000' })

  -- Set the color for the Telescope preview
  vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#000000' })

  -- -- Set the color for the Telescope selection
  -- vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#000000' })
  -- vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { bg = '#000000' })

  -- set line numbering to transparent
  vim.cmd [[
    highlight LineNr guibg=NONE
    highlight CursorLineNr guibg=NONE
    highlight GitGutterAdd guibg=NONE ctermbg=NONE
    highlight GitGutterChange guibg=NONE ctermbg=NONE
    highlight GitGutterDelete guibg=NONE ctermbg=NONE
    highlight NvimTreeNormal guibg=NONE ctermbg=NONE
  ]]

  -- Change conceal color
  vim.api.nvim_set_hl(0, 'Conceal', { fg = normal_color, ctermfg = normal_color })

  -- Change color of comments
  -- vim.cmd [[highlight Comment ctermfg=244 guifg=#5f8787]]
  --vim.cmd [[highlight Comment ctermfg=31 guifg=#0087af]]
end

return {

  { -- You can easily change to a different colorscheme.
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- 'home/stephan/.config/nvim/colors/base16-black-metal-bathory.vim',
    -- 'folke/tokyonight.nvim',
    'RRethy/base16-nvim',
    -- { 'rose-pine/neovim', name = 'rose_pine' },
    -- 'datsfilipe/vesper.nvim',
    --'EdenEast/nightfox.nvim',
    --'catppuccin/nvim',
    --'AlexvZyl/nordic.nvim',
    --'sainnhe/gruvbox-material',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      vim.cmd.colorscheme 'base16-gruvbox-material-dark-hard'
      --vim.cmd.colorscheme 'base16-black-metal-bathory'
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
      --vim.cmd.colorscheme 'vesper'
      --vim.cmd.colorscheme 'base16-rose-pine'
      -- vim.cmd.colorscheme 'nordfox'
      -- vim.cmd.colorscheme 'catppuccin-macchiato'
      -- vim.cmd.colorscheme 'nordic'
      -- vim.g.gruvbox_material_enable_italic = true
      -- vim.cmd.colorscheme 'gruvbox-material'

      --vim.g.transparent_enabled = true
      ColorMyPencils()
    end,

    -- opts = {
    --  transparent = true,
    --  styles = {
    --    sidebars = "transparent",
    --    floats = "transparent",
    --  },
    -- },
  },
}
