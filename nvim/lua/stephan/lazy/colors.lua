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
  local colors = get_catpuccin_palette()

  local TelescopeColor = {
    TelescopeNormal = { bg = colors.base },
    TelescopeSelection = { bg = colors.surface0, bold = true },
    TelescopePromptPrefix = { bg = colors.base },
    TelescopePromptNormal = { bg = colors.base },
    TelescopePromptNormal = { bg = colors.base },
    TelescopeResultsNormal = { bg = colors.base },
    TelescopePreviewNormal = { bg = colors.base },
    TelescopePromptBorder = { bg = colors.base },
    TelescopeResultsBorder = { bg = colors.base },
    TelescopePreviewBorder = { bg = colors.base },
  }

  for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
  end

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
end

function TransparentMyPencils(color)
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

  -- set line numbering to transparent
  vim.cmd [[
    highlight LineNr guibg=NONE
    highlight CursorLineNr guibg=NONE
    highlight GitGutterAdd guibg=NONE ctermbg=NONE
    highlight GitGutterChange guibg=NONE ctermbg=NONE
    highlight GitGutterDelete guibg=NONE ctermbg=NONE
    highlight NvimTreeNormal guibg=NONE ctermbg=NONE
    highlight NormalFloat guibg=NONE ctermbg=NONE
  ]]

  -- Change conceal color
  vim.api.nvim_set_hl(0, 'Conceal', { fg = normal_color, ctermfg = normal_color })
end

function BlackOutPencils(color)
  -- Set the background to transparent (use same as terminal)
  vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'VertSplit', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'TabLine', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'TabLineFill', { bg = '#000000' })
  vim.api.nvim_set_hl(0, 'TabLineSel', { bg = '#000000' })

  -- Telescope
  local TelescopeColor = {
    TelescopeNormal = { bg = '#000000' },
    TelescopeSelection = { bg = '#000000', bold = true },
    TelescopePromptPrefix = { bg = '#000000' },
    TelescopePromptNormal = { bg = '#000000' },
    TelescopePromptNormal = { bg = '#000000' },
    TelescopeResultsNormal = { bg = '#000000' },
    TelescopePreviewNormal = { bg = '#000000' },
    TelescopePromptBorder = { bg = '#000000' },
    TelescopeResultsBorder = { bg = '#000000' },
    TelescopePreviewBorder = { bg = '#000000' },
  }

  for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

function get_catpuccin_palette()
  return {
    rosewater = '#f5e0dc',
    flamingo = '#f2cdcd',
    pink = '#f5c2e7',
    mauve = '#cba6f7',
    red = '#f38ba8',
    maroon = '#eba0ac',
    peach = '#fab387',
    yellow = '#f9e2af',
    green = '#a6e3a1',
    teal = '#94e2d5',
    sky = '#89dceb',
    sapphire = '#74c7ec',
    blue = '#89b4fa',
    lavender = '#b4befe',
    text = '#cdd6f4',
    subtext1 = '#bac2de',
    subtext0 = '#a6adc8',
    overlay2 = '#9399b2',
    overlay1 = '#7f849c',
    overlay0 = '#6c7086',
    surface2 = '#585b70',
    surface1 = '#45475a',
    surface0 = '#313244',
    base = '#1e1e2e',
    mantle = '#181825',
    crust = '#11111b',
  }
end

return {

  { -- You can easily change to a different colorscheme.
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

    'rebelot/kanagawa.nvim', -- inspired by colors of Katsushika Hokusai
    -- 'RRethy/base16-nvim', -- for the gruvbox-material colorscheme
    -- 'catppuccin/nvim',
    -- 'vague2k/vague.nvim',

    -- 'home/stephan/.config/nvim/colors/base16-black-metal-bathory.vim',
    -- 'folke/tokyonight.nvim',
    -- { 'rose-pine/neovim', name = 'rose_pine' },
    -- 'datsfilipe/vesper.nvim',
    -- 'EdenEast/nightfox.nvim',
    -- 'AlexvZyl/nordic.nvim',
    --'sainnhe/gruvbox-material',
    -- 'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        theme = 'dragon', -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = 'dragon', -- try "dragon" !
          light = 'lotus',
        },
      }
      vim.cmd.colorscheme 'kanagawa'
      -- vim.cmd.colorscheme 'catppuccin-macchiato'
      -- vim.cmd.colorscheme 'vague'

      -- vim.cmd.colorscheme 'base16-black-metal-bathory'
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
      --vim.cmd.colorscheme 'vesper'
      -- vim.cmd.colorscheme 'base16-rose-pine'
      -- vim.cmd.colorscheme 'nordfox'
      -- vim.cmd.colorscheme 'nordic'
      -- vim.g.gruvbox_material_enable_italic = true
      -- vim.cmd.colorscheme 'gruvbox-material'
      -- vim.cmd.colorscheme 'gruvbox'
      -- vim.cmd.colorscheme 'base16-nord'
      -- vim.cmd.colorscheme 'base16-default-dark'
      -- vim.cmd.colorscheme 'base16-tomorrow-night'
      -- vim.cmd.colorscheme 'base16-railscasts'
      -- vim.cmd.colorscheme 'base16-ocean'
      -- vim.cmd.colorscheme 'base16-catppuccin-mocha'
      -- vim.cmd.colorscheme 'base16-gruvbox-material-dark-hard'

      --vim.g.transparent_enabled = true
      TransparentMyPencils()
      -- ColorMyPencils()
    end,

    -- opts = {
    --  transparent = true,
    --  styles = {
    --    sidebars = "transparent",
    --    floats = "transparent",
    --  },
    -- },
  },
  -- {
  --   'folke/tokyonight.nvim',
  --   name = 'tokyonight-night',
  --   priority = 1000,
  -- },
  {
    'wtfox/jellybeans.nvim',
    opts = {}, -- Optional
    --     init = function()
    --       vim.cmd [[colorscheme jellybeans-mono]]
    --       TransparentMyPencils()
    --     end,
  },
  {
    'RRethy/base16-nvim', -- for the gruvbox-material colorscheme
    priority = 1000,
  },
  {
    'vague2k/vague.nvim',
    priority = 1000,
  },
  {
    'slugbyte/lackluster.nvim',
    priority = 1000,
  },

  -- Switch between colorschemes
  vim.keymap.set('n', '<leader>ccc', function()
    local colorschemes = {
      'catppuccin-macchiato',
      'base16-gruvbox-material-dark-hard',
      'base16-black-metal-bathory',
      'vague',
      'lackluster',
      'kanagawa',
      'jellybeans-mono',
      -- Add more colorschemes here
    }

    vim.ui.select(colorschemes, {
      prompt = 'Select colorscheme',
    }, function(choice)
      if choice then
        vim.cmd.colorscheme(choice)
        if choice == 'catppuccin-macchiato' then
          ColorMyPencils()
        elseif choice == 'base16-black-metal-bathory' then
          BlackOutPencils()
        elseif choice == 'base16-black-metal-bathory' then
          BlackOutPencils()
        end
      end
    end)
  end, { desc = 'Select colorscheme' }),
}
